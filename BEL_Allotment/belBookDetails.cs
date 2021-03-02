using System;

namespace BEL_Allotment
{
    public class belBookDetails
    {

        #region "Land Allotment"
        public int NodeID { get; set; }
        #endregion

        #region "Qualifcation Master"
        public int QualificationID { get; set; }
        #endregion

        #region "Department Master"

        public string DesignationFullName { get; set; }
        public string DesignationNickName { get; set; }
        public string Grade { get; set; }
        public int DesignationID { get; set; }
        #endregion


        #region "Department Master"

        public int DeptID { get; set; }
        public int Designation { get; set; }
        public string Qualification { get; set; }
        public string username { get; set; }
        public string phoneNo { get; set; }

        public string DeptName { get; set; }
        public string DeptNickName { get; set; }

        #endregion


        #region "New User Creation"

        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }

        public DateTime JoiningDate { get; set; }
        public DateTime RetirementDate { get; set; }
        public string Password { get; set; }
        public string Employee { get; set; }
        public string ContractType { get; set; }
        public string Email { get; set; }
        public int Empcode { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public object responseMessage { get; set; }
        public string Roll { get; set; }

        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }

        #endregion





























    }
}
