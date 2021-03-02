using System;
using System.Web.UI;

namespace Allotment
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Error occurred";
            string PreviousUri = Request["aspxerrorpath"];
            if (!string.IsNullOrEmpty(PreviousUri))
            {
                pnlError.Visible = true;
                hlinkPreviousPage.NavigateUrl = PreviousUri;
            }
        }
    }
}