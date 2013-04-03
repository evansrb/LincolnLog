using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace LincolnLog
{
    public class Utilities
    {

        public static string getLocationName(string text)
        {

            Regex regex = new Regex("<place\\s+.*>.*</place>");
            Match match = regex.Match(text);

            if (match.Success) {
                int start = match.Value.IndexOf(">");
                int end = match.Value.IndexOf("<", start);
                return match.Value.Substring(start + 1, end - start - 1);
            }

            return null;

        }

        public static Coordinates getLatLongFromStr(string text)
        {

            Regex regex = new Regex("key='(\\-?\\d+(\\.\\d+)?),\\s*(\\-?\\d+(\\.\\d+)?)'");
            Match match = regex.Match(text);

            if (match.Success && match.Value.IndexOf(",") >= 0)
            {

                int start = match.Value.IndexOf("'");
                int mid = match.Value.IndexOf(",");
                int end = match.Value.LastIndexOf("'");

                string latitude = match.Value.Substring(start + 1, mid - start - 1);
                string longitude = match.Value.Substring(mid + 2, end - mid - 2);

                return new Coordinates(latitude, longitude);

            }

            return null;

        }

    }
}