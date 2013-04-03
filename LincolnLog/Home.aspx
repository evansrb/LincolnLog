<%@ Page Title="" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true"    CodeBehind="Home.aspx.cs" Inherits="LincolnLog1.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/javascripts/jquery.js?1180447223" type="text/javascript"></script>
	 <script src="javascripts/script1.js" type="text/javascript"></script>
	 <script type="text/javascript" language="javascript">

	     function toggle_advanced() {
	         if (advanced == 0) {
	             advanced = 1;
	             $("#advanced").show();
	             $("#search_flag").html("Basic Search");
	             $("#search_advanced").val(1);
	         }
	         else {
	             advanced = 0;
	             $("#advanced").hide();
	             $("#search_flag").html("Advanced Search");
	             $("#search_advanced").val(0);
	         }
	         $("#advanced select").val("");
	     };

	     function clear_form() {
	         $("#ContentPlaceHolder1_txtSearch").val("")
	         $("#ContentPlaceHolder1_search_place").prop("selectedIndex", -1);
	         $(".clearDropDown").prop("selectedIndex", 0);
	     };


</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <strong><i>&nbsp;&nbsp;&nbsp;The Lincoln Log: A Daily Chronology of the Life of Abraham
            Lincoln</i></strong> incorporates <i>Lincoln Day-by-Day: A Chronology</i>, compiled
        by the Lincoln Sesquicentennial Commission with the cooperation and support of the
        <a href="http://www.abrahamlincolnassociation.org">Abraham Lincoln Association</a>
        and published by the Government Printing Office in 1960. The text presented here
        includes all entries from that publication, with corrections and additions by the
        Papers of Abraham Lincoln, a project of the <a href="http://www.state.il.us/HPA/">Illinois
            Historic Preservation Agency</a> and the <a href="http://www.alplm.org">Abraham Lincoln
                Presidential Library and Museum</a>.
        <p>
        &nbsp;&nbsp;&nbsp; This electronic publication is redesigned and hosted by dataformat.com.  From 2007 to 2012, the National Center for Supercomputing Applications 
        at the University of Illinois at Urbana-Champaign hosted The Lincoln Log, and from 2003 to 2007, the Scholarly Technology Group at Brown University hosted it.
        </p>
        <p>
            &nbsp;&nbsp;&nbsp; The staff of the Papers of Abraham Lincoln will continue to update
            and supplement these entries as new materials become available. Several <a href="http://www.papersofabrahamlincoln.org/data_donors.htm">
                individuals</a> have already contributed new information and corrections to
            the ongoing updating of <i>The Lincoln Log</i>. Please send corrections and additions
            with documentation to the <a href="http://www.papersofabrahamlincoln.org/contact_information.htm">
                Papers of Abraham Lincoln</a> for consideration.
        </p>
        <p>
            <strong>Choose from the following to access the log:</strong>
        </p>
        <div class="selection">
        <span id="selection1" style="vertical-align: top">&bull;&nbsp;Browse by Year&nbsp;&nbsp;<asp:Button 
                ID="btnSelect1" runat="server" Text="GO" Height="25px" 
				PostBackUrl="~/Calendar.aspx" /></span><br /><br />
        <span id="selection2" style="vertical-align: top">&bull;&nbsp;Today's Date in Lincoln's Life&nbsp;&nbsp;<asp:Button 
                ID="btnSelect2" runat="server" Text="GO" Height="25px" 
				PostBackUrl="~/ThisDay.aspx" /></span><br /><br />
        <span id="selection3" style="vertical-align: top">&bull;&nbsp;Basic Search&nbsp;by 
            Date&nbsp;
            <asp:DropDownList ID="DropDownBasicDay" runat="server" CausesValidation="True" 
                CssClass="clearDropDown">
                <asp:ListItem Value="">--</asp:ListItem>
                <asp:ListItem Value="01">01</asp:ListItem>
                <asp:ListItem Value="02">02</asp:ListItem>
                <asp:ListItem Value="03">03</asp:ListItem>
                <asp:ListItem Value="04">04</asp:ListItem>
                <asp:ListItem Value="05">05</asp:ListItem>
                <asp:ListItem Value="06">06</asp:ListItem>
                <asp:ListItem Value="07">07</asp:ListItem>
                <asp:ListItem Value="08">08</asp:ListItem>
                <asp:ListItem Value="09">09</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
                <asp:ListItem Value="13">13</asp:ListItem>
                <asp:ListItem Value="14">14</asp:ListItem>
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="16">16</asp:ListItem>
                <asp:ListItem Value="17">17</asp:ListItem>
                <asp:ListItem Value="18">18</asp:ListItem>
                <asp:ListItem Value="19">19</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="21">21</asp:ListItem>
                <asp:ListItem Value="22">22</asp:ListItem>
                <asp:ListItem Value="23">23</asp:ListItem>
                <asp:ListItem Value="24">24</asp:ListItem>
                <asp:ListItem Value="25">25</asp:ListItem>
                <asp:ListItem Value="26">26</asp:ListItem>
                <asp:ListItem Value="27">27</asp:ListItem>
                <asp:ListItem Value="28">28</asp:ListItem>
                <asp:ListItem Value="29">29</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="31">31</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownBasicMonth" runat="server" 
                CausesValidation="True" CssClass="clearDropDown">
                <asp:ListItem Value="">---------</asp:ListItem>
                <asp:ListItem Value="01">January</asp:ListItem>
                <asp:ListItem Value="02">February</asp:ListItem>
                <asp:ListItem Value="03">March</asp:ListItem>
                <asp:ListItem Value="04">April</asp:ListItem>
                <asp:ListItem Value="05">May</asp:ListItem>
                <asp:ListItem Value="06">June</asp:ListItem>
                <asp:ListItem Value="07">July</asp:ListItem>
                <asp:ListItem Value="08">August</asp:ListItem>
                <asp:ListItem Value="09">September</asp:ListItem>
                <asp:ListItem Value="10">October</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
           </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownBasicYear" runat="server" 
                CssClass="clearDropDown">
                <asp:ListItem Value="">----</asp:ListItem>
                <asp:ListItem Value="1809">1809</asp:ListItem>
                <asp:ListItem Value="1810">1810</asp:ListItem>
                <asp:ListItem Value="1811">1811</asp:ListItem>
                <asp:ListItem Value="1812">1812</asp:ListItem>
                <asp:ListItem Value="1813">1813</asp:ListItem>
                <asp:ListItem Value="1814">1814</asp:ListItem>
                <asp:ListItem Value="1815">1815</asp:ListItem>
                <asp:ListItem Value="1816">1816</asp:ListItem>
                <asp:ListItem Value="1817">1817</asp:ListItem>
                <asp:ListItem Value="1818">1818</asp:ListItem>
                <asp:ListItem Value="1819">1819</asp:ListItem>
                <asp:ListItem Value="1820">1820</asp:ListItem>
                <asp:ListItem Value="1821">1821</asp:ListItem>
                <asp:ListItem Value="1822">1822</asp:ListItem>
                <asp:ListItem Value="1823">1823</asp:ListItem>
                <asp:ListItem Value="1824">1824</asp:ListItem>
                <asp:ListItem Value="1825">1825</asp:ListItem>
                <asp:ListItem Value="1826">1826</asp:ListItem>
                <asp:ListItem Value="1827">1827</asp:ListItem>
                <asp:ListItem Value="1828">1828</asp:ListItem>
                <asp:ListItem Value="1829">1829</asp:ListItem>
                <asp:ListItem Value="1830">1830</asp:ListItem>
                <asp:ListItem Value="1831">1831</asp:ListItem>
                <asp:ListItem Value="1832">1832</asp:ListItem>
                <asp:ListItem Value="1833">1833</asp:ListItem>
                <asp:ListItem Value="1834">1834</asp:ListItem>
                <asp:ListItem Value="1835">1835</asp:ListItem>
                <asp:ListItem Value="1836">1836</asp:ListItem>
                <asp:ListItem Value="1837">1837</asp:ListItem>
                <asp:ListItem Value="1838">1838</asp:ListItem>
                <asp:ListItem Value="1839">1839</asp:ListItem>
                <asp:ListItem Value="1840">1840</asp:ListItem>
                <asp:ListItem Value="1841">1841</asp:ListItem>
                <asp:ListItem Value="1842">1842</asp:ListItem>
                <asp:ListItem Value="1843">1843</asp:ListItem>
                <asp:ListItem Value="1844">1844</asp:ListItem>
                <asp:ListItem Value="1845">1845</asp:ListItem>
                <asp:ListItem Value="1846">1846</asp:ListItem>
                <asp:ListItem Value="1847">1847</asp:ListItem>
                <asp:ListItem Value="1848">1848</asp:ListItem>
                <asp:ListItem Value="1849">1849</asp:ListItem>
                <asp:ListItem Value="1850">1850</asp:ListItem>
                <asp:ListItem Value="1851">1851</asp:ListItem>
                <asp:ListItem Value="1852">1852</asp:ListItem>
                <asp:ListItem Value="1853">1853</asp:ListItem>
                <asp:ListItem Value="1854">1854</asp:ListItem>
                <asp:ListItem Value="1855">1855</asp:ListItem>
                <asp:ListItem Value="1856">1856</asp:ListItem>
                <asp:ListItem Value="1857">1857</asp:ListItem>
                <asp:ListItem Value="1858">1858</asp:ListItem>
                <asp:ListItem Value="1859">1859</asp:ListItem>
                <asp:ListItem Value="1860">1860</asp:ListItem>
                <asp:ListItem Value="1861">1861</asp:ListItem>
                <asp:ListItem Value="1862">1862</asp:ListItem>
                <asp:ListItem Value="1863">1863</asp:ListItem>
                <asp:ListItem Value="1864">1864</asp:ListItem>
                <asp:ListItem Value="1865">1865</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSelect3" runat="server" Text="GO" Height="25px" 
				onclick="btnSelect3_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="Please select a month" 
                ControlToValidate="DropDownBasicMonth" 
                onservervalidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                </span>
            
            <br /><br />
        <span id="selection4" style="vertical-align: top">&bull;&nbsp;Basic Search&nbsp;by 
            Text &nbsp;&nbsp;<asp:TextBox ID="txtSearch" runat="server" 
                MaxLength="50" Width="211px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSelect4" runat="server" Text="GO" Height="25px" 
				PostBackUrl="~/Search.aspx" />&nbsp;&nbsp; 
                <a href="#" id="search_flag" onclick="toggle_advanced();return false;">Basic Search</a>&nbsp;&nbsp; 
                <a href="#" id="clear_flag" onclick="clear_form();return false;">Clear Form</a></span><br /><br />
                <div id="advanced"><span style="vertical-align: top">&nbsp;&nbsp;Advanced by Date:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvDayFrom" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">--</asp:ListItem>
                <asp:ListItem Value="01">01</asp:ListItem>
                <asp:ListItem Value="02">02</asp:ListItem>
                <asp:ListItem Value="03">03</asp:ListItem>
                <asp:ListItem Value="04">04</asp:ListItem>
                <asp:ListItem Value="05">05</asp:ListItem>
                <asp:ListItem Value="06">06</asp:ListItem>
                <asp:ListItem Value="07">07</asp:ListItem>
                <asp:ListItem Value="08">08</asp:ListItem>
                <asp:ListItem Value="09">09</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
                <asp:ListItem Value="13">13</asp:ListItem>
                <asp:ListItem Value="14">14</asp:ListItem>
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="16">16</asp:ListItem>
                <asp:ListItem Value="17">17</asp:ListItem>
                <asp:ListItem Value="18">18</asp:ListItem>
                <asp:ListItem Value="19">19</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="21">21</asp:ListItem>
                <asp:ListItem Value="22">22</asp:ListItem>
                <asp:ListItem Value="23">23</asp:ListItem>
                <asp:ListItem Value="24">24</asp:ListItem>
                <asp:ListItem Value="25">25</asp:ListItem>
                <asp:ListItem Value="26">26</asp:ListItem>
                <asp:ListItem Value="27">27</asp:ListItem>
                <asp:ListItem Value="28">28</asp:ListItem>
                <asp:ListItem Value="29">29</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="31">31</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvMonthFrom" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">---------</asp:ListItem>
                <asp:ListItem Value="01">January</asp:ListItem>
                <asp:ListItem Value="02">February</asp:ListItem>
                <asp:ListItem Value="03">March</asp:ListItem>
                <asp:ListItem Value="04">April</asp:ListItem>
                <asp:ListItem Value="05">May</asp:ListItem>
                <asp:ListItem Value="06">June</asp:ListItem>
                <asp:ListItem Value="07">July</asp:ListItem>
                <asp:ListItem Value="08">August</asp:ListItem>
                <asp:ListItem Value="09">September</asp:ListItem>
                <asp:ListItem Value="10">October</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
           </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvYearFrom" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">----</asp:ListItem>
                <asp:ListItem Value="1809">1809</asp:ListItem>
                <asp:ListItem Value="1810">1810</asp:ListItem>
                <asp:ListItem Value="1811">1811</asp:ListItem>
                <asp:ListItem Value="1812">1812</asp:ListItem>
                <asp:ListItem Value="1813">1813</asp:ListItem>
                <asp:ListItem Value="1814">1814</asp:ListItem>
                <asp:ListItem Value="1815">1815</asp:ListItem>
                <asp:ListItem Value="1816">1816</asp:ListItem>
                <asp:ListItem Value="1817">1817</asp:ListItem>
                <asp:ListItem Value="1818">1818</asp:ListItem>
                <asp:ListItem Value="1819">1819</asp:ListItem>
                <asp:ListItem Value="1820">1820</asp:ListItem>
                <asp:ListItem Value="1821">1821</asp:ListItem>
                <asp:ListItem Value="1822">1822</asp:ListItem>
                <asp:ListItem Value="1823">1823</asp:ListItem>
                <asp:ListItem Value="1824">1824</asp:ListItem>
                <asp:ListItem Value="1825">1825</asp:ListItem>
                <asp:ListItem Value="1826">1826</asp:ListItem>
                <asp:ListItem Value="1827">1827</asp:ListItem>
                <asp:ListItem Value="1828">1828</asp:ListItem>
                <asp:ListItem Value="1829">1829</asp:ListItem>
                <asp:ListItem Value="1830">1830</asp:ListItem>
                <asp:ListItem Value="1831">1831</asp:ListItem>
                <asp:ListItem Value="1832">1832</asp:ListItem>
                <asp:ListItem Value="1833">1833</asp:ListItem>
                <asp:ListItem Value="1834">1834</asp:ListItem>
                <asp:ListItem Value="1835">1835</asp:ListItem>
                <asp:ListItem Value="1836">1836</asp:ListItem>
                <asp:ListItem Value="1837">1837</asp:ListItem>
                <asp:ListItem Value="1838">1838</asp:ListItem>
                <asp:ListItem Value="1839">1839</asp:ListItem>
                <asp:ListItem Value="1840">1840</asp:ListItem>
                <asp:ListItem Value="1841">1841</asp:ListItem>
                <asp:ListItem Value="1842">1842</asp:ListItem>
                <asp:ListItem Value="1843">1843</asp:ListItem>
                <asp:ListItem Value="1844">1844</asp:ListItem>
                <asp:ListItem Value="1845">1845</asp:ListItem>
                <asp:ListItem Value="1846">1846</asp:ListItem>
                <asp:ListItem Value="1847">1847</asp:ListItem>
                <asp:ListItem Value="1848">1848</asp:ListItem>
                <asp:ListItem Value="1849">1849</asp:ListItem>
                <asp:ListItem Value="1850">1850</asp:ListItem>
                <asp:ListItem Value="1851">1851</asp:ListItem>
                <asp:ListItem Value="1852">1852</asp:ListItem>
                <asp:ListItem Value="1853">1853</asp:ListItem>
                <asp:ListItem Value="1854">1854</asp:ListItem>
                <asp:ListItem Value="1855">1855</asp:ListItem>
                <asp:ListItem Value="1856">1856</asp:ListItem>
                <asp:ListItem Value="1857">1857</asp:ListItem>
                <asp:ListItem Value="1858">1858</asp:ListItem>
                <asp:ListItem Value="1859">1859</asp:ListItem>
                <asp:ListItem Value="1860">1860</asp:ListItem>
                <asp:ListItem Value="1861">1861</asp:ListItem>
                <asp:ListItem Value="1862">1862</asp:ListItem>
                <asp:ListItem Value="1863">1863</asp:ListItem>
                <asp:ListItem Value="1864">1864</asp:ListItem>
                <asp:ListItem Value="1865">1865</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;Through&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvDayTo" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">--</asp:ListItem>
                <asp:ListItem Value="01">01</asp:ListItem>
                <asp:ListItem Value="02">02</asp:ListItem>
                <asp:ListItem Value="03">03</asp:ListItem>
                <asp:ListItem Value="04">04</asp:ListItem>
                <asp:ListItem Value="05">05</asp:ListItem>
                <asp:ListItem Value="06">06</asp:ListItem>
                <asp:ListItem Value="07">07</asp:ListItem>
                <asp:ListItem Value="08">08</asp:ListItem>
                <asp:ListItem Value="09">09</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
                <asp:ListItem Value="13">13</asp:ListItem>
                <asp:ListItem Value="14">14</asp:ListItem>
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="16">16</asp:ListItem>
                <asp:ListItem Value="17">17</asp:ListItem>
                <asp:ListItem Value="18">18</asp:ListItem>
                <asp:ListItem Value="19">19</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="21">21</asp:ListItem>
                <asp:ListItem Value="22">22</asp:ListItem>
                <asp:ListItem Value="23">23</asp:ListItem>
                <asp:ListItem Value="24">24</asp:ListItem>
                <asp:ListItem Value="25">25</asp:ListItem>
                <asp:ListItem Value="26">26</asp:ListItem>
                <asp:ListItem Value="27">27</asp:ListItem>
                <asp:ListItem Value="28">28</asp:ListItem>
                <asp:ListItem Value="29">29</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="31">31</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvMonthTo" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">---------</asp:ListItem>
                <asp:ListItem Value="01">January</asp:ListItem>
                <asp:ListItem Value="02">February</asp:ListItem>
                <asp:ListItem Value="03">March</asp:ListItem>
                <asp:ListItem Value="04">April</asp:ListItem>
                <asp:ListItem Value="05">May</asp:ListItem>
                <asp:ListItem Value="06">June</asp:ListItem>
                <asp:ListItem Value="07">July</asp:ListItem>
                <asp:ListItem Value="08">August</asp:ListItem>
                <asp:ListItem Value="09">September</asp:ListItem>
                <asp:ListItem Value="10">October</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
           </asp:DropDownList>&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownAdvYearTo" runat="server" CssClass="clearDropDown">
                <asp:ListItem Value="">----</asp:ListItem>
                <asp:ListItem Value="1809">1809</asp:ListItem>
                <asp:ListItem Value="1810">1810</asp:ListItem>
                <asp:ListItem Value="1811">1811</asp:ListItem>
                <asp:ListItem Value="1812">1812</asp:ListItem>
                <asp:ListItem Value="1813">1813</asp:ListItem>
                <asp:ListItem Value="1814">1814</asp:ListItem>
                <asp:ListItem Value="1815">1815</asp:ListItem>
                <asp:ListItem Value="1816">1816</asp:ListItem>
                <asp:ListItem Value="1817">1817</asp:ListItem>
                <asp:ListItem Value="1818">1818</asp:ListItem>
                <asp:ListItem Value="1819">1819</asp:ListItem>
                <asp:ListItem Value="1820">1820</asp:ListItem>
                <asp:ListItem Value="1821">1821</asp:ListItem>
                <asp:ListItem Value="1822">1822</asp:ListItem>
                <asp:ListItem Value="1823">1823</asp:ListItem>
                <asp:ListItem Value="1824">1824</asp:ListItem>
                <asp:ListItem Value="1825">1825</asp:ListItem>
                <asp:ListItem Value="1826">1826</asp:ListItem>
                <asp:ListItem Value="1827">1827</asp:ListItem>
                <asp:ListItem Value="1828">1828</asp:ListItem>
                <asp:ListItem Value="1829">1829</asp:ListItem>
                <asp:ListItem Value="1830">1830</asp:ListItem>
                <asp:ListItem Value="1831">1831</asp:ListItem>
                <asp:ListItem Value="1832">1832</asp:ListItem>
                <asp:ListItem Value="1833">1833</asp:ListItem>
                <asp:ListItem Value="1834">1834</asp:ListItem>
                <asp:ListItem Value="1835">1835</asp:ListItem>
                <asp:ListItem Value="1836">1836</asp:ListItem>
                <asp:ListItem Value="1837">1837</asp:ListItem>
                <asp:ListItem Value="1838">1838</asp:ListItem>
                <asp:ListItem Value="1839">1839</asp:ListItem>
                <asp:ListItem Value="1840">1840</asp:ListItem>
                <asp:ListItem Value="1841">1841</asp:ListItem>
                <asp:ListItem Value="1842">1842</asp:ListItem>
                <asp:ListItem Value="1843">1843</asp:ListItem>
                <asp:ListItem Value="1844">1844</asp:ListItem>
                <asp:ListItem Value="1845">1845</asp:ListItem>
                <asp:ListItem Value="1846">1846</asp:ListItem>
                <asp:ListItem Value="1847">1847</asp:ListItem>
                <asp:ListItem Value="1848">1848</asp:ListItem>
                <asp:ListItem Value="1849">1849</asp:ListItem>
                <asp:ListItem Value="1850">1850</asp:ListItem>
                <asp:ListItem Value="1851">1851</asp:ListItem>
                <asp:ListItem Value="1852">1852</asp:ListItem>
                <asp:ListItem Value="1853">1853</asp:ListItem>
                <asp:ListItem Value="1854">1854</asp:ListItem>
                <asp:ListItem Value="1855">1855</asp:ListItem>
                <asp:ListItem Value="1856">1856</asp:ListItem>
                <asp:ListItem Value="1857">1857</asp:ListItem>
                <asp:ListItem Value="1858">1858</asp:ListItem>
                <asp:ListItem Value="1859">1859</asp:ListItem>
                <asp:ListItem Value="1860">1860</asp:ListItem>
                <asp:ListItem Value="1861">1861</asp:ListItem>
                <asp:ListItem Value="1862">1862</asp:ListItem>
                <asp:ListItem Value="1863">1863</asp:ListItem>
                <asp:ListItem Value="1864">1864</asp:ListItem>
                <asp:ListItem Value="1865">1865</asp:ListItem>
          </asp:DropDownList>
                </span><br /><br />
        <span id="Span2" style="vertical-align: top">&nbsp;&nbsp;Place &nbsp;&nbsp;
									<asp:DropDownList ID="search_place" runat="server" 
                        CssClass="clearDropDown">
								<asp:ListItem Value=""></asp:ListItem>
								<asp:ListItem Value="54">Albany, IL</asp:ListItem>
								<asp:ListItem Value="141">Albany, NY</asp:ListItem>
								<asp:ListItem Value="59">Allenton, IL</asp:ListItem>
								<asp:ListItem Value="78">Alton, IL</asp:ListItem>
								<asp:ListItem Value="183">Amboy, IL</asp:ListItem>
								<asp:ListItem Value="234">Aquia Creek, VA</asp:ListItem>
								<asp:ListItem Value="213">Atchison, Kansas Territory</asp:ListItem>
								<asp:ListItem Value="49">Athens, IL</asp:ListItem>
								<asp:ListItem Value="170">Atlanta, IL</asp:ListItem>
								<asp:ListItem Value="181">Augusta, IL</asp:ListItem>
								<asp:ListItem Value="233">Baltimore, MD</asp:ListItem>
								<asp:ListItem Value="63">Bath, IL</asp:ListItem>
								<asp:ListItem Value="22">Beardstown, IL</asp:ListItem>
								<asp:ListItem Value="242">Belle Plain, VA</asp:ListItem>
								<asp:ListItem Value="79">Belleville, IL</asp:ListItem>
								<asp:ListItem Value="208">Beloit, WI</asp:ListItem>
								<asp:ListItem Value="69">Berlin, IL</asp:ListItem>
								<asp:ListItem Value="200">Blandinsville, IL</asp:ListItem>
								<asp:ListItem Value="66">Bloomington, IL</asp:ListItem>
								<asp:ListItem Value="134">Boston, MA</asp:ListItem>
								<asp:ListItem Value="226">Bridgeport, CT</asp:ListItem>
								<asp:ListItem Value="227">Brooklyn, NY</asp:ListItem>
								<asp:ListItem Value="142">Buffalo, NY</asp:ListItem>
								<asp:ListItem Value="270">Burlington, IA</asp:ListItem>
								<asp:ListItem Value="139">Cambridge, MA</asp:ListItem>
								<asp:ListItem Value="263">Camden (Postville), IL</asp:ListItem>
								<asp:ListItem Value="113">Carlin Township, IN</asp:ListItem>
								<asp:ListItem Value="77">Carlinville, IL</asp:ListItem>
								<asp:ListItem Value="85">Carmi, IL</asp:ListItem>
								<asp:ListItem Value="159">Carrollton, IL</asp:ListItem>
								<asp:ListItem Value="73">Carthage, IL</asp:ListItem>
								<asp:ListItem Value="190">Centralia, IL</asp:ListItem>
								<asp:ListItem Value="92">Charleston, IL</asp:ListItem>
								<asp:ListItem Value="137">Chelsea, MA</asp:ListItem>
								<asp:ListItem Value="124">Chicago, IL</asp:ListItem>
								<asp:ListItem Value="161">Cincinnati, OH</asp:ListItem>
								<asp:ListItem Value="246">City Point, VA</asp:ListItem>
								<asp:ListItem Value="50">Clary's Grove, IL</asp:ListItem>
								<asp:ListItem Value="231">Cleveland, OH</asp:ListItem>
								<asp:ListItem Value="75">Clinton, IL</asp:ListItem>
								<asp:ListItem Value="151">Coles County, IL</asp:ListItem>
								<asp:ListItem Value="205">Columbus, OH</asp:ListItem>
								<asp:ListItem Value="217">Concord, NH</asp:ListItem>
								<asp:ListItem Value="203">Council Bluffs, IA</asp:ListItem>
								<asp:ListItem Value="198">Dallas City, IL</asp:ListItem>
								<asp:ListItem Value="91">Danville, IL</asp:ListItem>
								<asp:ListItem Value="206">Dayton, OH</asp:ListItem>
								<asp:ListItem Value="12">Decatur, IL</asp:ListItem>
								<asp:ListItem Value="138">Dedham, MA</asp:ListItem>
								<asp:ListItem Value="118">Delavan, IL</asp:ListItem>
								<asp:ListItem Value="27">Dixon's Ferry, IL</asp:ListItem>
								<asp:ListItem Value="163">Dixon, IL</asp:ListItem>
								<asp:ListItem Value="212">Doniphan, Kansas Territory</asp:ListItem>
								<asp:ListItem Value="136">Dorchester, MA</asp:ListItem>
								<asp:ListItem Value="219">Dover, NH</asp:ListItem>
								<asp:ListItem Value="175">Edwardsville, IL</asp:ListItem>
								<asp:ListItem Value="185">El Paso, IL</asp:ListItem>
								<asp:ListItem Value="3">Elizabethtown, KY</asp:ListItem>
								<asp:ListItem Value="210">Elwood, Kansas Territory</asp:ListItem>
								<asp:ListItem Value="4">En route</asp:ListItem>
								<asp:ListItem Value="87">Equality, IL</asp:ListItem>
								<asp:ListItem Value="229">Evanston, IL</asp:ListItem>
								<asp:ListItem Value="262">Evansville, IN</asp:ListItem>
								<asp:ListItem Value="216">Exeter, NH</asp:ListItem>
								<asp:ListItem Value="243">Falmouth, VA</asp:ListItem>
								<asp:ListItem Value="34">Fort Johnson</asp:ListItem>
								<asp:ListItem Value="37">Fort Wilbourn, IL</asp:ListItem>
								<asp:ListItem Value="235">Fortress Monroe, VA</asp:ListItem>
								<asp:ListItem Value="197">Fountain Green, IL</asp:ListItem>
								<asp:ListItem Value="32">Fox River</asp:ListItem>
								<asp:ListItem Value="241">Frederick, MD</asp:ListItem>
								<asp:ListItem Value="236">Fredericksburg, VA</asp:ListItem>
								<asp:ListItem Value="184">Freeport, IL</asp:ListItem>
								<asp:ListItem Value="35">Galena, IL</asp:ListItem>
								<asp:ListItem Value="191">Galesburg, IL</asp:ListItem>
								<asp:ListItem Value="247">General Grant's Headquarters</asp:ListItem>
								<asp:ListItem Value="265">General Hooker's Headquarters</asp:ListItem>
								<asp:ListItem Value="264">General McClellan's Headquarters</asp:ListItem>
								<asp:ListItem Value="114">Gentryville, IN</asp:ListItem>
								<asp:ListItem Value="244">Gettysburg, PA</asp:ListItem>
								<asp:ListItem Value="166">Grand View, IL</asp:ListItem>
								<asp:ListItem Value="121">Greenup, IL</asp:ListItem>
								<asp:ListItem Value="188">Greenville, IL</asp:ListItem>
								<asp:ListItem Value="207">Hamilton, OH</asp:ListItem>
								<asp:ListItem Value="248">Hampton Roads, VA</asp:ListItem>
								<asp:ListItem Value="204">Hannibal, MO</asp:ListItem>
								<asp:ListItem Value="107">Hanover, IL</asp:ListItem>
								<asp:ListItem Value="1">Hardin County, KY</asp:ListItem>
								<asp:ListItem Value="239">Harper's Ferry, VA</asp:ListItem>
								<asp:ListItem Value="232">Harrisburg, PA</asp:ListItem>
								<asp:ListItem Value="238">Harrison's Landing, VA</asp:ListItem>
								<asp:ListItem Value="220">Hartford, CT</asp:ListItem>
								<asp:ListItem Value="43">Havana, IL</asp:ListItem>
								<asp:ListItem Value="146">Hennepin, IL</asp:ListItem>
								<asp:ListItem Value="179">Henry, IL</asp:ListItem>
								<asp:ListItem Value="187">Highland, IL</asp:ListItem>
								<asp:ListItem Value="106">Hillsboro, IL</asp:ListItem>
								<asp:ListItem Value="272">IL</asp:ListItem>
								<asp:ListItem Value="36">Illinois River</asp:ListItem>
								<asp:ListItem Value="6">Indiana</asp:ListItem>
								<asp:ListItem Value="148">Indianapolis, IN</asp:ListItem>
								<asp:ListItem Value="71">Jacksonville, IL</asp:ListItem>
								<asp:ListItem Value="209">Janesville, WI</asp:ListItem>
								<asp:ListItem Value="172">Joliet, IL</asp:ListItem>
								<asp:ListItem Value="189">Jonesboro, IL</asp:ListItem>
								<asp:ListItem Value="169">Kalamazoo, MI</asp:ListItem>
								<asp:ListItem Value="38">Kellogg's Grove, IL</asp:ListItem>
								<asp:ListItem Value="5">Kentucky</asp:ListItem>
								<asp:ListItem Value="271">Kewanee, IL</asp:ListItem>
								<asp:ListItem Value="30">Kishwaukee River</asp:ListItem>
								<asp:ListItem Value="199">La Harpe, IL</asp:ListItem>
								<asp:ListItem Value="115">Lacon, IL</asp:ListItem>
								<asp:ListItem Value="88">Lawrenceville, IL</asp:ListItem>
								<asp:ListItem Value="214">Leavenworth, Kansas Territory</asp:ListItem>
								<asp:ListItem Value="65">Lewistown, IL</asp:ListItem>
								<asp:ListItem Value="127">Lexington, KY</asp:ListItem>
								<asp:ListItem Value="259">Lick Creek</asp:ListItem>
								<asp:ListItem Value="157">Lincoln, IL</asp:ListItem>
								<asp:ListItem Value="93">Louisville, KY</asp:ListItem>
								<asp:ListItem Value="135">Lowell, MA</asp:ListItem>
								<asp:ListItem Value="117">Mackinaw, IL</asp:ListItem>
								<asp:ListItem Value="182">Macomb, IL</asp:ListItem>
								<asp:ListItem Value="11">Macon County, IL</asp:ListItem>
								<asp:ListItem Value="145">Magnolia, IL</asp:ListItem>
								<asp:ListItem Value="218">Manchester, NH</asp:ListItem>
								<asp:ListItem Value="98">Marshall, IL</asp:ListItem>
								<asp:ListItem Value="186">Mattoon, IL</asp:ListItem>
								<asp:ListItem Value="57">Mechanicsburg, IL</asp:ListItem>
								<asp:ListItem Value="195">Meredosia, IL</asp:ListItem>
								<asp:ListItem Value="222">Meriden, CT</asp:ListItem>
								<asp:ListItem Value="111">Metamora, IL</asp:ListItem>
								<asp:ListItem Value="144">Milwaukee, WI</asp:ListItem>
								<asp:ListItem Value="48">Monmouth, IL</asp:ListItem>
								<asp:ListItem Value="150">Monticello, IL</asp:ListItem>
								<asp:ListItem Value="178">Morris, IL</asp:ListItem>
								<asp:ListItem Value="149">Mount Pulaski, IL</asp:ListItem>
								<asp:ListItem Value="196">Mount Sterling, IL</asp:ListItem>
								<asp:ListItem Value="84">Mount Vernon, IL</asp:ListItem>
								<asp:ListItem Value="268">Mt. Vernon, IL</asp:ListItem>
								<asp:ListItem Value="269">Mt. Vernon, IL and Springfield, IL</asp:ListItem>
								<asp:ListItem Value="156">Naples, IL</asp:ListItem>
								<asp:ListItem Value="133">New Bedford, MA</asp:ListItem>
								<asp:ListItem Value="47">New Boston, IL</asp:ListItem>
								<asp:ListItem Value="221">New Haven, CT</asp:ListItem>
								<asp:ListItem Value="223">New London, CT</asp:ListItem>
								<asp:ListItem Value="18">New Orleans, LA</asp:ListItem>
								<asp:ListItem Value="19">New Salem, IL</asp:ListItem>
								<asp:ListItem Value="174">New York, NY</asp:ListItem>
								<asp:ListItem Value="143">Niagara Falls, NY</asp:ListItem>
								<asp:ListItem Value="225">Norwich, CT</asp:ListItem>
								<asp:ListItem Value="62">Oakford, IL</asp:ListItem>
								<asp:ListItem Value="10">Ohio River</asp:ListItem>
								<asp:ListItem Value="171">Olney, IL</asp:ListItem>
								<asp:ListItem Value="193">Oquawka, IL</asp:ListItem>
								<asp:ListItem Value="168">Oregon, IL</asp:ListItem>
								<asp:ListItem Value="33">Ottawa, IL</asp:ListItem>
								<asp:ListItem Value="257">Palestine, IL</asp:ListItem>
								<asp:ListItem Value="39">Pappsville, IL</asp:ListItem>
								<asp:ListItem Value="258">Paradise, IL</asp:ListItem>
								<asp:ListItem Value="100">Paris, IL</asp:ListItem>
								<asp:ListItem Value="105">Pekin, IL</asp:ListItem>
								<asp:ListItem Value="42">Peoria, IL</asp:ListItem>
								<asp:ListItem Value="7">Perry County, IN</asp:ListItem>
								<asp:ListItem Value="53">Petersburg, IL</asp:ListItem>
								<asp:ListItem Value="250">Petersburg, VA</asp:ListItem>
								<asp:ListItem Value="128">Philadelphia, PA</asp:ListItem>
								<asp:ListItem Value="230">Pittsburgh, PA</asp:ListItem>
								<asp:ListItem Value="74">Pittsfield, IL</asp:ListItem>
								<asp:ListItem Value="245">Point Lookout, MD</asp:ListItem>
								<asp:ListItem Value="167">Polo, IL</asp:ListItem>
								<asp:ListItem Value="80">Pontiac, IL</asp:ListItem>
								<asp:ListItem Value="101">Postville, IL</asp:ListItem>
								<asp:ListItem Value="31">Potawatomi Village</asp:ListItem>
								<asp:ListItem Value="162">Princeton, IL</asp:ListItem>
								<asp:ListItem Value="26">Prophetstown, IL</asp:ListItem>
								<asp:ListItem Value="215">Providence, RI</asp:ListItem>
								<asp:ListItem Value="160">Quincy, IL</asp:ListItem>
								<asp:ListItem Value="21">Richland, IL</asp:ListItem>
								<asp:ListItem Value="251">Richmond, VA</asp:ListItem>
								<asp:ListItem Value="102">Rochester, IL</asp:ListItem>
								<asp:ListItem Value="24">Rock River</asp:ListItem>
								<asp:ListItem Value="112">Rockport, IN</asp:ListItem>
								<asp:ListItem Value="131">Rockville, MD</asp:ListItem>
								<asp:ListItem Value="72">Rushville, IL</asp:ListItem>
								<asp:ListItem Value="55">Salisbury, IL</asp:ListItem>
								<asp:ListItem Value="16">Sangamo Town, IL</asp:ListItem>
								<asp:ListItem Value="45">Sangamon County, IL</asp:ListItem>
								<asp:ListItem Value="260">Sangamon River</asp:ListItem>
								<asp:ListItem Value="130">Seneca, MD</asp:ListItem>
								<asp:ListItem Value="86">Shawneetown, IL</asp:ListItem>
								<asp:ListItem Value="82">Shelbyville, IL</asp:ListItem>
								<asp:ListItem Value="9">Spencer County, IN</asp:ListItem>
								<asp:ListItem Value="44">Springfield, IL</asp:ListItem>
								<asp:ListItem Value="267">Springfield, IL and Mt. Vernon, IL</asp:ListItem>
								<asp:ListItem Value="202">St. Joseph, MO</asp:ListItem>
								<asp:ListItem Value="94">St. Louis, MO</asp:ListItem>
								<asp:ListItem Value="261">Steamboat</asp:ListItem>
								<asp:ListItem Value="164">Sterling, IL</asp:ListItem>
								<asp:ListItem Value="28">Stillman's Battlefield</asp:ListItem>
								<asp:ListItem Value="155">Sullivan, IL</asp:ListItem>
								<asp:ListItem Value="140">Taunton, MA</asp:ListItem>
								<asp:ListItem Value="81">Taylorville, IL</asp:ListItem>
								<asp:ListItem Value="147">Terre Haute, IN</asp:ListItem>
								<asp:ListItem Value="192">Toulon, IL</asp:ListItem>
								<asp:ListItem Value="64">Tremont, IL</asp:ListItem>
								<asp:ListItem Value="211">Troy, Kansas Territory</asp:ListItem>
								<asp:ListItem Value="90">Urbana, IL</asp:ListItem>
								<asp:ListItem Value="273">USS</asp:ListItem>
								<asp:ListItem Value="51">Vandalia, IL</asp:ListItem>
								<asp:ListItem Value="201">Vermont, IL</asp:ListItem>
								<asp:ListItem Value="103">Versailles, IL</asp:ListItem>
								<asp:ListItem Value="8">Vincennes, IN</asp:ListItem>
								<asp:ListItem Value="108">Virginia, IL</asp:ListItem>
								<asp:ListItem Value="126">Washington, DC</asp:ListItem>
								<asp:ListItem Value="83">Waterloo, IL</asp:ListItem>
								<asp:ListItem Value="228">Waukegan, IL</asp:ListItem>
								<asp:ListItem Value="237">West Point, NY</asp:ListItem>
								<asp:ListItem Value="173">West Urbana, IL (Champaign)</asp:ListItem>
								<asp:ListItem Value="40">White Water River</asp:ListItem>
								<asp:ListItem Value="129">Wilmington, DE</asp:ListItem>
								<asp:ListItem Value="158">Winchester, IL</asp:ListItem>
								<asp:ListItem Value="224">Woonsocket, RI</asp:ListItem>
								<asp:ListItem Value="132">Worcester, MA</asp:ListItem>
								<asp:ListItem Value="23">Yellow Banks, IL</asp:ListItem>
							</asp:DropDownList>
</span>
                </div>
            <br />
		        <span id="Span1" style="vertical-align: top">&bull;&nbsp;Browse New Entries&nbsp;&nbsp;<asp:Button 
                ID="btnSelect5" runat="server" Text="GO" Height="25px" 
				PostBackUrl="~/NewEntries.aspx" /></span><br /><br />
        </div>
    </div>
	 <script type="text/javascript" language="javascript">
	     var html = 1;
	     var advanced = 0;

	     /*$("#xml_div").hide();*/
	     if (advanced != 1) {
	         $("#advanced").hide();
	         $("#search_flag").html("Advanced Search");
	     }
	     else {
	         $("#search_flag").html("Basic Search");
	     }


</script>
</asp:Content>
