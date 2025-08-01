using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class AccountSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEmail.Text = Session["email"].ToString();
                txtFName.Text = Session["fname"].ToString();
                txtLName.Text = Session["lname"].ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            lblMessage.Text = "Successfully Updated";
            string script = $"<script>console.log('{txtEmail.Text}');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "consoleLog", script);
        }
    }
}