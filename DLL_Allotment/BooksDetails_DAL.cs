using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using BEL_Allotment;

namespace DLL_Allotment
{
    public class BooksDetails_DAL
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);


        #region "LandAllotment"

        public DataSet GetAdvertisedPlot(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_GetListOfAdvertisedPlots]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NodeID", objBEL.NodeID);
                
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetBulkLandIA(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_GetListOfLandAvailable]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NodeID", objBEL.NodeID);

                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetAllNodeForDDl()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetAllNodeForDdl]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        #endregion


        #region "Qualification Master"
        public DataSet GetQualificationDetailsByID(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetQualificationetailsByID]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", objBEL.QualificationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet DeleteQualification(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_DeleteQualification]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@ID", objBEL.QualificationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }


        public DataSet UpdateQualificationDetails(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_UpdateQualification]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@Qualification", objBEL.Qualification);
                cmd.Parameters.AddWithValue("@ID", objBEL.QualificationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet InsertQualification(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_AddQualification]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@Qualification", objBEL.Qualification);


                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetgridforQualification()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetQualificationdetails]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        #endregion


        #region "Designations Master"
        public DataSet GetDesignationsDetailsByID(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetDesignationdetailsByID]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DesignationID", objBEL.DesignationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet DeleteDesignations(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_DeleteDesignation]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@DesignationID", objBEL.DesignationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }


        public DataSet UpdateDesignationsDetails(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_UpdateDesignation]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@DesignationFullName", objBEL.DesignationFullName);
                cmd.Parameters.AddWithValue("@DesignationNickName", objBEL.DesignationNickName);
                cmd.Parameters.AddWithValue("@Grade", objBEL.Grade);
                cmd.Parameters.AddWithValue("@DesignationID", objBEL.DesignationID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet InsertDesignations(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_AddDesignation]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@DesignationFullName", objBEL.DesignationFullName);
                cmd.Parameters.AddWithValue("@DesignationNickName", objBEL.DesignationNickName);
                cmd.Parameters.AddWithValue("@Grade", objBEL.Grade);


                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetgridforDesignations()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetDesignationdetails]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        #endregion

        #region "Department Master"
        public DataSet GetDepartmentDetailsByID(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetDepartmentdetailsByID]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptID", objBEL.DeptID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet DeleteDepartment(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_DeleteDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);             
                cmd.Parameters.AddWithValue("@DeptID", objBEL.DeptID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }


        public DataSet UpdateDepartmentsDetails(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_UpdateDepartments]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@DeptName", objBEL.DeptName);
                cmd.Parameters.AddWithValue("@DeptNickName", objBEL.DeptNickName);
                cmd.Parameters.AddWithValue("@DeptID", objBEL.DeptID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet InsertDepartments(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_AddDepartments]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", objBEL.username);
                cmd.Parameters.AddWithValue("@DeptName", objBEL.DeptName);
                cmd.Parameters.AddWithValue("@DeptNickName", objBEL.DeptNickName);
              

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetgridforDepartments()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetDepartmentdetails]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        #endregion



        #region "User Creation"

        public DataSet GetDepartment()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetEmpDepartmentdetails]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet GetQualification()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[spGetEmpQualificationsdetails]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetDesignationDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spGetDesignationdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetgridforUsercreation()
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spGetUserdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet InsertUserDetails(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlCommand cmd = new SqlCommand("[sp_AddLoginUserInternal]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pUsername", objBEL.username);
                cmd.Parameters.AddWithValue("@pPassword", objBEL.Password);
                cmd.Parameters.AddWithValue("@pDesignationID", objBEL.Designation);
                cmd.Parameters.AddWithValue("@Qualification", objBEL.Qualification);
                cmd.Parameters.AddWithValue("@pEmpcode", objBEL.Empcode);
                cmd.Parameters.AddWithValue("@pJoiningDate", objBEL.JoiningDate);
                cmd.Parameters.AddWithValue("@pRetirementDate", objBEL.RetirementDate);
                cmd.Parameters.AddWithValue("@pContractType", objBEL.ContractType);
                cmd.Parameters.AddWithValue("@PhoneNo", objBEL.phoneNo);
                cmd.Parameters.AddWithValue("@emailID", objBEL.Email);
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@isDeleted", 0);
                cmd.Parameters.AddWithValue("@pEmployeename", objBEL.Employee);
                cmd.Parameters.AddWithValue("@DeptID", objBEL.DeptID);

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet UpdateUserDetails(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("[sp_UpdateLoginUserInternal]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pUserID", objBEL.UserID);
                cmd.Parameters.AddWithValue("@pUsername", objBEL.username);
                cmd.Parameters.AddWithValue("@pPassword", objBEL.Password);
                cmd.Parameters.AddWithValue("@pDesignationID", objBEL.Designation);
                cmd.Parameters.AddWithValue("@Qualification", objBEL.Qualification);
                cmd.Parameters.AddWithValue("@pEmpcode", objBEL.Empcode);
                cmd.Parameters.AddWithValue("@pJoiningDate", objBEL.JoiningDate);
                cmd.Parameters.AddWithValue("@pRetirementDate", objBEL.RetirementDate);
                cmd.Parameters.AddWithValue("@pContractType", objBEL.ContractType);
                cmd.Parameters.AddWithValue("@PhoneNo", objBEL.phoneNo);
                cmd.Parameters.AddWithValue("@emailID", objBEL.Email);
                cmd.Parameters.AddWithValue("@isActive", 1);
                cmd.Parameters.AddWithValue("@isDeleted", 0);
                cmd.Parameters.AddWithValue("@pEmployeename", objBEL.Employee);
                cmd.Parameters.AddWithValue("@DeptID", objBEL.DeptID);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public DataSet GetUserDetails(string id)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spGetUsercreationdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USERID", id);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }
        public Int32 Delete_Userdetals(string id)
        {
            int result;
            try
            {
                SqlCommand cmd = new SqlCommand("DeleteUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", id);


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                if (result > 0)
                {
                    return result;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        public DataSet GetgridforSearchUsercreation(string search)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spGetUserdetails_2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@search", search);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        #endregion

        #region "Masters"

        public DataSet GetUserRecords(belBookDetails objBEL)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("sp_GetUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@role", objBEL.Roll);
                cmd.Parameters.AddWithValue("@userID", objBEL.UserName);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }


        #endregion
       
        #region "Login"
        public Int32 CheckLogin(belBookDetails objBEL)
        {
            int result;
            try
            {
                SqlCommand cmd = new SqlCommand();
                if (objBEL.Roll == "1") { cmd = new SqlCommand("sp_InternalUserLogin", con); }

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pLoginName", objBEL.UserName);
                cmd.Parameters.AddWithValue("@pPassword", objBEL.Password);
                //cmd.Parameters.AddWithValue("@Idendical", objBEL.Roll);

                //Add the output parameter to the command object
                SqlParameter outPutParameter = new SqlParameter();
                outPutParameter.ParameterName = "@responseMessage";
                outPutParameter.SqlDbType = System.Data.SqlDbType.NVarChar;
                outPutParameter.Direction = System.Data.ParameterDirection.Output;
                outPutParameter.Size = 50;
                cmd.Parameters.Add(outPutParameter);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                result = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
                //Retrieve the value of the output parameter


                if (result == 0)
                {
                    objBEL.responseMessage = outPutParameter.Value.ToString();
                    return result;
                }
                else
                {
                    objBEL.responseMessage = outPutParameter.Value.ToString();
                    return 0;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }

        public DataSet GetInternalUserPersonalDetails(string strName)
        {
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spc_GetInternalUserDetail", con);
                cmd.Parameters.AddWithValue("@username", strName);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 1000;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        public DataSet GetLoginDetailCheck(belBookDetails objBEL)
        {

            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("spGetInternalLoginCheck", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pLoginName", objBEL.UserName);
                cmd.Parameters.AddWithValue("@pPassword", objBEL.Password);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                cmd.Dispose();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds.Dispose();
            }
            return ds;
        }

        #endregion



    }
}
