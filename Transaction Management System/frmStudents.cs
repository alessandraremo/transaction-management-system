using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using MySql.Data.MySqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Recording_System
{
    public partial class frmStudents : Form
    {
        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=;";
        public frmStudents()
        {
            InitializeComponent();
            PopulatePrograms();
            PopulateSemesters();
            PopulateGenders();

            DisplayStudents();

            if (dataGridView1.Columns.Contains("ID"))
            {
                dataGridView1.Columns["ID"].Visible = false;
            }

            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
        public DataTable GetStudentsData()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                connection.Open();

                string query = "SELECT * FROM students";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                return dataTable;
            }
        }
        private void frmStudents_Load(object sender, EventArgs e)
        {
            DisplayStudents();
    }
        private void PopulatePrograms()
        {
            cmbProgram.Items.Add("Architecture");
            cmbProgram.Items.Add("Civil Engineering");
            cmbProgram.Items.Add("Computer Engineering");
            cmbProgram.Items.Add("Electrical Engineering");
            cmbProgram.Items.Add("Electronic Engineering");
            cmbProgram.Items.Add("Environmental Engineering");
            cmbProgram.Items.Add("Industrial Engineering");
            cmbProgram.Items.Add("Mechanical Engineering");
        }
        private void PopulateSemesters()
        {
            cmbSemester.Items.Add("2022-2023 First Semester");
            cmbSemester.Items.Add("2022-2023 Second Semester");
            cmbSemester.Items.Add("2022-2023 Summer");
            cmbSemester.Items.Add("2023-2024 First Semester");
            cmbSemester.Items.Add("2023-2024 Second Semester");
            cmbSemester.Items.Add("2023-2024 Summer");
            cmbSemester.Items.Add("2024-2025 First Semester");
            cmbSemester.Items.Add("2024-2025 Second Semester");
            cmbSemester.Items.Add("2024-2025 Summer");
        }
        private void PopulateGenders()
        {
            cmbGender.Items.Add("Male");
            cmbGender.Items.Add("Female");
        }

        private void btnSave_Click_1(object sender, EventArgs e)
        {
           
                string name = txtName.Text;
                string program = cmbProgram.SelectedItem?.ToString();
                string student_no = txtStudentNo.Text;
                string address = txtAddress.Text;
                string gender = cmbGender.SelectedItem?.ToString();
                string semester = cmbSemester.SelectedItem?.ToString();
                string email = txtEmail.Text;

                if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(program) || string.IsNullOrEmpty(student_no) ||
                    string.IsNullOrEmpty(address) || string.IsNullOrEmpty(gender) || string.IsNullOrEmpty(semester) || string.IsNullOrEmpty(email))
                {
                    MessageBox.Show("Please fill in all the fields");
                    return;
                }

                if (btnSave.Tag != null && btnSave.Tag is int editedStudentId)
                {
                    UpdateStudent(editedStudentId, name, program, student_no, address, gender, semester, email);
                    btnSave.Tag = null; 
                }
                else
                {
                    InsertStudent(name, program, student_no, address, gender, semester, email);
                }

                ClearFields();
                DisplayStudents();
            
        }


        private void UpdateStudent(int studentId, string name, string program, string studentNo, string address, string gender, string semester, string email)
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                try
                {
                    connection.Open();

                    string query = "UPDATE students SET name = @Name, program = @Program, student_no = @StudentNo, address = @Address, gender = @Gender, semester = @Semester, email = @Email WHERE ID = @StudentId";
                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Program", program);
                    cmd.Parameters.AddWithValue("@StudentNo", studentNo);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@StudentId", studentId);

                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred while updating student: " + ex.Message);
                }
            }
        }

        private void InsertStudent(string name, string program, string student_no, string address, string gender, string semester, string email)
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                try
                {
                    connection.Open();

                    string query = "INSERT INTO students (name, program, student_no, address, gender, semester, email) VALUES (@Name, @Program, @Student_No, @Address, @Gender, @Semester, @Email)";
                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Program", program);
                    cmd.Parameters.AddWithValue("@Student_No", student_no);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@Email", email);

                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred while inserting student: " + ex.Message);
                }
            }
        }

        private void DisplayStudents()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                connection.Open();

                string query = "SELECT * FROM students";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                dataGridView1.DataSource = dataTable;
            }
        }

        private void btnEdit_Click_1(object sender, EventArgs e)
        {
            
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    int selectedStudentId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["ID"].Value);

                    string name = dataGridView1.SelectedRows[0].Cells["name"].Value.ToString();
                    string program = dataGridView1.SelectedRows[0].Cells["program"].Value.ToString();
                    string studentNo = dataGridView1.SelectedRows[0].Cells["student_no"].Value.ToString();
                    string address = dataGridView1.SelectedRows[0].Cells["address"].Value.ToString();
                    string gender = dataGridView1.SelectedRows[0].Cells["gender"].Value.ToString();
                    string semester = dataGridView1.SelectedRows[0].Cells["semester"].Value.ToString();
                    string email = dataGridView1.SelectedRows[0].Cells["email"].Value.ToString();

                    txtName.Text = name;
                    cmbProgram.SelectedItem = program;
                    txtStudentNo.Text = studentNo;
                    txtAddress.Text = address;
                    cmbGender.SelectedItem = gender;
                    cmbSemester.SelectedItem = semester;
                    txtEmail.Text = email;

                    btnSave.Tag = selectedStudentId;

                    btnSave.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Please select a student to edit.");
                }
            
        }

        private void btnDelete_Click_1(object sender, EventArgs e)
        {
            
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    int selectedStudentId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["ID"].Value);

                    DialogResult result = MessageBox.Show("Are you sure you want to delete this student?", "Confirmation", MessageBoxButtons.YesNo);
                    if (result == DialogResult.Yes)
                    {
                        DeleteStudent(selectedStudentId);

                        ClearFields();

                        DisplayStudents();
                    }
                }
                else
                {
                    MessageBox.Show("Please select a student to delete.");
                }
            
        }

        private void DeleteStudent(int studentId)
        {
            using (MySqlConnection connection = new MySqlConnection(ConnectionString))
            {
                try
                {
                    connection.Open();

                    string query = "DELETE FROM students WHERE ID = @StudentId";
                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@StudentId", studentId);

                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("An error occurred while deleting student: " + ex.Message);
                }
            }
        }

        private void ClearFields()
        {
            txtName.Text = string.Empty;
            cmbProgram.SelectedItem = null;
            txtStudentNo.Text = string.Empty;
            txtAddress.Text = string.Empty;
            cmbGender.SelectedItem = null;
            cmbSemester.SelectedItem = null;
            txtEmail.Text = string.Empty;

            btnSave.Enabled = true;
        }
    }
}
