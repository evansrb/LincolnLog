using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace LincolnLog
{
    public class Coordinates
    {

        public static int LATITUDE_MIN = -90;
        public static int LATITUDE_MAX = 90;
        public static int LONGITUDE_MIN = -180;
        public static int LONGITUDE_MAX = 180;

        private double latitude = 0;
        private double longitude = 0;

        public Coordinates(double latitude, double longitude)
        {
            this.latitude = latitude;
            this.longitude = longitude;
        }

        public Coordinates(string latitude, string longitude)
        {
            this.latitude = Convert.ToDouble(latitude);
            this.longitude = Convert.ToDouble(longitude);
        }

        public static bool isValid(string coords)
        {

            if (Regex.IsMatch(coords.Trim(), "^(\\-?\\d+(\\.\\d+)?)\\s*,\\s*(\\-?\\d+(\\.\\d+)?)$"))
            {
                return true;
            }

            return false;

        }

        public double getLatitude()
        {
            return this.latitude;
        }

        public double getLongitude()
        {
            return this.longitude;
        }

        override public string ToString()
        {
            return this.latitude + "," + this.longitude;
        }

    }
}