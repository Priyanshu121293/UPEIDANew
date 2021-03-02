using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using BEL_Allotment;
using BLL_Allotment;

namespace Allotment
{
    public partial class AddEmpQualification : System.Web.UI.Page
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
                    bindgridQualification();

                }
            }
            catch(Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Redirect("/Default.aspx");
            }
          
        }
      


        private void bindgridQualification()
        {
            belBookDetails objServiceTimelinesBEL = new belBookDetails();
            BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
            DataSet ds = new DataSet();
            try
            {
                ds = objServiceTimelinesBLL.GetgridforQualification();
                if (ds != null)
                {
                    Grid_Qualification.DataSource = ds;
                    Grid_Qualification.DataBind();
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
                    objServiceTimelinesBEL.Qualification           = txtQualification.Text.Trim();
                  
                    DataSet result = objServiceTimelinesBLL.InsertQualification(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridQualification();
                    }
                }
                else
                {
                    int ID                                         = Convert.ToInt32(ViewState["id"].ToString());
                    objServiceTimelinesBEL.QualificationID   = ID;
                    objServiceTimelinesBEL.Qualification     = txtQualification.Text.Trim();
                    objServiceTimelinesBEL.username          = UserName.Trim();
                    DataSet result = objServiceTimelinesBLL.UpdateQualificationDetails(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridQualification();
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
                txtQualification.Text = string.Empty;          
                BtnSubmit.Text = "Submit";
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            finally
            {

            }
        }


        private void Get_QualificationByID(string id)
        {
            DataSet ds = new DataSet();
            objServiceTimelinesBEL.QualificationID = Convert.ToInt32(id);
            ds = objServiceTimelinesBLL.GetQualificationDetailsByID(objServiceTimelinesBEL);
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    txtQualification.Text              = ds.Tables[0].Rows[0]["Qualification"].ToString();
                    BtnSubmit.Text = "Update";
                    bindgridQualification();
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

        private void Delete_Qualification(string id)
        {
            try
            {
                objServiceTimelinesBEL.QualificationID = Convert.ToInt32(id);           
                objServiceTimelinesBEL.username        = UserName.Trim();
                DataSet result = objServiceTimelinesBLL.DeleteQualification(objServiceTimelinesBEL);

                if (result.Tables.Count > 0)
                {
                    MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                    clear();
                    bindgridQualification();
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
                    Get_QualificationByID(rowid);
                  
                   

                }
                if (e.CommandName == "Deleted")
                {
                    string rowid = e.CommandArgument.ToString();
                    Delete_Qualification(rowid);
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