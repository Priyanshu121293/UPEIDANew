using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using BEL_Allotment;
using BLL_Allotment;

namespace Allotment
{
    public partial class MainUser : System.Web.UI.MasterPage
    {
        #region "Create and Initialize objects "
        belBookDetails objServiceTimelinesBEL = new belBookDetails();
        BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
        #endregion

        string lbldesignationid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblname.Text = Convert.ToString(Session["UserName"]);
            }
            catch
            {
                Response.Redirect("/Default.aspx");
            }

            if (lblname.Text == "")
            {
                Response.Redirect("/Default.aspx");
            }
            else
            {

               

                lblname.Text = Convert.ToString(Session["UserName"]);
              
               

                if (!IsPostBack)
                {
                    GetUserRecord(lblname.Text, Session["Type"].ToString().Trim());                   
                }
            }
        }

        public void GetUserRecord(string username, string category)
        {
            objServiceTimelinesBEL.Roll = category;
            objServiceTimelinesBEL.UserName = username;
         
            DataSet ds = new DataSet();
            try
            {
                ds = objServiceTimelinesBLL.GetUserRecords(objServiceTimelinesBEL);
                if (ds.Tables[0].Rows.Count >= 0)
                {
                    lbldesignationid    = ds.Tables[0].Rows[0]["DesignationID"].ToString();
                    
                    int userID = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
                    LoginInfo _objLoginInfo = new LoginInfo(username, category, userID);
                    Session["objLoginInfo"] = _objLoginInfo;

                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
               
            }
            finally
            {
                objServiceTimelinesBEL = null;
                objServiceTimelinesBLL = null;
            }


            masterMenu(Session["Type"].ToString().Trim());
        }






        public void masterMenu(string cat)
        {

          
          
        }





    }
}