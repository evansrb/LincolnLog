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

        public int numPins = 0;

        public string markers = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            string day = DateTime.Now.Day.ToString();
            string month = DateTime.Now.Month.ToString();
            string year = DateTime.Now.Year.ToString();

            StringBuilder sb = new StringBuilder();

            Regex regex = new Regex("key=([\'\"])?((?(1).+?|[^\\s>]+))(?(1)\\1)");

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand entries = new SqlCommand("SELECT * FROM entries  WHERE DAY([date])=@day and MONTH([date])=@month and MONTH([date])=@month");
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
                        string desc = Utilities.getDescription(txt, 256);
                        Match match = regex.Match(txt);

                        Coordinates temp;

                        if ((temp = Utilities.getLatLngFromStr(txt)) != null)
                        {

                            sb.AppendLine("markers[" + numPins + "] = {" +
                                "id : " + id + ", " +
                                "desc : '" + desc + "', " +
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

            markers = sb.ToString();

        }
    }
}