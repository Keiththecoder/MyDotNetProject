using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DotNetProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionstring = @"Data Source=LAPTOP-M8Q9V8HN\SQLSERVERDEV2017;Initial Catalog=DotNetProject;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionstring);
                string procedure = "UserLogin";   //stored procedure Name
                connection.Open();
                SqlCommand command = new SqlCommand(procedure, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", TextBox1.Text.ToString());   //for username
                command.Parameters.AddWithValue("@password", TextBox2.Text.ToString());  //for password
                int usercount = (Int32)command.ExecuteScalar();// for taking single value
                if (usercount == 1)  // comparing users from table 
                {
                    Label1.Text = "Login Succesful!";
                    Response.Redirect("PersonDetails.aspx");  //for sucsseful login
                }
                else
                {
                    connection.Close();
                    Label1.Text = "Invalid User Name or Password";  //for invalid login
                }
            }
            catch(Exception er)
            {
                Label1.Text = er.Message;
            }
            }

          

     

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}