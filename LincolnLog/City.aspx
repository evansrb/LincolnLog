<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="City.aspx.cs"  Inherits="LincolnLog.City"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
	
    <p>Showing results for: <strong><%=city%></strong> (<%=numRows%>)</p>

    <% if (numRows > 0) { %>
    <table id="detail-desc" border="1"><%=entries%></table>
    <% } else { %>
    <p>No entries found.</p>
    <% } %>
    <div id ="test" runat="server">
        </div>

</asp:Content>
