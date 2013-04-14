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
using System.Collections;

namespace LincolnLog
{

    public partial class Test : System.Web.UI.Page
    {

        private ArrayList failedIds;

        public string title;

        public Test()
        {

            failedIds = new ArrayList();

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            int valid = 0;

            string connStr = ConfigurationManager.ConnectionStrings["lincolnlog_productionConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                conn.Open();

                SqlCommand entries = new SqlCommand("SELECT [id] , [text] FROM entries");
                entries.CommandType = CommandType.Text;
                entries.Connection = conn;

                SqlDataReader sdr = entries.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {

                        string id = string.Format("{0}", sdr[0]);
                        string text = string.Format("{0}", sdr[1]);

                        if (Utilities.getLatLngFromStr(text) != null)
                        {
                            valid++;
                        }
                        else
                        {
                            failedIds.Add(id);
                        }

                    }
                }

                conn.Close();

            }

            this.title = "Test" + valid;
            this.title += failedIds.ToString();

        }
    }
}