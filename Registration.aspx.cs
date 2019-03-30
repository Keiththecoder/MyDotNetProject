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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String connectionstring = @"Data Source=LAPTOP-M8Q9V8HN\SQLSERVERDEV2017;Initial Catalog=DotNetProject;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionstring);
                String procedurename = "UserDataInsert"; ;
                connection.Open();
                SqlCommand command = new SqlCommand(procedurename, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@username", name.Text.ToString());
                command.Parameters.AddWithValue("@name", username.Text.ToString());
                command.Parameters.AddWithValue("@password", password.Text.ToString());
                command.Parameters.AddWithValue("@mobile_no", mobileno.Text.ToString());
                command.Parameters.AddWithValue("@email_id", emailid.Text.ToString());
                command.Parameters.AddWithValue("@address", address.Text.ToString());
                command.Parameters.AddWithValue("@age", age.Text.ToString());
                command.ExecuteNonQuery();
                connection.Close();
                Label1.Text = "Account has been created";
            }
            catch(Exception er)
            {
                Label1.Text = er.Message;
            }

        }
    }
}