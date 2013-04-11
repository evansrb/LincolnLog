

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

    public class Utilities
    {

        public static void log(string str)
        {
            System.Diagnostics.Trace.Write(str);
        }

        public static void logLine(string str)
        {
            System.Diagnostics.Trace.WriteLine(str);
        }

        public static string getLocationName(string text)
        {

            Regex regex = new Regex("<place\\s+.*>.*</place>");
            Regex strip = new Regex("[^a-zA-Z0-9\\s*,]");

            string name;

            Match match = regex.Match(text);

            if (match.Success) {

                int start = match.Value.IndexOf(">");
                int end = match.Value.IndexOf("<", start);

                name = match.Value.Substring(start + 1, end - start - 1);
                return strip.Replace(name, "");

            }

            return null;

        }

        public static Coordinates getLatLngFromStr(string text)
        {

            Regex regex = new Regex("key='(\\-?\\d+(\\.\\d+)?),\\s*(\\-?\\d+(\\.\\d+)?)'");
            Regex strip = new Regex("[^0-9-.,]");

            string latlng;

            foreach (Match match in regex.Matches(text))
            {

                if (match.Success && (match.Value.IndexOf(",") >= 0))
                {

                    latlng = strip.Replace(match.Value, "");

                    int split = latlng.IndexOf(",");

                    string lat = latlng.Substring(0, split);
                    string lng = latlng.Substring(split + 1, latlng.Length - split - 1);

                    return new Coordinates(lat, lng);

                }

            }

            return null;

        }

    }

}