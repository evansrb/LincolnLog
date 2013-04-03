<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs"  Inherits="LincolnLog.Detail"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      #map-canvas {
        margin-left: 125px;
        height: 600px;
      }
    </style>
    <script>

        var map;

        function initialize() {

            var mapOptions = {
                zoom: 8,
                center: new google.maps.LatLng(<%=center%>),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var pin = new google.maps.Marker({
                position: new google.maps.LatLng(<%=center%>),
                map: map,
                animation: google.maps.Animation.DROP
            });

        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
	 <%=description%>
    <div id="map-canvas"></div>
    <div id ="test" runat="server">
        </div>

</asp:Content>
