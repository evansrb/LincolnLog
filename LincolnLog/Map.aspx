<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs"  Inherits="LincolnLog.Map"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      #map-canvas {
        margin-left: 125px;
        height: 600px;
      }
    </style>	
    <script>

        var map;

        var ZOOM_MIN = 0;
        var ZOOM_MAZ = 21;
        var DEFAULT_ZOOM = 6;

        function initialize() {

            var markers = new Array();

            <%=markers%>

            var options = {
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(39.9500, -82.9833),
                zoom: DEFAULT_ZOOM
            };

            var map = new google.maps.Map(document.getElementById("map-canvas"), options);

            google.maps.event.addListener(map, 'zoom_changed', function () {

                var currentZoom = map.getZoom();

                if (currentZoom > DEFAULT_ZOOM + 2 || currentZoom < DEFAULT_ZOOM - 2) {
                    map.setZoom(DEFAULT_ZOOM);
                }

            });

            var oms = new OverlappingMarkerSpiderfier(map, {
                markersWontMove: true,
                markersWontHide: true,
                circleSpiralSwitchover: Infinity,
                legWeight: 2
            });

            var iw = new google.maps.InfoWindow();
            oms.addListener("click", function (marker) {
                iw.setContent(marker.desc);
                iw.open(map, marker);
            });

            oms.addListener("spiderfy", function (markers) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setShadow(null);
                    markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png');
                }
                iw.close();
            });

            oms.addListener("unspiderfy", function (markers) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setShadow(
                        new google.maps.MarkerImage(
                            'https://www.google.com/intl/en_ALL/mapfiles/shadow50.png',
                            new google.maps.Size(37, 34),
                            new google.maps.Point(0, 0),
                            new google.maps.Point(10, 34)
                        )
                    );
                    markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
                }
            });

            for (var i = 0; i < markers.length; i++) {

                var latlng = new google.maps.LatLng(markers[i].lat, markers[i].long);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    animation: google.maps.Animation.DROP
                });

                var desc = "";
                if (markers[i].loc != "") {
                    desc += "<h3>" + markers[i].loc + "</h3>";
                }

                desc += '<a href="Detail.aspx?id=' + markers[i].id + '">View Details</a>'

                marker.desc = desc;
                oms.addMarker(marker);

            }

        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    <div id="map-canvas"></div>
    <div id ="test" runat="server">
        </div>

</asp:Content>
