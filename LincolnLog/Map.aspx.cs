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

    public partial class Map : System.Web.UI.Page
    {

        public string header;

        public string prev;

        public string next;

        public int numPins = 0;

        public string markers = "";

        protected string[] getPrev(string curDay, string curMonth)
        {

            string[] prev = new string[2];

            int day = Convert.ToInt32(curDay);
            int month = Convert.ToInt32(curMonth);

            DateTime curDate = new DateTime(1800, month, day, 0, 0, 0);
            DateTime newDate = curDate.AddDays(-1);

            prev[0] = newDate.Day.ToString();
            prev[1] = newDate.Month.ToString();

            return prev;

        }

        protected string[] getNext(string curDay, string curMonth)
        {

            string[] next = new string[2];

            int day = Convert.ToInt32(curDay);
            int month = Convert.ToInt32(curMonth);

            DateTime curDate = new DateTime(1800, month, day, 0, 0, 0);
            DateTime newDate = curDate.AddDays(+1);

            next[0] = newDate.Day.ToString();
            next[1] = newDate.Month.ToString();

            return next;

        }

        protected bool validDate(string curDay, string curMonth)
        {

            int day = Convert.ToInt32(curDay);
            int month = Convert.ToInt32(curMonth);

            if (month < 1 || month > 12)
            {
                return false;
            }

            if (day < 1 || day > Utilities.getDaysInMonth(month)) {
                return false;
            }

            return true;

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            string day;
            string month;

            if (string.IsNullOrEmpty(Request.QueryString["day"]) || string.IsNullOrEmpty(Request.QueryString["month"]))
            {
                day = DateTime.Now.Day.ToString();
                month = DateTime.Now.Month.ToString();
                Utilities.logLine("calculated");
            }
            else
            {
                day = Request.QueryString["day"];
                month = Request.QueryString["month"];
                Utilities.logLine("queried");
            }

            if (validDate(day, month) == false)
            {
                Response.Redirect("~/Map.aspx");
            }
            else
            {
                Session["previous"] = HttpContext.Current.Request.Url.AbsoluteUri;
            }

            StringBuilder sb = new StringBuilder();

            Regex regex = new Regex("key=([\'\"])?((?(1).+?|[^\\s>]+))(?(1)\\1)");

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand entries = new SqlCommand("SELECT [id] , [text] , [date] FROM entries  WHERE DAY([date])=@day and MONTH([date])=@month");
                entries.CommandType = CommandType.Text;
                entries.Connection = conn;

                SqlParameter theDay = new SqlParameter();
                theDay.ParameterName = "@day";
                entries.Parameters.Add(theDay);

                SqlParameter theMonth = new SqlParameter();
                theMonth.ParameterName = "@month";
                entries.Parameters.Add(theMonth);

                theDay.Value = day;
                theMonth.Value = month;

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        string id = string.Format("{0}", sdr[0]);
                        string txt = string.Format("{0}", sdr[1]);
                        string date = string.Format("{0}", sdr[2]);

                        string desc = Utilities.getDescription(txt, 256);

                        Coordinates temp;

                        if ((temp = Utilities.getLatLngFromStr(txt)) != null)
                        {

                            sb.AppendLine("markers[" + numPins + "] = {" +
                                "id : " + id + ", " +
                                "desc : '" + desc + "', " +
                                "date : '" + DateTime.Parse(date).ToString("MMMM dd, yyyy") + "', " +
                                "lat : " + temp.getLatitude() + ", " +
                                "lng : " + temp.getLongitude() + ", " +
                                "coords : new google.maps.LatLng(" + temp.getLatitude() + ", " + temp.getLongitude() + "), " +
                                "loc : \"" + Utilities.getLocationName(txt) + "\"" +
                            "};");

                            numPins++;

                        }

                    }
                }

                conn.Close();

            }

            string[] _prev = getPrev(day, month);
            prev = string.Format("?day={0}&month={1}", _prev[0], _prev[1]);
            string[] _next = getNext(day, month);
            next = string.Format("?day={0}&month={1}", _next[0], _next[1]);

            header = string.Format("{0} {1}", Utilities.getMonthName(month), day);

            markers = sb.ToString();

        }
    }
}