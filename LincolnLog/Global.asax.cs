using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace LincolnLog
{
    public class Global : System.Web.HttpApplication
    {
        public static HttpCookie cookieShowView = new HttpCookie("showView");
       
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Session["calView"] = 0; // 0=year, 1=month, 2=day
            cookieShowView.Value = "0";
            Response.Cookies.Add(cookieShowView);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}