<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs"  Inherits="LincolnLog.Map"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>

        function initialize() {

            bootstrap();

            enforceZoom(G_MAP, LL_CONFIG.USER_ZOOM_MIN, LL_CONFIG.ZOOM_MAX, LL_CONFIG.ZOOM_DEFAULT);

            var markers = new Array();

            <%=markers%>

            var oms = new OverlappingMarkerSpiderfier(G_MAP, {
                markersWontMove : true,
                markersWontHide : true,
                keepSpiderfied  : true,
                circleSpiralSwitchover : 9,
                legWeight : 2
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
            });

            var bounds = new google.maps.LatLngBounds();

            for (var i = 0; i < markers.length; i++) {

                var marker = new google.maps.Marker({
                    position : markers[i].coords,
                    map : G_MAP,
                    animation : google.maps.Animation.DROP
                });

                var desc = "";
                if (markers[i].loc != "") {
                    desc += "<h3>" + markers[i].loc + "</h3>";
                }
                desc += "<p>" + markers[i].desc + "</p>";

                desc += '<a href="Detail.aspx?id=' + markers[i].id + '">View Details</a>'

                marker.desc = desc;
                oms.addMarker(marker);

            }

            G_MAP.setCenter(getCenterPointFromMarkers(markers));

        }

        google.maps.event.addDomListener(window, "load", initialize);

        $(window).resize(function () {
            sizeMap();
        });

        $(window).load(function () {
            sizeMap();
        });

    </script>
    <h1><%=DateTime.Today.ToString("MMMM d")%></h1>
    <div id="map-canvas"></div>
    <div id ="test" runat="server">
        </div>

</asp:Content>
