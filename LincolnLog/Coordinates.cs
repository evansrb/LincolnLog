using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LincolnLog
{
    public class Coordinates
    {

        private string latitude;
        private string longitude;

        public Coordinates(string latitude, string longitude)
        {
            this.latitude = latitude;
            this.longitude = longitude;
        }

        public string getLatitude()
        {
            return this.latitude;
        }

        public string getLongitude()
        {
            return this.longitude;
        }

        override public string ToString()
        {
            return this.latitude + "," + this.longitude;
        }

    }
}