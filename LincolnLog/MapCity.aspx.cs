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

    public partial class MapCity : System.Web.UI.Page
    {

        public int numPins = 0;

        public string markers = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            StringBuilder sb = new StringBuilder();

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand entries = new SqlCommand("SELECT [place] , [lat] , [long] FROM places WHERE lat IS NOT NULL");
                entries.CommandType = CommandType.Text;
                entries.Connection = conn;

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        string place = string.Format("{0}", sdr[0]);
                        string _lat = string.Format("{0}", sdr[1]);
                        string _long = string.Format("{0}", sdr[2]);

                        sb.AppendLine("markers[" + numPins + "] = {" +
                            "loc : \"" + place + "\"," +
                            "coords : new google.maps.LatLng(" + _lat + ", " + _long + ")" +
                        "};");

                        numPins++;

                    }
                }

                conn.Close();

            }

            markers = sb.ToString();

        }
    }
}