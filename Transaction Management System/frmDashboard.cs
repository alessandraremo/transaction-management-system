using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace Recording_System
{
    public partial class frmDashboard : Form
    {
        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=;";
        private Timer scrollTimer = new Timer();
        private int currentRowIndex = 0;

        public frmDashboard(string username = null)
        {
            InitializeComponent();
            InitializeDataGridView();
            InitializeTimer();
            if (username != null)
            {
                SetUsername(username);
            }
        }

        public void SetUsername(string username)
        {
            lblUsername.Text = "Welcome, " + username + "!";
        }

        private void LoadChartData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    string studentCountQuery = "SELECT program, COUNT(*) as StudentCount FROM students GROUP BY program";
                    MySqlCommand studentCountCmd = new MySqlCommand(studentCountQuery, connection);

                    MySqlDataAdapter studentCountAdapter = new MySqlDataAdapter(studentCountCmd);
                    DataTable studentCountTable = new DataTable();
                    studentCountAdapter.Fill(studentCountTable);

                    string billingQuery = "SELECT date, name, product, grandTotal FROM billing";
                    MySqlCommand billingCmd = new MySqlCommand(billingQuery, connection);

                    MySqlDataAdapter billingAdapter = new MySqlDataAdapter(billingCmd);
                    DataTable billingTable = new DataTable();
                    billingAdapter.Fill(billingTable);

                    chart1.DataSource = studentCountTable;
                    chart1.Series["CPE"].XValueMember = "program";
                    chart1.Series["CPE"].YValueMembers = "StudentCount";

                    int totalStudents = studentCountTable.AsEnumerable().Sum(row => Convert.ToInt32(row["StudentCount"]));
                    lblTotalStudents.Text = totalStudents.ToString();

                    decimal grandTotal = CalculateGrandTotal();
                    lblTotalSales.Text = grandTotal.ToString();

                    dataGridView1.AutoGenerateColumns = false; 
                    dataGridView1.DataSource = billingTable;

                    if (dataGridView1.Columns.Count == 0)
                    {
                        InitializeDataGridView();
                    }

                    chart2.DataSource = billingTable;
                    chart2.Series["Series1"].XValueMember = "program"; 
                    chart2.Series["Series1"].YValueMembers = "grandTotal";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private void frmDashboard_Load(object sender, EventArgs e)
        {
            LoadChartData();
            LoadPieChartData();
        }

        private decimal CalculateGrandTotal()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    string query = "SELECT SUM(grandTotal) FROM billing";
                    MySqlCommand cmd = new MySqlCommand(query, connection);

                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToDecimal(result);
                    }

                    return 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while calculating grand total: {ex.Message}");
                return 0;
            }
        }

        private void InitializeDataGridView()
        {
            dataGridView1.Columns.Clear();

            DataGridViewTextBoxColumn dateColumn = new DataGridViewTextBoxColumn();
            dateColumn.DataPropertyName = "date";
            dateColumn.HeaderText = "Date";
            dataGridView1.Columns.Add(dateColumn);

            DataGridViewTextBoxColumn nameColumn = new DataGridViewTextBoxColumn();
            nameColumn.DataPropertyName = "name";
            nameColumn.HeaderText = "Name";
            dataGridView1.Columns.Add(nameColumn);

            DataGridViewTextBoxColumn productColumn = new DataGridViewTextBoxColumn();
            productColumn.DataPropertyName = "product";
            productColumn.HeaderText = "Product";
            dataGridView1.Columns.Add(productColumn);

            DataGridViewTextBoxColumn grandTotalColumn = new DataGridViewTextBoxColumn();
            grandTotalColumn.DataPropertyName = "grandTotal";
            grandTotalColumn.HeaderText = "GrandTotal";
            dataGridView1.Columns.Add(grandTotalColumn);

            foreach (DataGridViewColumn column in dataGridView1.Columns)
            {
                column.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                column.ReadOnly = true;
            }
        }

        private void InitializeTimer()
        {
            scrollTimer.Interval = 2000;
            scrollTimer.Tick += ScrollTimer_Tick;
            scrollTimer.Start();
        }

        private void ScrollTimer_Tick(object sender, EventArgs e)
        {
            if (currentRowIndex < dataGridView1.Rows.Count - 1)
            {
                currentRowIndex++;
                dataGridView1.FirstDisplayedScrollingRowIndex = currentRowIndex;
            }
            else
            {
                currentRowIndex = 0;
                dataGridView1.FirstDisplayedScrollingRowIndex = 0;
            }
        }

        private void LoadPieChartData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    connection.Open();

                    string pieChartQuery = "SELECT program, SUM(grandTotal) as grandTotal FROM billing GROUP BY program";
                    MySqlCommand pieChartCmd = new MySqlCommand(pieChartQuery, connection);

                    MySqlDataAdapter pieChartAdapter = new MySqlDataAdapter(pieChartCmd);
                    DataTable pieChartTable = new DataTable();
                    pieChartAdapter.Fill(pieChartTable);

                    chart2.DataSource = pieChartTable;
                    chart2.Series["Series1"].XValueMember = "program"; 
                    chart2.Series["Series1"].YValueMembers = "grandTotal"; 
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }
    }
}
