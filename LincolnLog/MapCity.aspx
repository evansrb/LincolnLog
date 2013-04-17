<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="MapCity.aspx.cs"  Inherits="LincolnLog.MapCity"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>

        var center;

        var iw;

        function initialize() {

            bootstrap();

            enforceZoom(G_MAP, LL_CONFIG.USER_ZOOM_MIN, LL_CONFIG.ZOOM_MAX, LL_CONFIG.ZOOM_DEFAULT);

            var markers = new Array();

            <%=markers%>

            var oms = new OverlappingMarkerSpiderfier(G_MAP, {
                markersWontMove: true,
                markersWontHide: true,
                keepSpiderfied: true,
                circleSpiralSwitchover: 9,
                legWeight: 2,
                nearbyDistance : 50
            });

            var iw = new google.maps.InfoWindow();
            oms.addListener("click", function (marker) {
                iw.setContent(marker.desc);
                iw.open(G_MAP, marker);
            });

            oms.addListener("spiderfy", function (markers) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png');
                }
                iw.close();
            });

            oms.addListener("unspiderfy", function (markers) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
                }
                iw.close();
            });

            var bounds = new google.maps.LatLngBounds();

            for (var i = 0; i < markers.length; i++) {

                var marker = new google.maps.Marker({
                    position: markers[i].coords,
                    map: G_MAP,
                    animation: google.maps.Animation.DROP
                });
                marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');

                var desc = "";

                desc += '<h2>' + markers[i].loc + '</h2>';
                desc += '<a href="City.aspx?city=' + markers[i].loc + '">View entries</a>';

                marker.desc = desc;
                oms.addMarker(marker);

            }

            center = getCenterPointFromMarkers(markers);

            G_MAP.setCenter(center);

        }

        google.maps.event.addDomListener(window, "load", initialize);

        $(document).ready(function () {
            $("a#center-map").click(function (e) {
                e.preventDefault();
                centerMapAtPoint(center);
            });
        });

        $(window).resize(function () {
            //sizeMap();
        });

        $(window).load(function () {
            //sizeMap();
        });

    </script>
    <h1>Browse By City</h1>
    <div id="map-canvas"></div>
    <div id ="test" runat="server">
        </div>

</asp:Content>
