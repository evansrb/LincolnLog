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

    public partial class City : System.Web.UI.Page
    {

        public string city = "";

        public string entries = "";

        public int numRows = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            string request = Request.QueryString["city"];

            if (string.IsNullOrEmpty(request))
            {
                Response.Redirect("~/MapCity.aspx");
            }
            else
            {
                this.city = request.Trim();
            }

            SqlCommand entries = new SqlCommand("SELECT * FROM entries WHERE entries.text like @str");

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                entries.Connection = conn;
                entries.CommandType = CommandType.Text;
                entries.Parameters.Add(new SqlParameter("str", "%" + this.city + "%"));

                Utilities.logLine(entries.CommandText);

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        numRows++;

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
                        this.entries += dumm;

                        Coordinates coords = Utilities.getLatLngFromStr(record);

                    }
                }

                conn.Close();

            }

        }
    }
}