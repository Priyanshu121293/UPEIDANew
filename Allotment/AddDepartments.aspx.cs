using System;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using BEL_Allotment;
using BLL_Allotment;

namespace Allotment
{
    public partial class AddDepartments : System.Web.UI.Page
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
                    bindgridDepartments();

                }
            }
            catch
            {
                Response.Redirect("/Default.aspx");
            }
          
        }
      


        private void bindgridDepartments()
        {
            belBookDetails objServiceTimelinesBEL = new belBookDetails();
            BooksDetails_BLL objServiceTimelinesBLL = new BooksDetails_BLL();
            DataSet ds = new DataSet();
            try
            {
                ds = objServiceTimelinesBLL.GetgridforDepartments();
                if (ds != null)
                {
                    Grid_Departments.DataSource = ds;
                    Grid_Departments.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (BtnSubmit.Text == "Submit")
                {

                    objServiceTimelinesBEL.username     = UserName.Trim();
                    objServiceTimelinesBEL.DeptName     = txtDeptFull.Text.Trim();
                    objServiceTimelinesBEL.DeptNickName = txtDeptNickName.Text.Trim();
                    DataSet result = objServiceTimelinesBLL.InsertDepartments(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridDepartments();
                    }
                }
                else
                {
                    int ID                              = Convert.ToInt32(ViewState["id"].ToString());
                    objServiceTimelinesBEL.DeptID       = ID;
                    objServiceTimelinesBEL.DeptName     = txtDeptFull.Text.Trim();
                    objServiceTimelinesBEL.DeptNickName = txtDeptNickName.Text.Trim();
                    objServiceTimelinesBEL.username     = UserName.Trim();
                    DataSet result = objServiceTimelinesBLL.UpdateDepartmentsDetails(objServiceTimelinesBEL);

                    if (result.Tables.Count > 0)
                    {
                        MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                        clear();
                        bindgridDepartments();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
           
        }
        public void clear()
        {
            try
            {

                txtDeptNickName.Text = string.Empty;
                txtDeptFull.Text     = string.Empty;
                BtnSubmit.Text = "Submit";
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            finally
            {

            }
        }


        private void Get_DepartmentsByID(string id)
        {
            DataSet ds = new DataSet();
            objServiceTimelinesBEL.DeptID = Convert.ToInt32(id);
            ds = objServiceTimelinesBLL.GetDepartmentDetailsByID(objServiceTimelinesBEL);
            try
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    txtDeptNickName.Text              = ds.Tables[0].Rows[0]["DeptNickName"].ToString();
                    txtDeptFull.Text                  = ds.Tables[0].Rows[0]["DeptFullName"].ToString();
                 
                    BtnSubmit.Text = "Update";
                    bindgridDepartments();
                }
                else
                {
                    clear();
                    BtnSubmit.Text = "Submit";
                }
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
           

        }

        private void Delete_Userdetals(string id)
        {
            try
            {
                objServiceTimelinesBEL.DeptID = Convert.ToInt32(id);
             
                objServiceTimelinesBEL.username = UserName.Trim();
                DataSet result = objServiceTimelinesBLL.DeleteDepartment(objServiceTimelinesBEL);

                if (result.Tables.Count > 0)
                {
                    MessageBox1.ShowSuccess(result.Tables[0].Rows[0][0].ToString());
                    clear();
                    bindgridDepartments();
                }
                else
                {
                    MessageBox1.ShowError("Some Error Occured");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
       

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void Grid_Departments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Process")
                {

                    string rowid = e.CommandArgument.ToString();
                    ViewState["id"] = rowid;
                    Get_DepartmentsByID(rowid);
                  
                   

                }
                if (e.CommandName == "Deleted")
                {
                    string rowid = e.CommandArgument.ToString();
                    Delete_Userdetals(rowid);
                }
            }
            catch (Exception ex)
            {
                Response.Write("Oops! error occured :" + ex.Message.ToString());
            }
            
        }
    }
}