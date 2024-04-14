using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Recording_System
{
    public partial class frmBilling : Form
    {
        private const string ConnectionString = "Server=localhost;Database=recording_db;Uid=root;Pwd=";
        private PrintDocument PD = new PrintDocument();
        private PrintPreviewDialog PPD = new PrintPreviewDialog();
        public frmBilling()
        {
            InitializeComponent();

            cmbProgram.SelectedIndexChanged += cmbProgram_SelectedIndexChanged;

            cmbSchoolDoc.Items.AddRange(new string[] { "TOR", "GOOD MORAL", "CTC", "COR", "COG" });

            cmbSchoolDoc.SelectedIndexChanged += cmbSchoolDoc_SelectedIndexChanged;

            cmbSchoolProd.Items.AddRange(new string[] { "PE Uniform", "Men's Uniform", "Women's Uniform", "ID", "ID Lace" });

            cmbSchoolProd.SelectedIndexChanged += cmbSchoolProd_SelectedIndexChanged;

            txtQty.TextChanged += (sender, e) => UpdateTotal();

            txtQty1.TextChanged += (sender, e) => UpdateTotal1();

            UpdateComboBoxes();

            lblDate.Text = DateTime.Now.ToString("MM/dd/yy");

            btnAdd.Click += btnAdd_Click;

            btnAdd1.Click += btnAdd1_Click;

            txtAmtTendered.TextChanged += (sender, e) => CalculateAndDisplayChange();

            btnSave.Click += btnSave_Click_1;

            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private async void cmbProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            await UpdateNameComboBox();
        }

        private async Task UpdateComboBoxes()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                {
                    await connection.OpenAsync();

                    string queryProgram = "SELECT DISTINCT program FROM students";
                    MySqlCommand cmdProgram = new MySqlCommand(queryProgram, connection);

                    MySqlDataAdapter adapterProgram = new MySqlDataAdapter(cmdProgram);
                    DataTable dataTableProgram = new DataTable();
                    await adapterProgram.FillAsync(dataTableProgram);

                    cmbProgram.DataSource = dataTableProgram.AsEnumerable().Select(row => row["program"].ToString()).ToList();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while retrieving program data: {ex.Message}");
            }
        }

        private async Task UpdateNameComboBox()
        {
            string selectedProgram = cmbProgram.SelectedItem?.ToString();

            if (!string.IsNullOrEmpty(selectedProgram))
            {
                try
                {
                    using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                    {
                        await connection.OpenAsync();

                        string queryName = "SELECT name FROM students WHERE program = @program";
                        MySqlCommand cmdName = new MySqlCommand(queryName, connection);
                        cmdName.Parameters.AddWithValue("@program", selectedProgram);

                        MySqlDataAdapter adapterName = new MySqlDataAdapter(cmdName);
                        DataTable dataTableName = new DataTable();
                        await adapterName.FillAsync(dataTableName);

                        cmbName.DataSource = dataTableName.AsEnumerable().Select(row => row["name"].ToString()).ToList();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred while retrieving name data: {ex.Message}");
                }
            }
            else
            {
                cmbName.DataSource = null;
            }
        }

        private void cmbSchoolDoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdatePrice();
            UpdateTotal();
        }

        private void UpdatePrice()
        {
            string selectedDocument = cmbSchoolDoc.SelectedItem?.ToString();

            if (selectedDocument != null)
            {
                Dictionary<string, decimal> documentPrices = new Dictionary<string, decimal>
        {
            { "TOR", 100.0m },
            { "GOOD MORAL", 150.0m },
            { "CTC", 50.0m },
            { "COR", 75.0m },
            { "COG", 120.0m }
        };
                if (documentPrices.ContainsKey(selectedDocument))
                {
                    txtPrice.Text = documentPrices[selectedDocument].ToString();
                }
                else
                {
                    txtPrice.Text = string.Empty;
                }
            }
            else
            {
                Console.WriteLine("selectedDocument is null");
            }
        }


        private void UpdateTotal()
        {
            if (decimal.TryParse(txtPrice.Text, out decimal price) && int.TryParse(txtQty.Text, out int qty))
            {
                txtTotal.Text = (price * qty).ToString();
            }
            else
            {
                txtTotal.Text = string.Empty;
            }
        }

        private void cmbSchoolProd_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedProduct = cmbSchoolProd.SelectedItem?.ToString();

            if (!string.IsNullOrEmpty(selectedProduct))
            {
                UpdatePrice1();
                UpdateTotal1();
            }
        }

        private void UpdatePrice1()
        {
            try
            {
                string selectedProduct = cmbSchoolProd.SelectedItem?.ToString();

                Dictionary<string, decimal> productPrices = new Dictionary<string, decimal>
            {
                { "PE Uniform", 500.0m },
                { "Men's Uniform", 1000.0m },
                { "Women's Uniform", 1000.0m },
                { "ID", 150.0m },
                { "ID Lace", 50.0m }
            };
                if (productPrices.ContainsKey(selectedProduct))
                {
                    txtPrice1.Text = productPrices[selectedProduct].ToString();
                }
                else
                {
                    txtPrice1.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred in UpdatePrice1: {ex.Message}");
            }
        }
        private void UpdateTotal1()
        {
            try
            {
                if (decimal.TryParse(txtPrice1.Text, out decimal price) && int.TryParse(txtQty1.Text, out int qty))
                {
                    txtTotal1.Text = (price * qty).ToString();
                }
                else
                {
                    txtTotal1.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred in UpdateTotal1: {ex.Message}");
            }
        }


        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (rbCash.Checked)
            {
                txtPaymentMethod.Text = "Cash";
            }
            else if (rbGcash.Checked)
            {
                txtPaymentMethod.Text = "Gcash";
            }
            else if (rbBank.Checked)
            {
                txtPaymentMethod.Text = "Bank";
            }
            else
            {
                MessageBox.Show("Please select a mode of payment.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            lblProgram1.Text = cmbProgram.SelectedItem?.ToString() ?? "No Program Selected";
            lblName1.Text = cmbName.SelectedItem?.ToString() ?? "No Name Selected";

            string selectedDocument = cmbSchoolDoc.Text;

            if (!string.IsNullOrEmpty(selectedDocument))
            {
                Console.WriteLine($"Selected Document: {selectedDocument}");

                if (decimal.TryParse(txtPrice.Text, out decimal price))
                {
                    if (int.TryParse(txtQty.Text, out int quantity))
                    {
                        decimal total = price * quantity;

                        dataGridView1.Rows.Add(selectedDocument, price, quantity, total);
                        ClearDocumentInputs();
                    }
                    else
                    {
                        ClearDocumentInputs();
                        MessageBox.Show("Please select a document/product.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }

            }
            CalculateAndDisplayGrandTotal();
        }

        private void ClearDocumentInputs()
        {
            txtPrice.Clear();
            txtQty.Clear();
            cmbSchoolDoc.SelectedIndex = -1;
        }

        private void btnAdd1_Click(object sender, EventArgs e)
        {
            string selectedProduct = cmbSchoolProd.Text;

            if (!string.IsNullOrEmpty(selectedProduct))
            {
                Console.WriteLine($"Selected Products: {selectedProduct}");

                if (decimal.TryParse(txtPrice1.Text, out decimal price))
                {
                    if (int.TryParse(txtQty1.Text, out int quantity))
                    {
                        decimal total = price * quantity;

                        dataGridView1.Rows.Add(selectedProduct, price, quantity, total);

                        ClearProductInputs();
                    }
                    else
                    {
                        ClearProductInputs();

                        MessageBox.Show("Please select a document/product.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
            CalculateAndDisplayGrandTotal();
        }

        private void ClearProductInputs()
        {
            txtPrice1.Clear();
            txtQty1.Clear();
            cmbSchoolProd.SelectedIndex = -1;
        }

        private void CalculateAndDisplayGrandTotal()
        {
            decimal grandTotal = 0;

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells["Total"].Value != null && decimal.TryParse(row.Cells["Total"].Value.ToString(), out decimal rowTotal))
                {
                    grandTotal += rowTotal;
                }
            }

            txtGrandTotal.Text = grandTotal.ToString();

            CalculateAndDisplayChange();
        }


        private void CalculateAndDisplayChange()
        {
            if (decimal.TryParse(txtGrandTotal.Text, out decimal grandTotal) && decimal.TryParse(txtAmtTendered.Text, out decimal amtTendered))
            {
                decimal change = amtTendered - grandTotal;

                txtChange.Text = change.ToString();
            }
            else
            {
            }
        }

        private void txtAmtTendered_TextChanged(object sender, EventArgs e)
        {
            CalculateAndDisplayChange();
        }

        private void btnSave_Click_1(object sender, EventArgs e)
        {
            try
            {
                    if (dataGridView1.Rows.Count > 0)  
                    {
                        using (MySqlConnection connection = new MySqlConnection(ConnectionString))
                        {
                            connection.Open();

                            decimal grandTotal = CalculateGrandTotal(); 
                            string modeOfPayment = GetSelectedModeOfPayment(); 

                            for (int i = dataGridView1.Rows.Count - 1; i >= 0; i--)
                            {
                                DataGridViewRow row = dataGridView1.Rows[i];

                                if (row.Cells[0].Value != null && row.Cells[1].Value != null && row.Cells[2].Value != null && row.Cells[3].Value != null &&
                                    !row.Cells[0].Value.ToString().Equals("Grand Total", StringComparison.OrdinalIgnoreCase) &&
                                    !row.Cells[0].Value.ToString().Equals("Change", StringComparison.OrdinalIgnoreCase))
                                {
                                    string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                    string name = lblName1.Text; 
                                    string program = lblProgram1.Text; 
                                    string product = row.Cells[0].Value?.ToString() ?? string.Empty;
                                    decimal price = Convert.ToDecimal(row.Cells[1].Value);
                                    int quantity = Convert.ToInt32(row.Cells[2].Value);
                                    decimal total = Convert.ToDecimal(row.Cells[3].Value);

                                    string query = "INSERT INTO billing (date, name, program, product, price, quantity, total, grandTotal, modeOfPayment) " +
                                                   "VALUES (@date, @name, @program, @product, @price, @quantity, @total, @grandTotal, @modeOfPayment)";

                                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                                    {
                                        cmd.Parameters.AddWithValue("@date", date);
                                        cmd.Parameters.AddWithValue("@name", name);
                                        cmd.Parameters.AddWithValue("@program", program);
                                        cmd.Parameters.AddWithValue("@product", product);
                                        cmd.Parameters.AddWithValue("@price", price);
                                        cmd.Parameters.AddWithValue("@quantity", quantity);
                                        cmd.Parameters.AddWithValue("@total", total);
                                        cmd.Parameters.AddWithValue("@grandTotal", grandTotal);
                                        cmd.Parameters.AddWithValue("@modeOfPayment", modeOfPayment);

                                        cmd.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                        dataGridView1.Rows.Clear();
                        dataGridView1.Refresh();
                    }
                else
                {
                    Console.WriteLine("No data to save.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred while saving data: {ex.Message}");
            }
        }

        private decimal CalculateGrandTotal()
        {
            decimal grandTotal = 0;

            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                grandTotal += Convert.ToDecimal(row.Cells[3].Value);
            }

            return grandTotal;
        }

        private string GetSelectedModeOfPayment()
        {
            if (rbCash.Checked)
            {
                return "Cash";
            }
            else if (rbGcash.Checked)
            {
                return "Gcash";
            }
            else if (rbBank.Checked)
            {
                return "Bank";
            }
            else
            {
                return string.Empty;
            }
        }

        private void btnPrint_Click_1(object sender, EventArgs e)
        {
           
                PrintDocument printDocument = new PrintDocument();

                printDocument.PrintPage += new PrintPageEventHandler(this.printDocument1_PrintPage);

                PrintPreviewDialog previewDialog = new PrintPreviewDialog();
                previewDialog.Document = printDocument;
                previewDialog.ShowDialog();

                PrintDialog printDialog = new PrintDialog();
                if (printDialog.ShowDialog() == DialogResult.OK)
                {
                    printDocument.Print();
                }
            
        }

        private void printDocument1_PrintPage(object sender, PrintPageEventArgs e)
        {
            Graphics g = e.Graphics;

            Font titleFont = new Font("Century Gothic", 24, FontStyle.Bold);
            Font tnxFont = new Font("Century Gothic", 18, FontStyle.Bold);
            Font regularFont = new Font("Century Gothic", 18);
            SolidBrush brush = new SolidBrush(Color.Black);

            float x = 50;
            float y = 50;
            float c = 655;
            string customerName = lblName1.Text;
            string customid = lblProgram1.Text;
            lblDate.Text = DateTime.Now.ToString("dd/MMM/yyyy");
            string date = lblDate.Text;

            Image logoImage = Properties.Resources.CDM;

            g.DrawImage(logoImage, x, y);
            g.DrawImage(logoImage, c, y);

            SizeF titleSize = g.MeasureString("COLEGIO DE MUNTINLUPA", titleFont);
            float centerXTitle = (e.PageBounds.Width - titleSize.Width) / 2;
            float z = 50;
            g.DrawString("COLEGIO DE MUNTINLUPA", titleFont, brush, centerXTitle, z);
            z += 50;

            SizeF subTitleSize = g.MeasureString("office of the treasury", regularFont);
            float centerXSubTitle = (e.PageBounds.Width - subTitleSize.Width) / 2;
            g.DrawString("office of the treasury", regularFont, brush, centerXSubTitle, z);
            z += 110;

            SizeF subTitle = g.MeasureString("office of the treasury", regularFont);
            float centerXSub = (e.PageBounds.Width - subTitle.Width) / 2;
            g.DrawString("OFFICIAL RECEIPT", titleFont, brush, centerXSub, z);
            z += 130;
            y += 60;

            g.DrawString("    ", titleFont, brush, centerXSub, y);
            y += 170;
            g.DrawString("Date: " + date, regularFont, brush, x, y);
            y += 30;
            g.DrawString("Program: " + customid, regularFont, brush, x, y);
            y += 30;
            g.DrawString("Customer: " + customerName, regularFont, brush, x, y);
            y += 60;

            // Receipt items
            g.DrawString("Product", tnxFont, brush, x, y);
            g.DrawString("Unit Price", tnxFont, brush, x + 200, y);
            g.DrawString("Quantity", tnxFont, brush, x + 425, y);
            g.DrawString("Amount", tnxFont, brush, x + 650, y);
            y += 40;

            g.DrawLine(new Pen(brush), x, y, x + 750, y);
            y += 30;

            // Loop through the rows in the DataGridView and print the contents
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row != null)
                {
                    foreach (DataGridViewCell cell in row.Cells)
                    {
                        if (cell.Value != null)
                        {
                            g.DrawString(cell.Value.ToString(), regularFont, brush, x, y);
                            x += 80;
                            //x += 57;
                        }
                        else
                        {
                            g.DrawString("  ", regularFont, brush, x, y);
                        }

                        x += 150;
                    }
                    x = 50;
                    y += 40;
                }
            }

            g.DrawLine(new Pen(brush), x, y, x + 750, y);
            y += 20;

            g.DrawString("            Grand Total: ₱   " + txtGrandTotal.Text, tnxFont, brush, x = 419, y);
            y += 40;
            g.DrawString(" Amount Tendered: ₱   " + txtAmtTendered.Text, regularFont, brush, x, y);
            y += 40;
            g.DrawString("                  Change: ₱   " + txtChange.Text, regularFont, brush, x, y);
            y += 40;
            g.DrawString("  Payment Method:      " + txtPaymentMethod.Text, regularFont, brush, x, y);
            y += 90;

            g.DrawString("Thank you! ", tnxFont, brush, x = 350, y);

            e.HasMorePages = false;
        }

        private void ResetForm()
        {
            dataGridView1.Rows.Clear();
            dataGridView1.Refresh();

            ClearDocumentInputs();
            ClearProductInputs();

            lblProgram1.Text = "No Program Selected";
            lblName1.Text = "No Name Selected";
            lblDate.Text = DateTime.Now.ToString("MM/dd/yy");
            txtGrandTotal.Clear();
            txtAmtTendered.Clear();
            txtChange.Clear();
            txtPaymentMethod.Clear();

            rbCash.Checked = false;
            rbGcash.Checked = false;
            rbBank.Checked = false;
        }

        private void btnReset_Click_1(object sender, EventArgs e)
        {
            ResetForm();
        }
    }
}
