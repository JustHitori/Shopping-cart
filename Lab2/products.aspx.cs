using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Lab2
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCID.Text = DropDownList1.SelectedValue.ToString();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //check if it has a file
            if (fuPicture.HasFile.ToString() != null)
            {
                //save the physical image file to your folder - images
                //pizza.jpg
                //note your filenames
                fuPicture.SaveAs(Server.MapPath("images//" + fuPicture.FileName));
                //save to the database
                lblPicture.Text = "~/images/" + fuPicture.FileName.ToString();
                // ~/images/pizza.jpg
                lblDTadded.Text = DateTime.Now.ToString();

                SqlDataSource2.Insert();
                lblMessage.Text = "Successfully added a product!";
            }
            else
            {
                //place your alert to your user
                lblMessage.Text = "Error encountered, try again";
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Update();
            lblMessage.Text = "Product Updated Successfully";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Delete();
            lblMessage.Text = "Product Deleted Successfully";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected row's Product ID (PID)
            string selectedPid = GridView1.SelectedDataKey.Value.ToString();

            // Display the selected PID in the lblPID label (optional)
            lblPID.Text = selectedPid;

            // You can also retrieve other cell values if needed, for example:
            GridViewRow row = GridView1.SelectedRow;
            txtName.Text = row.Cells[2].Text;
            txtDescription.Text = row.Cells[3].Text;
            txtPrice.Text = row.Cells[4].Text;
            lblPicture.Text = row.Cells[5].Text;
            lblCID.Text = row.Cells[6].Text;
            lblDTadded.Text = row.Cells[7].Text;
        }

    }
}