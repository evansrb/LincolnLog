<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs"  Inherits="LincolnLog.Detail"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #map-canvas {
            min-height: 400px !important;
        }
    </style>
    <script>

        var pin;
        var center;

        function initialize() {

            bootstrap();

            enforceZoom(G_MAP, LL_CONFIG.USER_ZOOM_MIN, LL_CONFIG.ZOOM_MAX, LL_CONFIG.ZOOM_DEFAULT);

            pin = new google.maps.Marker({
                <% if (location != null) { %>
                position: new google.maps.LatLng(<%=location%>),
                <% } %>
                map: G_MAP,
                animation: google.maps.Animation.DROP
            });
            
            <% if (location != null) { %>
                G_MAP.setCenter(new google.maps.LatLng(<%=location%>));
                center = G_MAP.getCenter();
            <% } else { %>
                center = getLatLngFromName("<%=name%>", update, G_MAP, pin);
            <% } %>

        }

        google.maps.event.addDomListener(window, "load", initialize);

        $(document).ready(function () {
            $("a#center-map").click(function (e) {
                e.preventDefault();
                centerMapAtPoint(center);
            });
        });

    </script>
    
	<table id="detail-desc" border="1"><%=description%></table>
    <ul id="map-nav">
    <li><a href="<%=Session["previous"]%>">Go Back</a></li>
    <li><a id="center-map" href="#">Center Map at Point</a></li>
    </ul>
    <%=map%>
    <div id ="test" runat="server">
        </div>

</asp:Content>
