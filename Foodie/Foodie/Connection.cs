using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Foodie
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }
    }

    public class Utils
    {
        public static bool IsValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for(int i = 0; i <= fileExtension.Length-1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }

        public static string GetImageUrl(Object url)
        {
            string url1 = "";
            if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "../Images/No_image.png";
            }
            else
            {
                url1 = string.Format("../{0}", url);
            }
            return url1;
        }


        public bool updateCartQuantity(int quanity, int productId, int userId)
        {
           bool isUpdated = false;

            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
            cmd.Parameters.AddWithValue("@Quantity", 1);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                Response.Write("<script> alert('Error-" + ex.Message + "');</script>");
            }
            finally
            {

            }

        }
    }
}