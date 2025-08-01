using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Lab2
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your email.";
                return;
            }

            if (!email.Contains("@"))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter a valid email containing '@'.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["MWMCS"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT password FROM tblUsers WHERE email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        string password = result.ToString();
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Your password is: " + password;
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Email not found.";
                    }
                }
            }
        }
    }
}

