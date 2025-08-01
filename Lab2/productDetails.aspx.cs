using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Lab2
{
    public partial class productDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { }
            if (Session["PID"] != null)
            {
                Label1.Text = Session["PID"].ToString();
                loadDetails();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
        void loadDetails()
        {
            //Session["PID"] = 1;
            string connStr = ConfigurationManager.ConnectionStrings["MWMCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string query = "SELECT * FROM tblProducts WHERE pid=@pid";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@pid", Session["PID"].ToString());

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                //Response.Write(reader["picture"].ToString() + " ");
                //Response.Write(reader["name"].ToString() + " ");
                //Response.Write(reader["description"].ToString() + " ");
                //Response.Write(reader["price"].ToString() + " ");

                imgProduct.ImageUrl = reader["picture"].ToString();
                Label1.Text = Session["PID"].ToString();
                lblName.Text = reader["name"].ToString();
                lblDescription.Text = reader["description"].ToString();
                txtQTY.Text = "1";
                lblPrice.Text = reader["price"].ToString();
            }

            reader.Close();
            conn.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //bypass login
            Session["uid"] = 3;
            //items needed to be saved in the dbase
            // tblCart
            // pid, uid, price, qty, paymentStatus, deliveryStatus, dtAdded

            //before you insert,
            //check if the PID EXISTS AND UID AND paymentStatus=Pending
            //  Add qty, else
            //insert data item

            string connStr = ConfigurationManager.ConnectionStrings["MWMCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string query = "INSERT INTO tblCart(UID, PID, qty, price, paymentStatus, deliveryStatus, dtAdded) " +
                "VALUES(@UID, @PID, @qty, @price, @paymentStatus, @deliveryStatus, @dtAdded)";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@UID", Session["uid"].ToString());
            comm.Parameters.AddWithValue("@PID", Session["PID"].ToString());
            comm.Parameters.AddWithValue("@qty", txtQTY.Text);
            comm.Parameters.AddWithValue("@price", lblPrice.Text);
            comm.Parameters.AddWithValue("@paymentStatus", "Pending");
            comm.Parameters.AddWithValue("@deliveryStatus", "Pending");
            comm.Parameters.AddWithValue("@dtAdded", DateTime.Now.ToString());

            int result = comm.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("Item successfully added to cart");
            }
            else
            {
                Response.Write("Eror adding Item in the cart, please try again.");
            }
            conn.Close();
        }
    }
}