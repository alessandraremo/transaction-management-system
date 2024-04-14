using System;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Recording_System
{
    public partial class frmRegistration : Form
    {
        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=";

        public frmRegistration()
        {
            InitializeComponent();

            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            dataGridView1.Columns.Add("name", "Name");
            dataGridView1.Columns.Add("program", "Program");
            dataGridView1.Columns.Add("student_no", "Student No");
            dataGridView1.Columns.Add("address", "Address");
            dataGridView1.Columns.Add("gender", "Gender");
            dataGridView1.Columns.Add("semester", "Semester");
            dataGridView1.Columns.Add("email", "Email");

            DataGridViewButtonColumn printButtonColumn = new DataGridViewButtonColumn();
            printButtonColumn.HeaderText = "";
            printButtonColumn.Text = "Print";
            printButtonColumn.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(printButtonColumn);

            dataGridView1.CellContentClick += async (sender, e) => await dataGridView1_CellContentClickAsync(sender, e);

            DisplayStudentData();
        }

        private void ApplyFilters()
        {
            string selectedSemester = cmbSemester.SelectedItem?.ToString();
            string selectedProgram = cmbProgram.SelectedItem?.ToString();

            dataGridView1.Rows.Clear();

            foreach (DataGridViewRow originalRow in dataGridView1.Rows)
            {
                if (
                    (selectedSemester == null || originalRow.Cells["semester"].Value.ToString() == selectedSemester) &&
                    (selectedProgram == null || originalRow.Cells["program"].Value.ToString() == selectedProgram)
                )
                {
                    dataGridView1.Rows.Add(originalRow.Cells.Cast<DataGridViewCell>().Select(cell => cell.Value).ToArray());
                }
            }
        }

        private async void DisplayStudentData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    await connection.OpenAsync();

                    string query = "SELECT name, program, student_no, address, gender, semester, email FROM students";

                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    await adapter.FillAsync(dataTable);

                    foreach (DataRow row in dataTable.Rows)
                    {
                        dataGridView1.Rows.Add(
                            row["name"].ToString(),
                            row["program"].ToString(),
                            row["student_no"].ToString(),
                            row["address"].ToString(),
                            row["gender"].ToString(),
                            row["semester"].ToString(),
                            row["email"].ToString()
                        );
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while retrieving student data: {ex.Message}");
            }
        }

        private void UpdateComboBoxes()
        {
            var distinctSemesters = dataGridView1.Rows.Cast<DataGridViewRow>()
                .Select(row => row.Cells["semester"].Value?.ToString())
                .Where(value => !string.IsNullOrEmpty(value))
                .Distinct()
                .ToList();

            var distinctPrograms = dataGridView1.Rows.Cast<DataGridViewRow>()
                .Select(row => row.Cells["program"].Value?.ToString())
                .Where(value => !string.IsNullOrEmpty(value))
                .Distinct()
                .ToList();

            cmbSemester.DataSource = distinctSemesters;
            cmbProgram.DataSource = distinctPrograms;

            cmbSemester.SelectedItem = null;
            cmbProgram.SelectedItem = null;
        }


        private async Task dataGridView1_CellContentClickAsync(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
                {
                   
                        if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
                        {
                            string name = dataGridView1.Rows[e.RowIndex].Cells["name"].Value.ToString();
                            string program = dataGridView1.Rows[e.RowIndex].Cells["program"].Value.ToString();
                            string studentNo = dataGridView1.Rows[e.RowIndex].Cells["student_no"].Value.ToString();
                            string address = dataGridView1.Rows[e.RowIndex].Cells["address"].Value.ToString();
                            string gender = dataGridView1.Rows[e.RowIndex].Cells["gender"].Value.ToString();
                            string semester = dataGridView1.Rows[e.RowIndex].Cells["semester"].Value.ToString();
                            string email = dataGridView1.Rows[e.RowIndex].Cells["email"].Value.ToString();

                            string subjectsInfo = await FetchSubjectsInfoAsync(name, program, semester);

                            Print(name, program, studentNo, address, gender, semester, email, subjectsInfo);
                        }
                    
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }
        
        private async Task<string> FetchSubjectsInfoAsync(string name, string program, string semester)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    await connection.OpenAsync();

                    string query = "SELECT DISTINCT course_title, total_units " +
                                   "FROM subjects " +
                                   "WHERE student_name = @name AND student_program = @program AND student_semester = @semester";

                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@program", program);
                    cmd.Parameters.AddWithValue("@semester", semester);

                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    await adapter.FillAsync(dataTable);

                    StringBuilder subjectsInfoBuilder = new StringBuilder();

                    foreach (DataRow row in dataTable.Rows)
                    {
                        string courseTitle = row["course_title"].ToString();
                        string totalUnits = row["total_units"].ToString();

                        subjectsInfoBuilder.AppendLine($"{courseTitle.PadRight(20)}Total Units: {totalUnits}");
                    }

                    return subjectsInfoBuilder.ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while retrieving subject data: {ex.Message}");
                return string.Empty;
            }
        }

        private void Print(string name, string program, string studentNo, string address, string gender, string semester, string email, string subjectsInfo)
        {
            try
            {
                using (PrintDocument pd = new PrintDocument())
                {
                    pd.DefaultPageSettings.Landscape = false;

                    pd.PrintPage += (sender, e) => PrintDocument_PrintPage(sender, e, name, program, studentNo, address, gender, semester, email, subjectsInfo);

                    PrintDialog printDialog = new PrintDialog();
                    printDialog.Document = pd;

                    if (printDialog.ShowDialog() == DialogResult.OK)
                    {
                        pd.Print();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while printing: {ex.Message}");
            }
        }

        private void PrintDocument_PrintPage(object sender, PrintPageEventArgs e, string name, string program, string studentNo, string address, string gender, string semester, string email, string subjectsInfo)
        {
            try
            {
                Font headingFont = new Font("Arial", 16, FontStyle.Bold);
                Font normalFont = new Font("Arial", 12);
                Brush brush = Brushes.Black;
                float x = e.MarginBounds.Left;
                float y = e.MarginBounds.Top;
                float lineHeight = normalFont.GetHeight() + 2;

                Image headerImage = Properties.Resources.CDM; 

                float centerOffsetImage = (e.MarginBounds.Width - headerImage.Width) / 2;
                e.Graphics.DrawImage(headerImage, x + centerOffsetImage, y);

                y += headerImage.Height + lineHeight;

                float centerOffsetTextHeading = (e.MarginBounds.Width - e.Graphics.MeasureString("COLEGIO DE MUNTINLUPA", headingFont).Width) / 2;
                e.Graphics.DrawString("COLEGIO DE MUNTINLUPA", headingFont, brush, x + centerOffsetTextHeading, y);

                y += lineHeight;

                float centerOffsetTextNormal = (e.MarginBounds.Width - e.Graphics.MeasureString("POSADAS AVENUE, SUCAT, MUNTINLUPA CITY", normalFont).Width) / 2;
                e.Graphics.DrawString("POSADAS AVENUE, SUCAT, MUNTINLUPA CITY", normalFont, brush, x + centerOffsetTextNormal, y);

                y += lineHeight * 4; 

                e.Graphics.DrawString($"Student No: {studentNo.PadRight(40)}Program: {program.PadRight(40)}", normalFont, brush, x, y);
                y += lineHeight;

                e.Graphics.DrawString($"Name: {name.PadRight(40)}Semester: {semester.PadRight(40)}", normalFont, brush, x, y);
                y += lineHeight * 2;

                string[] headers = { "Course Title", "Total Units" };

                float[] columnWidths = { e.MarginBounds.Width * 0.7f, e.MarginBounds.Width * 0.2f };

                float distanceIncrease = 5.0f;
                columnWidths[1] += distanceIncrease;

                for (int i = 0; i < headers.Length; i++)
                {
                    e.Graphics.DrawString(headers[i], normalFont, brush, x, y);
                    x += columnWidths[i];
                }

                y += lineHeight;

                string[] subjectData = subjectsInfo.Split('\n');

                foreach (string subjectRow in subjectData)
                {
                    string[] rowData = subjectRow.Split(new[] { "Total Units: " }, StringSplitOptions.RemoveEmptyEntries);

                    x = e.MarginBounds.Left;

                    for (int i = 0; i < rowData.Length; i++)
                    {
                        if (i == 0)
                        {
                            e.Graphics.DrawString(rowData[i].Trim(), normalFont, brush, x, y);
                        }
                        else if (i == 1)
                        {
                            e.Graphics.DrawString(rowData[i]?.Trim() ?? "", normalFont, brush, x + columnWidths[0], y);
                        }
                    }

                    y += lineHeight;
                }
                y += lineHeight * 4;

                e.Graphics.DrawString("Engr. ADONIS P. ADORNADO, MSc", normalFont, brush, x, y);
                y += lineHeight;

                e.Graphics.DrawString("_______________________________________", normalFont, brush, x, y);
                y += lineHeight;

                e.Graphics.DrawString("College Registrar", normalFont, brush, x, y);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while printing: {ex.Message}");
            }
        }
    }
}