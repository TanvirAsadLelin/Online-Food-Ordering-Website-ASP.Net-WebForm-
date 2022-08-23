using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Foodie.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Product";
                // getCategories();
            }
            lblMsg.Visible = false;
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {

           


        }

        

      

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear(); 
        }

        private void Clear()
        {
            txtProductName.Text = string.Empty;
            chkIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}