using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

namespace DotNetProject
{
    public partial class PersonDetails : System.Web.UI.Page
    {
        string strConnection = @"Data Source=LAPTOP-M8Q9V8HN\SQLSERVERDEV2017;Initial Catalog=DotNetProject;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           

            //Create sql connection and command
            SqlConnection con = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand();

            //Loop through gridview rows to find checkbox 
            //and check whether it is checked or not 
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkUpdate = (CheckBox)
                   GridView1.Rows[i].Cells[0].FindControl("chkSelect");
                if (chkUpdate != null)
                {
                    if (chkUpdate.Checked)
                    {
                        // Get the values of textboxes using findControl
                        string strID = GridView1.Rows[i].Cells[1].Text;
                        string strName = ((TextBox)
                            GridView1.Rows[i].FindControl("txtName")).Text;

                        string strLocation = ((TextBox)
                            GridView1.Rows[i].FindControl("txtLocation")).Text;

                      

                        try
                        {
                            String procedurename = "detailsupdate";
                            con.Open();
                            SqlCommand command = new SqlCommand(procedurename, con);
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@name",strName);
                            command.Parameters.AddWithValue("@location", strLocation);
                            command.Parameters.AddWithValue("@id", strID);
                            command.ExecuteNonQuery();
                        }




                        catch (SqlException ex)
                        {
                            string errorMsg = "Error in Updation: ";
                            errorMsg += ex.Message;
                            throw new Exception(errorMsg);
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
                UncheckAll();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Create String Collection to store IDs of 
            //records to be deleted 
            StringCollection idCollection = new StringCollection();
            string strID = string.Empty;

            //Loop through GridView rows to find checked rows 
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkDelete = (CheckBox)GridView1.Rows[i].
                                 Cells[0].FindControl("chkSelect");
                if (chkDelete != null)
                {
                    if (chkDelete.Checked)
                    {
                        strID = GridView1.Rows[i].Cells[1].Text;
                        idCollection.Add(strID);
                    }
                }
            }
            if (idCollection.Count > 0)
            {
                //Call the method to Delete records 
                DeleteMultipleRecords(idCollection);

                // rebind the GridView
                GridView1.DataBind();
            }
            else
            {
                lblMessage.Text = "Please select any row to delete";
            }

        }
        private void DeleteMultipleRecords(StringCollection idCollection)
        {
            //Create sql Connection and Sql Command
            SqlConnection con = new SqlConnection(strConnection);
            SqlCommand cmd = new SqlCommand();
            //string IDs = "";

            foreach (string id in idCollection)
            {
               

                try
                {
                    String procedurename = "detailsdelete";
                    con.Open();
                    SqlCommand command = new SqlCommand(procedurename, con);
                    command.CommandType = CommandType.StoredProcedure;
                   
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    string errorMsg = "Error in Deletion";
                    errorMsg += ex.Message;
                    throw new Exception(errorMsg);
                }
                finally
                {
                    con.Close();
                }


            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkSelect_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkTest = (CheckBox)sender;
            GridViewRow grdRow = (GridViewRow)chkTest.NamingContainer;
            TextBox txtname = (TextBox)grdRow.FindControl
                                                ("txtName");
            TextBox txtlocation = (TextBox)grdRow.FindControl
                                              ("txtLocation");
            if (chkTest.Checked)
            {
                txtname.ReadOnly = false;
                txtlocation.ReadOnly = false;
                txtname.ForeColor = System.Drawing.Color.Black;
                txtlocation.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                txtname.ReadOnly = true;
                txtlocation.ReadOnly = true;
                txtname.ForeColor = System.Drawing.Color.Blue;
                txtlocation.ForeColor = System.Drawing.Color.Blue;
            }
        }

        private void UncheckAll()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkUncheck = (CheckBox)
                             row.FindControl("chkSelect");
                TextBox txtname = (TextBox)
                               row.FindControl("txtName");
                TextBox txtlocation = (TextBox)
                           row.FindControl("txtLocation");
                chkUncheck.Checked = false;
                txtname.ReadOnly = true;
                txtlocation.ReadOnly = true;
                txtname.ForeColor = System.Drawing.Color.Blue;
                txtlocation.ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String connectionstring = @"Data Source=LAPTOP-M8Q9V8HN\SQLSERVERDEV2017;Initial Catalog=DotNetProject;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionstring);
                String procedurename = "detailsinsert"; ;
                connection.Open();
                SqlCommand command = new SqlCommand(procedurename, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", insertid.Text.ToString());
                command.Parameters.AddWithValue("@name", insertname.Text.ToString());
                command.Parameters.AddWithValue("@location", insertlocation.Text.ToString());
              
                command.ExecuteNonQuery();
                connection.Close();
                lblMessage.Text = "New Record Added to Database";
                GridView1.DataBind();
            }
            catch (Exception er)
            {
                lblMessage.Text = er.Message;
            }
        }
    }
}