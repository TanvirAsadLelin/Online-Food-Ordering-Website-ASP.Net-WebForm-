using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class Registration : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int userId = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(Connection.GetConnectionString());

            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
            cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@PostCode", txtPostCode.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            if (fuUserImage.HasFile)
            {
                if (Utils.IsValidExtension(fuUserImage.FileName))
                {
                    Guid obj = Guid.NewGuid();

                    fileExtension = Path.GetExtension(fuUserImage.FileName);
                    imagePath = "Images/User/" + obj.ToString() + fileExtension;
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension);

                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }


                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }

            }
            else
            {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userId == 0 ?
                        "registration is successful!<b><a href='Login.aspx'>Click here</a></b> to do login" :
                        "details updated successful!<b><a href='Profile.aspx'>Click here</a></b>";

                    lblMsg.Visible = true;
                    lblMsg.Text = "<b> " + txtUserName.Text.Trim() + "</b>" + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    if (userId != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
                    }
                    Clear();
                }
                catch (SqlException ex)
                {

                    if(ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {

                        lblMsg.Visible = true;
                        lblMsg.Text = "<b> " + txtUserName.Text.Trim() + "</b> username already exits, try new one..!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }

                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }

                finally
                {
                    con.Close();
                }
            }

        }

        void getUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count == 1)
            {
                txtFullName.Text = dt.Rows[0]["Name"].ToString();
                txtUserName.Text = dt.Rows[0]["Username"].ToString();
                txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPostCode.Text = dt.Rows[0]["PostCode"].ToString();
                imgUserImage.ImageUrl = String.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString())?
                    "../Images/"
            }

        }
        private void Clear()
        {
            txtFullName.Text = String.Empty;
            txtUserName.Text = String.Empty;
            txtMobile.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtAddress.Text = String.Empty;
            txtPostCode.Text = String.Empty;
            txtPassword.Text = String.Empty;
        }
    }
}