using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace LincolnLog
{
    public partial class ThisDay : System.Web.UI.Page
    {
        #region Properties
        private int _year = 0;

        public int Year
        {
            get { return _year; }
            set { _year = value; }
        }
        private int _month = 0;

        public int Month
        {
            get { return _month; }
            set { _month = value; }
        }
        int _day = 0;

        public int Day
        {
            get { return _day; }
            set { _day = value; }
        }

        HttpCookie cookieShowView = new HttpCookie("showView");
        #endregion

        protected override void Render(HtmlTextWriter writer)
        {
            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(new System.IO.StringWriter()))
            {
                base.Render(htmlwriter);
                string html = htmlwriter.InnerWriter.ToString();

                if ((ConfigurationManager.AppSettings.Get("ConvertViewLinks") + string.Empty).Equals("true", StringComparison.OrdinalIgnoreCase))
                {
                    html = Regex.Replace(html, @"/view/browse_month", "", RegexOptions.Multiline);
                }

                writer.Write(html.Trim());

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Year = 1865; // not really using this except for creating a dummy date later

            Month = !string.IsNullOrEmpty(Request.QueryString["month"]) ? Convert.ToInt32(Request.QueryString["month"]) : DateTime.Now.Month;

            Day = !string.IsNullOrEmpty(Request.QueryString["day"]) ? Convert.ToInt32(Request.QueryString["day"]) : DateTime.Now.Day;

            string date = string.IsNullOrEmpty(Request.QueryString["date"]) ? null : Request.QueryString["date"];

            if (Request.Cookies.Count > 0)
            {
                cookieShowView = Request.Cookies["showView"];
            }
            else
            {
                 cookieShowView.Value = "2";
                Response.Cookies.Add(cookieShowView);
           }

            if (date != null)
            {
                string[] dateParts = date.Split(new char[] { '-' });
                Year = Convert.ToInt32(dateParts[0]);
                Month = Convert.ToInt32(dateParts[1]);
                Day = Convert.ToInt32(dateParts[2]);
                Response.Redirect("~/Calendar.aspx?date=" + Year.ToString() + "-" + Month.ToString() );
                //Response.Redirect("~/Calendar.aspx?year=" + Year.ToString() + "&month=" + Month.ToString() );
            }
            else
            {

                TransformEntries();
            }
        }
        private void TransformEntries()
        {
            StringBuilder sb = new StringBuilder();
            int rowCount = 0; // entries found by SqlReader

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // use this if displaying just a day
                SqlCommand cmdDay = new SqlCommand("SELECT [text] FROM entries WHERE DAY([date])=@theday and MONTH([date])=@themonth order by [date]");
                cmdDay.CommandType = CommandType.Text;
                cmdDay.Connection = conn;
                SqlParameter theDay = new SqlParameter();
                theDay.ParameterName = "@theday";
                cmdDay.Parameters.Add(theDay);
                SqlParameter theMonth = new SqlParameter();
                theMonth.ParameterName = "@themonth";
                cmdDay.Parameters.Add(theMonth);

                SqlDataReader xrdr;
                sb.Insert(0, "<div id='html_div'><table border=1>");

                // check for what we are going to display
                theDay.Value = Day;
                theMonth.Value = Month;
                xrdr = cmdDay.ExecuteReader();

                if (xrdr.HasRows)
                {
                    while (xrdr.Read())
                    {
                        rowCount++;
                        try
                        {

                            string rec = string.Format("{0}", xrdr[0]);

                            XslCompiledTransform oTransform = new XslCompiledTransform();

                            System.Xml.XmlDocument myDoc = new System.Xml.XmlDocument();
                            XsltArgumentList args = new XsltArgumentList();

                            myDoc.LoadXml(rec);

                            System.IO.MemoryStream txt = new System.IO.MemoryStream();
                            System.Xml.XmlTextWriter output = new System.Xml.XmlTextWriter(txt, System.Text.Encoding.UTF8);


                            oTransform.Load(Server.MapPath("dayrow.xsl"));

                            oTransform.Transform(myDoc, args, output, null);

                            output.Flush();
                            txt.Position = 0;

                            StreamReader sr = new StreamReader(txt);

                            string dumm = sr.ReadToEnd();
                            sb.Append(dumm);
                        }
                        catch
                        { }
                    }

                    this.tablemonthview.InnerHtml = sb.ToString();
                    this.dayentriesfound.InnerText = string.Format("{0} entries found", rowCount);
                    this.dayheader.InnerHtml = @"<h1>" + (new DateTime(Year, Month, Day)).ToString("MMMM dd") + "</h1>";

                }
                xrdr.Close();
                sb.Append("</table></div>");
            }
        }
    }
}