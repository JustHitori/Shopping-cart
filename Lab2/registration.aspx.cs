using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fname = txtFName.Text.Trim();
            string lname = txtLName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPass.Text.Trim();

            // Error handling - check if all fields are filled
            if (string.IsNullOrEmpty(fname) || string.IsNullOrEmpty(lname) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "All fields are required.";
                return;
            }

            if (!email.Contains("@"))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter a valid email address containing '@'.";
                return;
            }

            // Check if passwords match
            if (password != confirmPassword)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            // Insert into database
            try
            {
                SqlDataSource1.Insert();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Successfully Registered.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}