<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs"  Inherits="LincolnLog.Detail"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      #map-canvas {
        margin-left: 125px;
        height: 600px;
      }
    </style>
    <script>
        var pin;

        function initialize() {

            bootstrap();

            var center;

            pin = new google.maps.Marker({
                <% if (location != null)
                   { %>
                position: new google.maps.LatLng(<%=location%>),
                <% } %>
                map: G_MAP,
                animation: google.maps.Animation.DROP
            });
            
            <% if (location != null) { %>
                G_MAP.setCenter(new google.maps.LatLng(<%=location%>));
            <% } else { %>
                getLatLngFromName("<%=name%>", update, G_MAP, pin);
            <% } %>

        }

        function update(map, pin, loc) {

            map.setCenter(loc);
            pin.setPosition(loc);

        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
	 <%=description%>
    <%=map%>
    <div id ="test" runat="server">
        </div>

</asp:Content>
