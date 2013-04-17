

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

        public static string urlDecode(string text) {

            text = text.Replace("+", " ");
            return System.Uri.UnescapeDataString(text);

        }

        public static string urlEncode(string text)
        {

            return System.Uri.EscapeDataString(text);

        }

        public static string getMonthName(string monthName)
        {

            int month = Convert.ToInt32(monthName);
            month--;

            if (month < 0 || month > 11)
            {
                return null;
            }

            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

            return months[month];
        }

        public static int getDaysInMonth(int month)
        {

            int[] daysInMonth = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

            month--;

            if (month < 0 || month > 11)
            {
                return -1;
            }

            return daysInMonth[month];

        }

        public static string getDescription(string text, int length)
        {

            Regex strip = new Regex("<(.+?)>");

            int start = text.IndexOf("<p");
            int end = text.LastIndexOf("</p");

            text = text.Substring(start, end - start - 1);

            text = Regex.Replace(text, @"<[^>]*>", String.Empty);
            text = text.Replace("'", @"\'");
            text = text.Replace("\n", String.Empty);
            text = text.Trim();

            if (length > text.Length)
            {
                length = text.Length - 1;
            }

            return text.Substring(0, length) + "...";

        }

        public static string getLocationName(string text)
        {

            text = text.Replace("\n", " ");

            Regex regex = new Regex("<place\\s+.*>.*</place>");
            Regex strip = new Regex("[^a-zA-Z0-9\\s*,]");

            string name;

            Match match = regex.Match(text);

            logLine(text);

            if (match.Success) {

                int start = match.Value.IndexOf(">");
                int end = match.Value.IndexOf("<", start);

                name = match.Value.Substring(start + 1, end - start - 1);
                return strip.Replace(name, String.Empty);

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

                    latlng = strip.Replace(match.Value, String.Empty);

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