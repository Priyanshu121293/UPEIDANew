using System;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using BEL_Allotment;
using DLL_Allotment;


namespace BLL_Allotment

{
    public class BooksDetails_BLL
    {

        #region "Land Allotment"

        public DataSet GetAllNodeForDDl()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetAllNodeForDDl();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet GetAdvertisedPlot(belBookDetails objBel)
        {

            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetAdvertisedPlot(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet GetBulkLandIA(belBookDetails objBel)
        {

            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetBulkLandIA(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        #endregion



        #region "Qualification Master"


        public DataSet GetQualificationDetailsByID(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetQualificationDetailsByID(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet DeleteQualification(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.DeleteQualification(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet UpdateQualificationDetails(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.UpdateQualificationDetails(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet InsertQualification(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.InsertQualification(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet GetgridforQualification()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetgridforQualification();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        #endregion

        #region "Designations Master"


        public DataSet GetDesignationsDetailsByID(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetDesignationsDetailsByID(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet DeleteDesignations(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.DeleteDesignations(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet UpdateDesignationsDetails(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.UpdateDesignationsDetails(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet InsertDesignations(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.InsertDesignations(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet GetgridforDesignations()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetgridforDesignations();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        #endregion

        #region "Department Master"


        public DataSet GetDepartmentDetailsByID(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetDepartmentDetailsByID(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet DeleteDepartment(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.DeleteDepartment(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet UpdateDepartmentsDetails(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.UpdateDepartmentsDetails(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet InsertDepartments(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.InsertDepartments(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet GetgridforDepartments()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetgridforDepartments();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        #endregion

        #region "UserCreation"

        public DataSet GetDesignationDetails()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();

            try

            {

                return objDal.GetDesignationDetails();

            }

            catch (Exception ex)

            {

                throw ex;

            }

            finally

            {

                objDal = null;

            }
        }

        public DataSet GetQualification()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetQualification();
            }
            catch (Exception ex)
            {
               throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet GetDepartment()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetDepartment();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }


        public DataSet GetgridforUsercreation()
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();

            try

            {

                return objDal.GetgridforUsercreation();

            }

            catch (Exception ex)

            {

                throw ex;

            }

            finally

            {

                objDal = null;

            }
        }

        public DataSet InsertUserDetails(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.InsertUserDetails(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet UpdateUserDetails(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.UpdateUserDetails(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet GetUserDetails(string id)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetUserDetails(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public Int32 Delete_Userdetals(string id)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.Delete_Userdetals(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }
        public DataSet GetgridforSearchUsercreation(string search)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();

            try

            {

                return objDal.GetgridforSearchUsercreation(search);

            }

            catch (Exception ex)

            {

                throw ex;

            }

            finally

            {

                objDal = null;

            }
        }

        #endregion

        #region "Login"

        public DataSet GetInternalUserPersonalDetails(string strName)
        {

            BooksDetails_DAL objDal = new BooksDetails_DAL();

            try
            {
                return objDal.GetInternalUserPersonalDetails(strName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        public DataSet GetLoginDetailCheck(belBookDetails objBel)
        {

            BooksDetails_DAL objDal = new BooksDetails_DAL();

            try
            {
                return objDal.GetLoginDetailCheck(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }


        public Int32 CheckLogin(belBookDetails objBel)
        {
            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {

                return objDal.CheckLogin(objBel);
            }
            catch (Exception ex)
            {

                throw ex;

            }
            //finally
            //{

            //    objDal = null;
            //}
        }

        #endregion

        #region "Masters"
        public DataSet GetUserRecords(belBookDetails objBel)
        {

            BooksDetails_DAL objDal = new BooksDetails_DAL();
            try
            {
                return objDal.GetUserRecords(objBel);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDal = null;
            }
        }

        #endregion
    }






}







