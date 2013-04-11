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

    public partial class Detail : System.Web.UI.Page
    {

        public string map = "<div id=\"map-canvas\"></div>";

        public string location = "";

        public string name = "";

        public string description = "";

        protected void Page_Load(object sender, EventArgs e)
        {


            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand entries = new SqlCommand("SELECT * FROM entries  WHERE id=@id");
                entries.CommandType = CommandType.Text;
                entries.Connection = conn;

                SqlParameter id = new SqlParameter();
                id.ParameterName = "@id";
                entries.Parameters.Add(id);

                id.Value = Request.QueryString["id"];

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        string record = string.Format("{0}", sdr[1]);

                        Coordinates coords = Utilities.getLatLongFromStr(record);

                        if (coords != null)
                        {
                            location = coords.ToString();
                        }
                        else
                        {
                            location = null;
                            name = Utilities.getLocationName(record);
                        }

                        description = record;

                    }
                }

                conn.Close();

            }

        }
    }
}