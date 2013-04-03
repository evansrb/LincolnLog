using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Diagnostics;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Configuration;

namespace LincolnLog
{
    public partial class Calendar : System.Web.UI.Page
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
            try
            {
                Year = string.IsNullOrEmpty(Request.QueryString["year"]) ? 0 : Convert.ToInt32(Request.QueryString["year"]);

                Month = string.IsNullOrEmpty(Request.QueryString["month"]) ? 0 : Convert.ToInt32(Request.QueryString["month"]);

                Day = string.IsNullOrEmpty(Request.QueryString["day"]) ? 0 : Convert.ToInt32(Request.QueryString["day"]);

                string date = string.IsNullOrEmpty(Request.QueryString["date"]) ? null : Request.QueryString["date"];

                if (date != null)
                {
                    string[] dateParts = date.Split(new char[] {'-'});
                    Year = Convert.ToInt32(dateParts[0]);
                    Month = Convert.ToInt32(dateParts[1]);
                    Day = 0;// Convert.ToInt32(dateParts[2]);
                    //Response.Redirect("~/Calendar.aspx?year=" + Year.ToString() + "&Month=" + Month.ToString());
                }

                if ((Year >= 1809 && Year <= 1865))
                {
                    BuildCalendarTable(Year);
                    theyeardiv.Visible = true;
                     if (Request.Cookies.Count > 0)
                    {
                        Global.cookieShowView = Request.Cookies["showView"];
                        string cook = Global.cookieShowView.Value;
                        if (date != null || (cook == "1" || cook == "2") && Year != 0 && Month != 0)
                        {
                            TransformEntries();
                        }
                    }
               }
                else
                {
                    yearslist.Visible = true;
                    theyeardiv.Visible = false;
                }

                //int cook = Convert.ToInt32(Session["calView"]);
                // string cook = this.calView.Value;
                //if ((cook == "1" || cook == "2") && Year != 0 && Month != 0)
                //{
                //    TransformEntries();
                //}
            }
            catch (FormatException exc)
            {
                theyeartable.Visible = false;
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid date was encountered.')</SCRIPT>");
            }
        }

        protected void BuildCalendarTable(int year)
        {
            CultureInfo curCulture = new CultureInfo("en-US");

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(date) AS NumEntries FROM entries WHERE (date BETWEEN @dateFrom AND @dateTo)");
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                SqlParameter dateTo = new SqlParameter();
                dateTo.ParameterName = "@dateTo";
                SqlParameter dateFrom = new SqlParameter();
                dateFrom.ParameterName = "@dateFrom";
                cmd.Parameters.Add(dateFrom);
                cmd.Parameters.Add(dateTo);

                SqlCommand cmdd = new SqlCommand("SELECT COUNT(date) AS NumEntries FROM entries WHERE date = @theday");
                cmdd.CommandType = CommandType.Text;
                cmdd.Connection = conn;
                SqlParameter theDay = new SqlParameter();
                theDay.ParameterName = "@theday";
                cmdd.Parameters.Add(theDay);


                // Create the DataRows (every month)
                for (int mon = 1; mon <= 12; mon++)
                {
                    // Set month name hyperlink
                    DateTime theYearMonth = new DateTime(year, mon, 1);
                    string monthName = GetMonthName(theYearMonth);
                    //        
                    HtmlTable htbl = (HtmlTable)this.Master.FindControl("ContentPlaceHolder1").FindControl((string.Format("tbl{0:D02}", mon)));

                    // Next check here if year/month have any entries
                    // If there are entries, use hyprelink, else not
                    dateTo.Value = new DateTime(year, mon, 1, 0, 0, 0).AddMonths(1).AddMinutes(-1);
                    dateFrom.Value = new DateTime(year, mon, 1, 0, 0, 0);

                    int numEntries = (int)(cmd.ExecuteScalar());

                    if (numEntries == 0) //TBD fix the condition
                    {
                        // no hyperlink
                        htbl.Rows[0].Cells[0].InnerHtml = monthName;
                    }
                    else
                    {
                        htbl.Rows[0].Cells[0].InnerHtml = "<a href='?year=" + year + "&amp;month=" + mon + "'>" + monthName + "</a>";
                        htbl.Rows[0].Cells[0].ID = string.Format("d{0}{1:D02}", year, mon);
                        htbl.Rows[0].Cells[0].Attributes.Add("onclick", "$(this).myMonthFunction();");

                    }

                    int dow = (int)FirstDayOfMonthFromYearMonth(year, mon);
                    int daysInMonth = curCulture.Calendar.GetDaysInMonth(year, mon);
                    int daay = 0;

                    for (int wk = 1; wk < 7; wk++)
                    {
                        for (int da = 0; da < 7; da++)
                        {
                            HtmlTable ht = (HtmlTable)this.Master.FindControl("ContentPlaceHolder1").FindControl(string.Format("t{0:D02}", mon));

                            if (((wk - 1) * 7 + da + 1 <= daysInMonth + dow) && ((wk - 1) * 7 + da >= dow))
                            {
                                // Need to check for an entry for each of the days
                                daay = ((wk - 1) * 7 + da + 1 - dow);
                                theDay.Value = new DateTime(year, mon, daay);
                                numEntries = (int)(cmdd.ExecuteScalar());
                                if (numEntries > 0) //TBD fix the condition
                                {
                                    ht.Rows[wk].Cells[da].ID = string.Format("d{0}{1:D02}{2:D02}", year, mon, daay);
                                    ht.Rows[wk].Cells[da].Attributes.Add("onclick", "$(this).myDayFunction();");
                                    //ht.Rows[wk].Cells[da].Attributes.Add("runat", "server");
                                    ht.Rows[wk].Cells[da].InnerHtml = "<a href='?year=" + year + "&amp;month=" + mon + "&amp;day=" + ((wk - 1) * 7 + da + 1 - dow).ToString() + "'>" + ((wk - 1) * 7 + da + 1 - dow).ToString() + "</a>";

                                }
                                else
                                {
                                    ht.Rows[wk].Cells[da].InnerHtml = ((wk - 1) * 7 + da + 1 - dow).ToString();
                                }
                            }
                            else
                            {
                                ht.Rows[wk].Cells[da].InnerHtml = "&nbsp;&nbsp;";
                            }
                        }
                    }
                }
            }// end of conn using
            return;
        }

        private void TransformEntries()
        {
            StringBuilder sb = new StringBuilder();
            int rowCount = 0; // entries found by SqlReader

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // use this if displaying a month
                SqlCommand cmdMonth = new SqlCommand("SELECT [text] FROM entries WHERE (date BETWEEN @dateFrom AND @dateTo) order by [date]");
                cmdMonth.CommandType = CommandType.Text;
                cmdMonth.Connection = conn;
                SqlParameter dateTo = new SqlParameter();
                dateTo.ParameterName = "@dateTo";
                SqlParameter dateFrom = new SqlParameter();
                dateFrom.ParameterName = "@dateFrom";
                cmdMonth.Parameters.Add(dateFrom);
                cmdMonth.Parameters.Add(dateTo);

                // use this if displaying just a day
                SqlCommand cmdDay = new SqlCommand("SELECT [text] FROM entries WHERE date = @theday");
                cmdDay.CommandType = CommandType.Text;
                cmdDay.Connection = conn;
                SqlParameter theDay = new SqlParameter();
                theDay.ParameterName = "@theday";
                cmdDay.Parameters.Add(theDay);

                SqlDataReader xrdr;
                sb.Insert(0, "<div id='html_div'><table border='1'>");

                // check for what we are going to display
                if (Day == 0)
                {
                    //if (Month == 0) Month = 1;
                    dateTo.Value = new DateTime(Year, Month, 1, 0, 0, 0).AddMonths(1).AddMinutes(-1);
                    dateFrom.Value = new DateTime(Year, Month, 1, 0, 0, 0);
                    xrdr = cmdMonth.ExecuteReader();
                }
                else
                {
                    try
                    {
                        theDay.Value = new DateTime(Year, Month, Day);
                    }
                    catch (ArgumentOutOfRangeException exc)
                    {
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid search parameters were encountered.')</SCRIPT>");
                        Response.Redirect("~/Home.aspx");
                        return;
                    }
                        xrdr = cmdDay.ExecuteReader();
                }

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
                    if (Day == 0)
                    {
                        this.tablemonthview.InnerHtml = sb.ToString();
                        this.monthentriesfound.InnerText = string.Format("{0} entries found", rowCount);


                        // loop through months to find the match
                        string spanControl;
                        for(int mon = 1; mon <= 12; mon++)
                        {
                            spanControl = string.Format("Month{0:D02}", mon);
                            HtmlGenericControl span = (HtmlGenericControl)this.Master.FindControl("ContentPlaceHolder1").FindControl(spanControl);

                            // set all month links to the current year
                            span.InnerHtml = span.InnerHtml.Replace("1800", Year.ToString());
                            if (mon == Month)
                            {
                                span.Attributes["class"] = "match";
                            }
                            else
                            {
                                span.Attributes["class"] = "nomatch";
                            }
                        }
                        if (Month == 0)
                        {
                            Global.cookieShowView.Value = "0";
                            Response.Cookies.Add(Global.cookieShowView);
                            //Session["calView"] = 0; // 0=year, 1=month, 2=day
                        }
                        else
                        {
                            Global.cookieShowView.Value = "1";
                            Response.Cookies.Add(Global.cookieShowView);
                            //Session["calView"] = 1; // 0=year, 1=month, 2=day
                        }
           
                    }
                    else
                    {
                        this.tabledayview.InnerHtml = sb.ToString();
                        this.dayentriesfound.InnerText = string.Format("{0} entries found", rowCount);
                        this.dayheader.InnerHtml = @"<span class='crumb' runat='server' onclick='$(this).myYearFunction();'><a href='?year=" + Year + "'>" + Year.ToString() + @"</a>&nbsp; &gt;&gt;&nbsp; </span><span  class='crumb' runat='server' onclick='$(this).myMonthFunction();'><a href='?year=" + Year + "&month=" + Month + "'>" + GetMonthName(new DateTime(Year, Month, 1)) + @"</a></span>";
                        this.dayheader.InnerHtml += @"<h1>" + (new DateTime(Year, Month, Day)).ToString("MMMM dd, yyyy") + "</h1>";

                        Global.cookieShowView.Value = "2";
                        Response.Cookies.Add(Global.cookieShowView);
                        //Session["calView"] = 2; // 0=year, 1=month, 2=day
                    }

                }
                xrdr.Close();
                sb.Append("</table></div>");
            }
        }

        public DayOfWeek FirstDayOfMonthFromYearMonth(int year, int month)
        {
            return new DateTime(year, month, 1).DayOfWeek;
        }
        public static string GetMonthName(DateTime givenDate)
        {
            var formatInfoinfo = new DateTimeFormatInfo();
            string[] monthName = formatInfoinfo.MonthNames;
            return monthName[givenDate.Month - 1];
        }
    }
}