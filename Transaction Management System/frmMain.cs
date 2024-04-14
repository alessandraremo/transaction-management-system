using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Recording_System
{
    public partial class frmMain : Form
    {
        public frmMain(string username)
        {
            InitializeComponent();
            frmDashboard dashboard = new frmDashboard(username);
            DisplayFormInPanel(dashboard);
        }

        private void btnDashboard_Click(object sender, EventArgs e)
        {
            frmDashboard dash = new frmDashboard();
            dash.TopLevel = false;
            panel2.Controls.Add(dash);
            dash.BringToFront();
            dash.Show();
        }

        private void btnStudents_Click(object sender, EventArgs e)
        {
            frmStudents stud = new frmStudents();
            stud.TopLevel = false;
            panel2.Controls.Add(stud);
            stud.BringToFront();
            stud.Show();
        }

        private void btnSubjects_Click(object sender, EventArgs e)
        {
            frmSubjects sub = new frmSubjects();
            sub.TopLevel = false;
            panel2.Controls.Add(sub);
            sub.BringToFront();
            sub.Show();
        }

        private void btnCOR_Click(object sender, EventArgs e)
        {
            frmRegistration reg = new frmRegistration();
            reg.TopLevel = false;
            panel2.Controls.Add(reg);
            reg.BringToFront();
            reg.Show();
        }

        private void btnBilling_Click(object sender, EventArgs e)
        {
            frmBilling bill = new frmBilling();
            bill.TopLevel = false;
            panel2.Controls.Add(bill);
            bill.BringToFront();
            bill.Show();
        }

        private void DisplayFormInPanel(Form form)
        {
            if (panel2.Controls.Count > 0)
                panel2.Controls.Clear();

            form.TopLevel = false;
            form.FormBorderStyle = FormBorderStyle.None;
            form.Dock = DockStyle.Fill;
            panel2.Controls.Add(form);
            form.Show();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are you sure you want to logout?", "Logout", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            frmLogin Form = new frmLogin();
            Form.Show();
            this.Hide();
        }
    }
}
