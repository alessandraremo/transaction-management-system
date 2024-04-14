using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace Recording_System
{
    public partial class frmSubjects : Form
    {
        public event Action<string, string, string, string, string, string, string, string, string> AddCourseToDataGridView2;
        public event Action<string, string, string, string, string, string, string, string, string> SaveCourseToDatabase;
        private const string adminPassword = "1234567890";

        public DataGridView DataGridView2 => dataGridView2;
        private frmStudents studentsForm;
        private List<Course> addedCourses;  

        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=;";

        public frmSubjects()
        {
            InitializeComponent();

            addedCourses = new List<Course>();

            studentsForm = new frmStudents();
            DisplayStudentsData();

            cmbSemester.SelectedIndexChanged += ComboBox_SelectedIndexChanged;
            cmbProgram.SelectedIndexChanged += ComboBox_SelectedIndexChanged;

            PopulateComboBox(cmbSemester, "semester");
            PopulateComboBox(cmbProgram, "program");

            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView2.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            dataGridView2.Columns.Add("courseCode", "Course Code");
            dataGridView2.Columns.Add("courseTitle", "Course Title");
            dataGridView2.Columns.Add("lecture", "Lecture");
            dataGridView2.Columns.Add("laboratory", "Laboratory");
            dataGridView2.Columns.Add("totalUnits", "Total Units");
            dataGridView2.Columns.Add("prerequisite", "Prerequisite");
        }

        private void PopulateComboBox(ComboBox comboBox, string columnName)
        {
            DataTable studentsData = studentsForm.GetStudentsData();
            var distinctValues = studentsData.AsEnumerable().Select(row => row.Field<string>(columnName)).Distinct().ToList();

            comboBox.DataSource = distinctValues;
        }

        private void DisplayStudentsData()
        {
            DataTable studentsData = studentsForm.GetStudentsData();

            dataGridView1.DataSource = studentsData;

            dataGridView1.Columns["student_no"].Visible = false;
            dataGridView1.Columns["address"].Visible = false;
            dataGridView1.Columns["gender"].Visible = false;
            dataGridView1.Columns["email"].Visible = false;
            dataGridView1.Columns["id"].Visible = false;

            DataGridViewButtonColumn addButtonColumn = new DataGridViewButtonColumn();
            addButtonColumn.HeaderText = "";
            addButtonColumn.Text = "Add";
            addButtonColumn.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(addButtonColumn);

            DataGridViewButtonColumn viewButtonColumn = new DataGridViewButtonColumn();
            viewButtonColumn.HeaderText = "";
            viewButtonColumn.Text = "View";
            viewButtonColumn.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(viewButtonColumn);

            dataGridView1.CellContentClick += dataGridView1_CellContentClick;
        }
        private void ComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterData();
        }

        private void FilterData()
        {
            string selectedSemester = cmbSemester.SelectedItem?.ToString();
            string selectedProgram = cmbProgram.SelectedItem?.ToString();

            DataView dv = studentsForm.GetStudentsData().DefaultView;
            dv.RowFilter = $"semester = '{selectedSemester}' AND program = '{selectedProgram}'";

            dataGridView1.DataSource = dv;
        }

        public void AddCourseToDataGridView2FromAddSubjects(string courseCode, string courseTitle, string lecture, string laboratory, string totalUnits, string prerequisite, string name, string program, string semester)
        {
            dataGridView2.Rows.Add(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite);

            SaveCourseToDatabaseFromAddSubjects(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite, name, program, semester);

            AddCourseToDataGridView2?.Invoke(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite, name, program, semester);
        }

        public void SaveCourseToDatabaseFromAddSubjects(string courseCode, string courseTitle, string lecture, string laboratory, string totalUnits, string prerequisite, string name, string program, string semester)
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                try
                {
                    connection.Open();

                    string query = "INSERT INTO subjects (course_code, course_title, lecture, laboratory, total_units, prerequisite, student_name, student_program, student_semester) " +
                                    "VALUES (@course_code, @course_title, @lecture, @laboratory, @total_units, @prerequisite, @name, @program, @semester)";

                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@course_code", courseCode);
                    cmd.Parameters.AddWithValue("@course_title", courseTitle);
                    cmd.Parameters.AddWithValue("@lecture", lecture);
                    cmd.Parameters.AddWithValue("@laboratory", laboratory);
                    cmd.Parameters.AddWithValue("@total_units", totalUnits);
                    cmd.Parameters.AddWithValue("@prerequisite", prerequisite);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@program", program);
                    cmd.Parameters.AddWithValue("@semester", semester);

                    cmd.ExecuteNonQuery();

                    SaveCourseToDatabase?.Invoke(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite, name, program, semester);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred while saving course data to the database: {ex.Message}");
                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Columns[e.ColumnIndex] is DataGridViewButtonColumn && e.RowIndex >= 0)
            {
                string buttonText = dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Value.ToString();

                switch (buttonText)
                {
                    case "Add":
                        
                            string name = dataGridView1.Rows[e.RowIndex].Cells["name"].Value.ToString();
                            string program = dataGridView1.Rows[e.RowIndex].Cells["program"].Value.ToString();
                            string semester = dataGridView1.Rows[e.RowIndex].Cells["semester"].Value.ToString();

                            frmAddSubjects addSubjectsForm = new frmAddSubjects(name, program, semester, this);
                            addSubjectsForm.Show();
                        
                        break;
                    case "View":
                        
                            string selectedName = dataGridView1.Rows[e.RowIndex].Cells["name"].Value.ToString();
                            string selectedProgram = dataGridView1.Rows[e.RowIndex].Cells["program"].Value.ToString();
                            string selectedSemester = dataGridView1.Rows[e.RowIndex].Cells["semester"].Value.ToString();

                            DisplaySubjectsForStudent(selectedName, selectedProgram, selectedSemester);
                        
                        break;
                    default:
                        break;
                }
            }
        }

        private void DisplaySubjectsForStudent(string name, string program, string semester)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT course_code, course_title, lecture, laboratory, total_units, prerequisite " +
                                   "FROM subjects " +
                                   "WHERE student_name = @name AND student_program = @program AND student_semester = @semester";

                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@program", program);
                    cmd.Parameters.AddWithValue("@semester", semester);

                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    dataGridView2.Rows.Clear();

                    HashSet<string> uniqueSubjectCodes = new HashSet<string>();

                    foreach (DataRow row in dataTable.Rows)
                    {
                        string courseCode = row["course_code"].ToString();

                        if (!uniqueSubjectCodes.Contains(courseCode))
                        {
                            string courseTitle = row["course_title"].ToString();
                            string lecture = row["lecture"].ToString();
                            string laboratory = row["laboratory"].ToString();
                            string totalUnits = row["total_units"].ToString();
                            string prerequisite = row["prerequisite"].ToString();

                            dataGridView2.Rows.Add(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite);

                            uniqueSubjectCodes.Add(courseCode);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while retrieving subject data: {ex.Message}");
            }
        }

        public string GetTotalUnitsForPrint(string courseCode)
        {
            int rowIndex = dataGridView2.Rows.Cast<DataGridViewRow>().ToList()
                                 .FindIndex(row => row.Cells["course_code"].Value.ToString() == courseCode);

            if (rowIndex != -1)
            {
                return dataGridView2.Rows[rowIndex].Cells["total_units"].Value.ToString();
            }
            else
            {
                return "N/A";
            }
        }

        public class Course
        {
            public string CourseCode { get; set; }
            public string CourseTitle { get; set; }
            public string Lecture { get; set; }
            public string Laboratory { get; set; }
            public string TotalUnits { get; set; }
            public string Prerequisite { get; set; }
        }
    }
}
