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

            string requestId = Request.QueryString["id"];
            int intId = 0 ;

            if (string.IsNullOrEmpty(requestId))
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                intId = Convert.ToInt32(requestId);
            }

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

                id.Value = intId.ToString();

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        string record = string.Format("{0}", sdr[1]);

                        XslCompiledTransform oTransform = new XslCompiledTransform();

                        System.Xml.XmlDocument myDoc = new System.Xml.XmlDocument();
                        XsltArgumentList args = new XsltArgumentList();

                        myDoc.LoadXml(record);

                        System.IO.MemoryStream txt = new System.IO.MemoryStream();
                        System.Xml.XmlTextWriter output = new System.Xml.XmlTextWriter(txt, System.Text.Encoding.UTF8);

                        oTransform.Load(Server.MapPath("dayrow.xsl"));

                        oTransform.Transform(myDoc, args, output, null);

                        output.Flush();
                        txt.Position = 0;

                        StreamReader sr = new StreamReader(txt);

                        string dumm = sr.ReadToEnd();
                        description = dumm;

                        Coordinates coords = Utilities.getLatLngFromStr(record);

                        if (coords != null)
                        {
                            location = coords.ToString();
                        }
                        else
                        {
                            location = null;
                            name = Utilities.getLocationName(record);
                        }

                        //description = record;

                    }
                }

                conn.Close();

            }

        }
    }
}