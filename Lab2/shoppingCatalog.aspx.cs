using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class shoppingCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Hello");
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "btnDetails")
            {
                //Label1.Text = "You clicked the button";
                Label PID = e.Item.FindControl("pidLabel") as Label;
                Label1.Text = PID.Text; // you can omit this
                Session["PID"] = PID.Text;
                Response.Redirect("productDetails.aspx");
            }
        }
    }
}