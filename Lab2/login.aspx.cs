using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//step 1 - namespaces
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Lab2
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginInput = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // New: Check if either field is empty
            if (string.IsNullOrEmpty(loginInput) || string.IsNullOrEmpty(password))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "All fields are required.";
                return;
            }

            //step 2 - create the connection
            string connStr = ConfigurationManager.ConnectionStrings["MWMCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //step 3 - open
            conn.Open();

            //step 4 - create query
            string query = "SELECT * FROM tblUsers WHERE (email = @login OR firstname = @login) AND password = @password";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@login", loginInput);
            comm.Parameters.AddWithValue("@password", password);

            //step 5 - manipulate the data - read, execute
            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                lblMessage.Text = "Record found!";
                Session["uid"] = reader["uid"].ToString();
                Session["email"] = reader["email"].ToString();
                Session["fname"] = reader["firstname"].ToString();
                Session["lname"] = reader["lastname"].ToString();
                Session["name"] = reader["firstname"].ToString() + " " + reader["lastname"].ToString();
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Record not found!";
            }

            //step 6 - close all connections
            reader.Close();
            conn.Close();
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}