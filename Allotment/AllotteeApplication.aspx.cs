
using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BEL_Allotment;
using BLL_Allotment;

namespace Allotment
{
    public partial class AllotteeApplication : System.Web.UI.Page
    {
        #region "Create and Initialize objects "
        belBookDetails objServiceTimelinesBEL = new belBookDetails();
        BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();

        String ServiceReqNo = "";
        String TraID = "";

        string ControlID = "";
        string Request_ID = "";
        string UnitID = "";
        string ServiceID = "";
        string NM_DistrictID = "";
        string ProcessIndustryID = "";
        string ApplicationID = "";
        
        string passsalt = "p5632aa8a5c915ba4b896325bc5baz8k";
        string Status_Code = "";
        string Remarks = "";
        string Fee_Amount = "";
        string Fee_Status = "";
        string Transaction_ID = "";
        string Transaction_Date = "";
        string Transaction_Date_Time = "";
        string NOC_Certificate_Number = "";
        string NOC_URL = "";
        string ISNOC_URL_ActiveYesNO = "";
        string Objection_Rejection_Code = "";
        string Is_Certificate_Valid_Life_Time = "";
        string Certificate_EXP_Date_DDMMYYYY = "";
        string D1 = "";
        string D2 = "";
        string D3 = "";
        string D4 = "";
        string D5 = "";
        string D6 = "";
        string D7 = "";

        public string ViewID;
        public string App = "";
        SqlConnection con;

        
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Enctype = "multipart/form-data";
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
                if (Request.Form["TxtControlID"] != null)
                {

                    ServiceReqNo = Request.QueryString["ServiceID"];
                  
                    ViewState["ControlID"] = Request.Form["TxtControlID"];
                    ViewState["UnitID"] = Request.Form["TxtUnitID"];
                    ViewState["ServiceID"] = Request.Form["TxtServiceID"];
                    ViewState["ProcessIndustryID"] = Request.Form["TxtProcessIndustryID"];
                    ViewState["ApplicationID"] = Request.Form["TxtApplicationID"];
                    ViewState["Request_ID"] = Request.Form["TxtRequestID"];
                    ViewState["Allotmentletterno"] = "";
                }

                if (ViewState["ControlID"] != null)
                {
                    ControlID = ViewState["ControlID"].ToString().Trim();
                    UnitID = ViewState["UnitID"].ToString().Trim();
                    ServiceID = ViewState["ServiceID"].ToString().Trim();
                    ProcessIndustryID = ViewState["ProcessIndustryID"].ToString().Trim();
                    ApplicationID = ViewState["ApplicationID"].ToString().Trim();
                    Request_ID = ViewState["Request_ID"].ToString().Trim();
                }
                PageHeadingLbl.Text = "Application For Land Allottment";

                if (ServiceReqNo == "" || ServiceReqNo == null)
                {
                    if (!IsPostBack)
                    {
                        BindDDLNode();

                        if (multi.ActiveViewIndex <= 0)
                        {
                            multi.ActiveViewIndex = 0;

                        }

                        if (ControlID.Length > 0)
                        {
                            NiveshMitra();
                        }

                        if (Allotment.ActiveViewIndex <= 0)
                        {
                            if (ControlID.Length > 0)
                            {
                                Allotment.ActiveViewIndex = 0;
                            }
                            else
                            {
                                Allotment.ActiveViewIndex = 1;
                            }
                        }
                        else
                        {

                            Allotment.ActiveViewIndex = 3;

                        }

                    }

                }

               

            }
            catch (Exception ex)
            {

                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "Alert('" + ex.ToString() + "');", true);
                return;
            }
        }



        protected void BindDDLNode()
        {
            belBookDetails objServiceTimelinesBEL = new belBookDetails();
            BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
           
            DataSet dsR = new DataSet();
            try
            {
                dsR                      = objServiceTimelinesBLL.GetAllNodeForDDl();
                ddl_Node.DataSource      = dsR.Tables[0];
                ddl_Node.DataTextField   = "ParkName";
                ddl_Node.DataValueField  = "ParkNo";
                ddl_Node.DataBind();
                ddl_Node.Items.Insert(0, new ListItem("--Select--", "0"));

               
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            
            int index = Int32.Parse(e.Item.Value);
            multi.ActiveViewIndex = index;
            if (index == 0)
            {
                BindPlotsInGrid();
                GridPlot.Visible = true;
                GridSubDivision.Visible = false;
                
            }
            if (index == 1)
            {
                BindBulkLandInGrid();
                GridPlot.Visible = false;
                GridSubDivision.Visible = true;
               
            }
            
        }


        private void BindBulkLandInGrid()
        {
            objServiceTimelinesBEL.NodeID = Convert.ToInt32(ddl_Node.SelectedValue.Trim());
            DataSet ds = new DataSet();
            try
            {

                ds = objServiceTimelinesBLL.GetBulkLandIA(objServiceTimelinesBEL);

                if (ds.Tables.Count > 0)
                {

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        btnSave.Enabled = true;
                        GridSubDivision.DataSource = ds.Tables[0];
                        GridSubDivision.DataBind();
                    }
                    else
                    {
                        string message = "Please note that for the node you selected there are no plots available for allotment at this time. You can explore other nodes for the availability of plots.";
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "DisplayMultiLineAlert('" + message + "');", true);
                        btnSave.Enabled = false;
                        GridSubDivision.DataSource = null;
                        GridSubDivision.DataBind();
                    }


                }



            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            finally
            {
                objServiceTimelinesBEL = null;
                objServiceTimelinesBLL = null;
            }


        }
        private void BindPlotsInGrid()
        {
            objServiceTimelinesBEL.NodeID = Convert.ToInt32(ddl_Node.SelectedValue.Trim());
            DataSet ds = new DataSet();
            try
            {

                ds = objServiceTimelinesBLL.GetAdvertisedPlot(objServiceTimelinesBEL);

                if (ds.Tables.Count > 0)
                {

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        btnSave.Enabled = true;
                        GridPlot.DataSource = ds.Tables[0];
                        GridPlot.DataBind();
                    }
                    else
                    {
                        string message = "Please note that for the industrial area you selected there are no plots available for allotment at this time. You can explore other industrial areas for the availability of plots.";
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "DisplayMultiLineAlert('" + message + "');", true);
                        btnSave.Enabled = false;
                        GridPlot.DataSource = null;
                        GridPlot.DataBind();
                    }


                }



            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            finally
            {
                objServiceTimelinesBEL = null;
                objServiceTimelinesBLL = null;
            }


        }
        protected void check_CheckedChanged(object sender, EventArgs e)
        {

            int count = 0;
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;
            CheckBox ddl2 = (CheckBox)row.FindControl("check");


            foreach (GridViewRow gvrow in GridPlot.Rows)
            {


                CheckBox myCheckBox = (CheckBox)gvrow.FindControl("check");
                if (myCheckBox.Checked == true)
                {
                    count = count + 1;
                }

            }

            int index = Convert.ToInt32(row.RowIndex);

            string PlotNumber = GridPlot.DataKeys[index].Values[0].ToString() + "|" + GridPlot.DataKeys[index].Values[1].ToString() + "|" + "SQmts.";

            if (ddl2.Checked == true)
            {

                if (count > 1)
                {
                    string message = "Please Select Only Single Plot";
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "alert('" + message + "');", true);
                    ddl2.Checked = false;
                    return;
                }
               

                if (txtp1.Text == "")
                { txtp1.Text = PlotNumber; }
               

            }
            else if (ddl2.Checked == false)
            {
                if (txtp1.Text == PlotNumber)
                {
                    txtp1.Text = "";
                }
               

            }
        }
        private void NiveshMitra()
        {

            if (ControlID.Length > 0)
            {


                try
                {

                    ServiceReference1.upswp_niveshmitraservicesSoapClient webService = new ServiceReference1.upswp_niveshmitraservicesSoapClient();
                    DataSet ds = webService.WGetBasicDetails(ControlID, UnitID, ServiceID, "", passsalt);
                    DataTable dt = ds.Tables[0];

                    if (dt.Rows.Count > 0)
                    {

                        lblControlId.Text            = ControlID;
                        lblUnitId.Text               = UnitID;
                        lblCompanyName.Text          = dt.Rows[0]["Company_Name"].ToString();
                        lblIndustryDistrict.Text     = dt.Rows[0]["Industry_District"].ToString();
                        lblIndustryAddress.Text      = dt.Rows[0]["Industry_Address"].ToString();
                        lblIndustryPincode.Text      = dt.Rows[0]["Pin_Code"].ToString();
                        lblOccupierName.Text         = dt.Rows[0]["Occupier_Name"].ToString();
                        lblOccupierEmail.Text        = dt.Rows[0]["Occupier_Email_ID"].ToString();
                        lblOccupierPhone.Text        = dt.Rows[0]["Occupier_Mobile_No"].ToString();
                        lblOccupierPAN.Text          = dt.Rows[0]["Occupier_PAN"].ToString();
                        lblOccupierAddress.Text      = dt.Rows[0]["Occupier_Address"].ToString();
                        lblOccupierDistrictName.Text = dt.Rows[0]["Occupier_District_Name"].ToString();
                        lblNatureofActivity.Text     = dt.Rows[0]["Nature_of_Activity"].ToString();
                        lblInstalledCapacity.Text    = dt.Rows[0]["Installed_Capacity"].ToString();
                        lblNoOfEmployee.Text         = dt.Rows[0]["Employees"].ToString();
                        lblNature_of_Operation.Text  = dt.Rows[0]["Nature_of_Operation"].ToString();
                        lblProject_Cost.Text         = dt.Rows[0]["Project_Cost"].ToString();
                        lblOrganization_Type.Text    = dt.Rows[0]["Organization_Type"].ToString();
                        lblIndustry_Type_Name.Text   = dt.Rows[0]["Industry_Type_Name"].ToString();
                        lblItems_Manufactured.Text   = dt.Rows[0]["Items_Manufactured"].ToString();
                        lblAnnual_Turnover.Text      = dt.Rows[0]["Annual_Turnover"].ToString();

                    }
                }
                catch (Exception ex)
                {

                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "alert('Something Went Wrong With Nivesh Mitra Server');", true);
                    return;
                }

            }

        }


   
  
      
        protected void btn_backNmswp_Click(object sender, EventArgs e)
        {
            try
            {
             

                string SWCControlID = NMSWPEncryption.Class1.EncryptString("ABCDEFGHIJKLMNOP", ControlID);
                string SWCUnitID    = NMSWPEncryption.Class1.EncryptString("ABCDEFGHIJKLMNOP", UnitID);
                string SWCServiceID = NMSWPEncryption.Class1.EncryptString("ABCDEFGHIJKLMNOP", ServiceID);
                string DeptID       = NMSWPEncryption.Class1.EncryptString("ABCDEFGHIJKLMNOP", (21).ToString());
                string PassSalt     = NMSWPEncryption.Class1.EncryptString("ABCDEFGHIJKLMNOP", "p5632aa8a5c915ba4b896325bc5baz8k");
                NameValueCollection collections = new NameValueCollection();
                collections.Add("Dept_Code", DeptID.Trim());
                collections.Add("ControlID", SWCControlID.Trim());
                collections.Add("UnitID",    SWCUnitID.Trim());
                collections.Add("ServiceID", SWCServiceID.Trim());
                collections.Add("PassSalt",  PassSalt.Trim());
                string remoteUrl = "http://niveshmitra.up.nic.in/nmmasters/Entrepreneur_Bck_page.aspx";

                string html = "<html><head>";
                html += "</head><body onload='document.forms[0].submit()'>";
                html += string.Format("<form name='PostForm' style='display:none;' method='POST' action='{0}'>", remoteUrl);
                foreach (string key in collections.Keys)
                {
                    html += string.Format("<input name='{0}' type='text' value='{1}'>", key, collections[key]);
                }
                html += "</form></body></html>";
                Response.Clear();
                Response.ContentEncoding = Encoding.GetEncoding("ISO-8859-1");
                Response.HeaderEncoding = Encoding.GetEncoding("ISO-8859-1");
                Response.Charset = "ISO-8859-1";
                Response.Write(html);
                Response.End();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void proceedAnchor_ServerClick(object sender, EventArgs e)
        {
            try
            {
               
                    DataSet ds = new DataSet();

                    if (ControlID.Length > 0)
                    {
                       
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "ShowTermsAndCondition();", true);
                        
                    }
                    else
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "call_show", "ShowTermsAndCondition();", true);
                    }
                
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex);
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
        }

        protected void btnIAccept_Click(object sender, EventArgs e)
        {
            Allotment.ActiveViewIndex = 2;
        }

        protected void ddl_Node_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (multi.ActiveViewIndex == 0)
            {
                BindPlotsInGrid();
                GridPlot.Visible = true;
                GridSubDivision.Visible = false;
               
            }
            if (multi.ActiveViewIndex == 1)
            {
                
                GridPlot.Visible = false;
                GridSubDivision.Visible = true;
               
            }
        }
    }
}