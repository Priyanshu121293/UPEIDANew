using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Allotment
{
    public static class ExceptionLogging
    {

        private static String exepurl;
        static SqlConnection con;
        private static void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            con = new SqlConnection(constr);
            con.Open();
        }
        public static void SendExcepToDB(Exception exdb)
        {
            connection();
            exepurl = HttpContext.Current.Request.Url.AbsoluteUri; 
            SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ExceptionMsg", exdb.Message.ToString());
            com.Parameters.AddWithValue("@ExceptionType", exdb.GetType().Name.ToString());
            com.Parameters.AddWithValue("@ExceptionURL", exepurl);
            com.Parameters.AddWithValue("@ExceptionSource", exdb.StackTrace.ToString());
            com.ExecuteNonQuery();
        }
    }
}