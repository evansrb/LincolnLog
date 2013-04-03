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
using LincolnLog1;

namespace LincolnLog
{
    public partial class Search : System.Web.UI.Page
    {
        protected override void Render(HtmlTextWriter writer)
        {
            StringWriter stringWriter = new StringWriter();
            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter))
            {
                base.Render(htmlwriter);
                string html = stringWriter.ToString();
                
                if ((ConfigurationManager.AppSettings.Get("ConvertViewLinks") + string.Empty).Equals("true", StringComparison.OrdinalIgnoreCase))
                {
                    html = Regex.Replace(html, @"/view/browse_month", "", RegexOptions.Singleline);
                    string repl =  (string)Session["searchtext"];
                    // doing all of this to yellow and bold highlight the search text that was found
                    if (!string.IsNullOrEmpty(repl))
                    {
                       Regex rx = new Regex(repl, RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.Compiled);
                        MatchCollection matches = rx.Matches(html);
                        if (matches.Count > 0)
                        {
                            int[] indexes = new int[matches.Count];
                            for(int i = 0; i < matches.Count; i++)
                            {
                                indexes[i] = matches[i].Index;
                            }
                            int counter = 0;
                            Match match = rx.Match(html, matches[0].Index + matches[0].Length);
                            indexes[0] = matches[0].Index + matches[0].Length;
                            while (match.Success)
                            {
                                html = rx.Replace(html, @"<span class=""match"">" + match.Value + "</span>", 1, indexes[counter++] + counter * 27);
                                //startIndex = match.Index + match.Length;
                                match = match.NextMatch();
                            }
                        }
                    }
                }

                writer.Write(html.Trim());

            }
        }
        protected override void OnPreLoad(EventArgs e)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
            }
        }

        private int DaysInMonth(int year, int month)
        {
            return DateTime.DaysInMonth(year, month);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelInvalid.Visible = false;

            string date = null;

            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                TextBox text = PreviousPage.pp_txtSearch;
                if (text != null)
                {
                    this.search_text.Value = text.Text;
                    this.search_start_3i.Text = PreviousPage.pp_DayFrom.Text;
                    this.search_start_2i.Text = PreviousPage.pp_MonthFrom.Text;
                    this.search_start_1i.Text = PreviousPage.pp_YearFrom.Text;
                    this.search_end_3i.Text = PreviousPage.pp_DayTo.Text;
                    this.search_end_2i.Text = PreviousPage.pp_MonthTo.Text;
                    this.search_end_1i.Text = PreviousPage.pp_YearTo.Text;
                    search_place.Text = PreviousPage.pp_SearchPlace.Text;
                    TransformEntries();
                }
            }
            if (Page.IsPostBack || date != null)
            {
                try
                {
                    TransformEntries();
                }
                catch (Exception exc)
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid search parameters were encountered.')</SCRIPT>");
                }
            }
            else
            {
                date = string.IsNullOrEmpty(Request.QueryString["date"]) ? null : Request.QueryString["date"];
                if (date != null)
                {
                    string[] dateParts = date.Split('-');
                    this.search_start_1i.Text = dateParts[0]; //year
                    this.search_start_2i.Text = dateParts[1]; //month
                    this.search_start_3i.Text = "01"; //day
                    this.search_end_1i.Text = dateParts[0]; //year
                    this.search_end_2i.Text = dateParts[1]; //month
                    this.search_end_3i.Text = DaysInMonth(Convert.ToInt32(dateParts[0]), Convert.ToInt32(dateParts[1])).ToString(); //day
                    try
                    {
                        TransformEntries();
                    }
                    catch (Exception exc)
                    {
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid search parameters were encountered.')</SCRIPT>");
                    }
                }
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
                //SqlCommand cmdDay = new SqlCommand("SELECT [text] FROM entries WHERE DAY([date])=@theday and MONTH([date])=@themonth");
                SqlCommand cmdDay = new SqlCommand();
                cmdDay.CommandType = CommandType.StoredProcedure;
                cmdDay.CommandText = "AdvancedSearch";
                cmdDay.Connection = conn;
                SqlParameter searchtext = new SqlParameter();
                searchtext.ParameterName = "@searchtext";
                cmdDay.Parameters.Add(searchtext);
                SqlParameter place = new SqlParameter();
                place.ParameterName = "@place";
                cmdDay.Parameters.Add(place);
                SqlParameter datefrom = new SqlParameter();
                datefrom.ParameterName = "@datefrom";
                datefrom.SqlDbType = SqlDbType.DateTime;
                cmdDay.Parameters.Add(datefrom);
                SqlParameter dateto = new SqlParameter();
                dateto.ParameterName = "@dateto";
                dateto.SqlDbType = SqlDbType.DateTime;
                cmdDay.Parameters.Add(dateto);

                SqlDataReader xrdr = null;
                sb.Insert(0, "<div id='html_div'><table border='1'>");

                try
                {
                    // check for what we are going to display
                    searchtext.Value = this.search_text.Value;

                    Session["searchtext"] = this.search_text.Value;
                    place.Value = this.search_place.Text;
                    datefrom.Value = this.search_start_1i.Text + "-" + this.search_start_2i.Text + "-" + this.search_start_3i.Text;
                    //if ((datefrom.Value).ToString().Contains("--") && (datefrom.Value).ToString().IndexOf("--") != 0)
                    if ((datefrom.Value).ToString() == "--")
                    {
                        datefrom.Value = null;
                    }
                    dateto.Value = this.search_end_1i.Text + "-" + this.search_end_2i.Text + "-" + this.search_end_3i.Text;
                    if ((dateto.Value).ToString() == "--")
                    {
                        dateto.Value = null;
                    }
                    xrdr = cmdDay.ExecuteReader();
                }
                catch (Exception exc)
                {
                    LabelInvalid.Visible = true;
                }

                if (xrdr != null && xrdr.HasRows)
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
                    //this.dayheader.InnerHtml = @"<h1>" + (new DateTime(Year, Month, Day)).ToString("MMMM dd") + "</h1>";

                }
                if(xrdr != null)
                    xrdr.Close();
                sb.Append("</table></div>");
            }
        }
    }
}