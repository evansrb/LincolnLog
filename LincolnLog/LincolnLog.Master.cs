using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;


namespace LincolnLog
{
    public partial class LincolnLog : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Overrides the Render method
        protected override void Render(HtmlTextWriter writer)
        {
            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(new System.IO.StringWriter()))
            {
                base.Render(htmlwriter);
                string html = htmlwriter.InnerWriter.ToString();

                if ((ConfigurationManager.AppSettings.Get("RemoveWhitespace") + string.Empty).Equals("true", StringComparison.OrdinalIgnoreCase))
                {
                    //html = Regex.Replace(html, @"(?<=[^])\t{2,}|(?<=[>])\s{2,}(?=[<])|(?<=[>])\s{2,11}(?=[<])|(?=[\n])\s{2,}", string.Empty);
                    //html = Regex.Replace(html, @"[ \f\r\t\v]?([\n\xFE\xFF/{}[\];,<>*%&|^!~?:=])[\f\r\t\v]?", "$1");
                    html = Regex.Replace(html, @"^\s+<", " <", RegexOptions.Multiline);
 
                    html = Regex.Replace(html, @">\s+<", "> <", RegexOptions.Multiline);
                    html = html.Replace(";\n", ";");
                }

                writer.Write(html.Trim());
            }
        }
    }
}