using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using BEL_Allotment;
using BLL_Allotment;

namespace Allotment
{
    public partial class AddEmpDesignation : System.Web.UI.Page
    {
        #region "Create and Initialize objects "
        belBookDetails objServiceTimelinesBEL = new belBookDetails();
        BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();

        string UserName = "";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                LoginInfo _objLoginInfo = (LoginInfo)Session["objLoginInfo"];
                UserName = _objLoginInfo.userName;


                if (!IsPostBack)
                {
                    bindgridDesignation();

                }
            }
            catch(Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Redirect("/Default.aspx");
            }
          
        }
      


        private void bindgridDesignation()
        {
            belBookDetails objServiceTimelinesBEL = new belBookDetails();
            BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
            DataSet ds = new DataSet();
            try
            {
                ds = objServiceTimelinesBLL.GetgridforDesignations();
                if (ds != null)
                {
                    Grid_Designation.DataSource = ds;
                    Grid_Designation.DataBind();
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (BtnSubmit.Text == "Submit")
                {

                    objServiceTimelinesBEL.username                = UserName.Trim();
                    objServiceTimelinesBEL.DesignationFullName     = txtDesFull.Text.Trim();
                    objServiceTimelinesBEL.DesignationNickName     = txtDesNickName.Text.Trim();
                    objServiceTimelinesBEL.Grade = txtGrade.Text.Trim();
                    DataSet result = objServiceTimelinesBLL.InsertDesignations(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridDesignation();
                    }
                }
                else
                {
                    int ID                              = Convert.ToInt32(ViewState["id"].ToString());
                    objServiceTimelinesBEL.DesignationID       = ID;
                    objServiceTimelinesBEL.DesignationFullName     = txtDesFull.Text.Trim();
                    objServiceTimelinesBEL.DesignationNickName = txtDesNickName.Text.Trim();
                    objServiceTimelinesBEL.username     = UserName.Trim();
                    objServiceTimelinesBEL.Grade = txtGrade.Text.Trim();
                    DataSet result = objServiceTimelinesBLL.UpdateDesignationsDetails(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridDesignation();
                    }
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
           
        }
        public void clear()
        {
            try
            {

                txtDesNickName.Text = string.Empty;
                txtDesFull.Text     = string.Empty;
                txtGrade.Text = string.Empty; 
                BtnSubmit.Text = "Submit";
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }


        private void Get_DesignationsByID(string id)
        {
            DataSet ds = new DataSet();
            objServiceTimelinesBEL.DesignationID = Convert.ToInt32(id);
            ds = objServiceTimelinesBLL.GetDesignationsDetailsByID(objServiceTimelinesBEL);
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    txtDesNickName.Text              = ds.Tables[0].Rows[0]["DesignationNickName"].ToString();
                    txtDesFull.Text                  = ds.Tables[0].Rows[0]["DesignationFullName"].ToString();
                    txtGrade.Text                    = ds.Tables[0].Rows[0]["Grade"].ToString();


                    BtnSubmit.Text = "Update";
                    bindgridDesignation();
                }
                else
                {
                    clear();
                    BtnSubmit.Text = "Submit";
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
           

        }

        private void Delete_Designation(string id)
        {
            try
            {
                objServiceTimelinesBEL.DesignationID = Convert.ToInt32(id);
             
                objServiceTimelinesBEL.username = UserName.Trim();
                DataSet result = objServiceTimelinesBLL.DeleteDesignations(objServiceTimelinesBEL);

                if (result.Tables.Count > 0)
                {
                    MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                    clear();
                    bindgridDesignation();
                }
                else
                {
                    MessageBox1.ShowError("Some Error Occured");
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
       

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void Grid_Designation_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Process")
                {

                    string rowid = e.CommandArgument.ToString();
                    ViewState["id"] = rowid;
                    Get_DesignationsByID(rowid);
                  
                   

                }
                if (e.CommandName == "Deleted")
                {
                    string rowid = e.CommandArgument.ToString();
                    Delete_Designation(rowid);
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
    }
}