using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;

            lblDTAdded.Text = now.ToString("yyyy-MM-dd HH:mm:ss");

            SqlDataSource1.InsertParameters["dtadded"].DefaultValue = now.ToString("yyyy-MM-dd HH:mm:ss");

            SqlDataSource1.Insert();
            txtName.Text = "";
            txtDescription.Text = "";
            lblMessage.Text = "Category has been added successfully!";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Set all parameters needed
            SqlDataSource1.UpdateParameters["cid"].DefaultValue = lblCID.Text;
            SqlDataSource1.UpdateParameters["name"].DefaultValue = txtName.Text;
            SqlDataSource1.UpdateParameters["description"].DefaultValue = txtDescription.Text;
            SqlDataSource1.UpdateParameters["dtadded"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            SqlDataSource1.Update();
            GridView1.DataBind();
            txtName.Text = "";
            txtDescription.Text = "";
            lblMessage.Text = "Product has been updated successfully!";
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["cid"].DefaultValue = lblCID.Text;
            SqlDataSource1.Delete();
            GridView1.DataBind();
            txtName.Text = "";
            txtDescription.Text = "";
            lblMessage.Text = "Product has been deleted successfully!";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCid = GridView1.SelectedDataKey.Value.ToString();
            lblCID.Text = selectedCid;

            // Optional: populate textboxes
            txtName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtDescription.Text = GridView1.SelectedRow.Cells[3].Text;
            lblDTAdded.Text = GridView1.SelectedRow.Cells[4].Text;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}