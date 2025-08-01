using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                lblName.Text = "Welcome Guest";
                HReg.Visible = true;
                HLogin.Visible = true;
                HLogout.Visible = false;
                HSettings.Visible = false;
            }
            else
            {

                lblName.Text = "Welcome back, " + Session["name"].ToString();
                HReg.Visible = false;
                HLogin.Visible = false;
                HLogout.Visible = true;
                HSettings.Visible = true;
            }
        }

        protected void HLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void HSettings_Click(object sender, EventArgs e)
        {

        }
    }
}