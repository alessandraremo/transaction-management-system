using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using static Recording_System.frmSubjects;

namespace Recording_System
{
    public partial class frmAddSubjects : Form
    {
        private frmSubjects subjectsForm;
        private List<Course> addedCourses;
        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=;";
        private readonly DatabaseHelper dbHelper;
        private bool selectAllChecked = false;
        public frmAddSubjects(string name, string program, string semester, frmSubjects subjectsForm)
        {
            InitializeComponent();

            string connectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=;";
            dbHelper = new DatabaseHelper(connectionString);

            cmbYR.SelectedIndexChanged += cmbYR_SelectedIndexChanged;


            txtName.Text = name;
            txtProgram.Text = program;
            txtSemester.Text = semester;

            txtName.ReadOnly = true;
            txtProgram.ReadOnly = true;
            txtSemester.ReadOnly = true;

            this.subjectsForm = subjectsForm;
            addedCourses = new List<Course>();

            DisplayCourseData();

            btnSave.Click += btnSave_Click_1;
            txtProgram.TextChanged += txtProgram_TextChanged;


            SubscribeToEvents();
        }

        private void SubscribeToEvents()
        {
            if (subjectsForm != null)
            {
                subjectsForm.AddCourseToDataGridView2 += SubjectsForm_AddCourseToDataGridView2Handler;
                subjectsForm.SaveCourseToDatabase += subjectsForm_SaveCourseToDatabase;
            }
        }

        private void SubjectsForm_AddCourseToDataGridView2Handler(string courseCode, string courseTitle, string lecture, string laboratory, string totalUnits, string prerequisite, string name, string program, string semester)
        {
            Console.WriteLine($"Added to DataGridView2: {courseCode} - {courseTitle}");
        }

        private void subjectsForm_SaveCourseToDatabase(string courseCode, string courseTitle, string lecture, string laboratory, string totalUnits, string prerequisite, string name, string program, string semester)
        {
            Console.WriteLine($"Saving to database: {courseCode} - {courseTitle}");
        }

        private void DisplayCourseData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT id, course_code, course_title, lecture, laboratory, total_units, prerequisite FROM courses";
                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    DataGridViewCheckBoxColumn checkBoxColumn = new DataGridViewCheckBoxColumn();
                    checkBoxColumn.HeaderText = "";
                    checkBoxColumn.Name = "selectColumn";
                    dataGridView1.Columns.Insert(0, checkBoxColumn);

                    dataGridView1.DataSource = dataTable;

                    dataGridView1.Columns["id"].Visible = false;

                    dataGridView1.Columns["course_title"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                    dataGridView1.Columns["prerequisite"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                    dataGridView1.Columns["course_code"].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dataGridView1.Columns["lecture"].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dataGridView1.Columns["laboratory"].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dataGridView1.Columns["total_units"].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while retrieving course data: {ex.Message}");
            }
        }

        private void btnSave_Click_1(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.Columns.Contains("selectColumn"))
                {
                    foreach (DataGridViewRow row in dataGridView1.Rows)
                    {
                        DataGridViewCheckBoxCell checkBoxCell = row.Cells[0] as DataGridViewCheckBoxCell;

                        if (checkBoxCell != null && Convert.ToBoolean(checkBoxCell.Value))
                        {
                            string courseCode = row.Cells["course_code"].Value.ToString();
                            string courseTitle = row.Cells["course_title"].Value.ToString();
                            string lecture = row.Cells["lecture"].Value.ToString();
                            string laboratory = row.Cells["laboratory"].Value.ToString();
                            string totalUnits = row.Cells["total_units"].Value.ToString();
                            string prerequisite = row.Cells["prerequisite"].Value.ToString();

                            if (!addedCourses.Any(course => course.CourseCode == courseCode))
                            {
                                Console.WriteLine($"Adding course: {courseCode} - {courseTitle}");

                                subjectsForm.AddCourseToDataGridView2FromAddSubjects(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite, txtName.Text, txtProgram.Text, txtSemester.Text);

                                Console.WriteLine($"Saving course to database: {courseCode} - {courseTitle}");

                                subjectsForm.SaveCourseToDatabaseFromAddSubjects(courseCode, courseTitle, lecture, laboratory, totalUnits, prerequisite, txtName.Text, txtProgram.Text, txtSemester.Text);

                                Course course = new Course
                                {
                                    CourseCode = courseCode,
                                    CourseTitle = courseTitle,
                                    Lecture = lecture,
                                    Laboratory = laboratory,
                                    TotalUnits = totalUnits,
                                    Prerequisite = prerequisite
                                };
                                addedCourses.Add(course);
                            }
                        }
                    }
                    this.Close();
                }
                else
                {
                    Console.WriteLine("Error: 'selectColumn' not found in dataGridView1.Columns.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }

        private void btnCancel_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void cmbYR_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbYR.SelectedItem != null && int.TryParse(cmbYR.SelectedItem.ToString(), out int selectedYear))
            {
                DataTable filteredData = dbHelper.GetFilteredData(selectedYear);
                dataGridView1.DataSource = filteredData;
            }
        }


        public class DatabaseHelper
        {
            private readonly string connectionString;

            public DatabaseHelper(string connectionString)
            {
                this.connectionString = connectionString;
            }

            public DataTable GetFilteredData(int selectedYear)
            {
                DataTable dataTable = new DataTable();

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM courses WHERE YrLevel = @YrLevel";
                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@YrLevel", selectedYear);

                        using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }

                return dataTable;
            }
        }

        private void frmAddSubjects_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            bool selectAll = checkBox1.Checked;

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                DataGridViewCheckBoxCell checkBoxCell = row.Cells[0] as DataGridViewCheckBoxCell;
                checkBoxCell.Value = selectAll;
            }
        }

        private void txtProgram_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
