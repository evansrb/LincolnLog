<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="NewEntries.aspx.cs" Inherits="LincolnLog.NewEntries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<div id="dayheader" runat="server">
			<h1>
			</h1>
		</div>
		<span id="dayentriesfound" runat="server"></span>
		<div id ="tablemonthview" runat="server">
        <table >
        <tr>
        <td></td></tr>
        </table></div>
</asp:Content>