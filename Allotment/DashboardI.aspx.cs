using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_Allotment;
using BLL_Allotment;
namespace Allotment
{

    public partial class DashboardI : System.Web.UI.Page
    {

        #region "Create and Initialize objects "
        belBookDetails objServiceTimelinesBEL = new belBookDetails();
        BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
        SqlConnection con = new SqlConnection();
        #endregion

        string UserName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

            try
            {
                LoginInfo _objLoginInfo = (LoginInfo)Session["objLoginInfo"];
                UserName = _objLoginInfo.userName;

            
                GetInternalUserPersonalDetails(UserName);
                if (!IsPostBack)
                {
                    
                }
            }
            catch
            {
                Response.Redirect("/Default.aspx");
            }

        }


        #region GetInternalUserPersonalDetails
        public void GetInternalUserPersonalDetails(string strName)
        {
           
            try
            {
                DataSet dsR = objServiceTimelinesBLL.GetInternalUserPersonalDetails(strName);

                DataTable dt = dsR.Tables[0];
             

                if (dt.Rows.Count > 0)
                {
                    lblName.Text = dt.Rows[0]["EMPLOYEENAME"].ToString();
                    lbldesignation.Text = dt.Rows[0]["Designation"].ToString();
                    lblGrade.Text = dt.Rows[0]["Grade"].ToString();
                    lblPhoneNo.Text = dt.Rows[0]["phoneNo"].ToString();
                    lblEmail.Text = dt.Rows[0]["emailID"].ToString();
                
             



                }
          
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
        }

        #endregion

       

    

      


    }
}