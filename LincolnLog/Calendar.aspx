<%@ Page Title="The Lincoln Log" Language="C#" MasterPageFile="~/LincolnLog.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="LincolnLog.Calendar" EnableViewStateMac="False" EnableViewState="False" EnableSessionState="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/javascripts/jquery.js?1180447223" type="text/javascript"></script>
<%--	 <script src="javascripts/script1.js" type="text/javascript"></script>
--%>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7-vsdoc.js" type="text/javascript"></script>
    <script src="javascripts/cookie.source.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        // showView 0=theyeartable, 1=tablemonthview, 2=tabledayview
        var lastYearClicked;
        var theyear;
        var tdyear;
        $(document).ready(function () {

            $.fn.myDayFunction = function () {
                cookie.set('showView', '2', '1');
            };

            $.fn.myMonthFunction = function () {
                cookie.set('showView', '1', '1');
            };

            $.fn.myYearFunction = function () {
                cookie.set('showView', '0', '1');
            };




            switch (cookie.get('showView')) {
                case '0':
                    $('#ContentPlaceHolder1_theyeartable').show();
                    $('#ContentPlaceHolder1_yearslist').show();
                    $('#ContentPlaceHolder1_monthviewheader').hide();
                    $('#ContentPlaceHolder1_dayheader').hide();
                    $('#ContentPlaceHolder1_tabledayview').hide();
                    break;
                case '1':
                    $('#ContentPlaceHolder1_theyeartable').hide();
                    $('#ContentPlaceHolder1_yearslist').show();
                    $('#ContentPlaceHolder1_monthviewheader').show();
                    $('#ContentPlaceHolder1_dayheader').hide();
                    $('#ContentPlaceHolder1_tabledayview').hide();
                    break;
                case '2':
                    $('#ContentPlaceHolder1_theyeartable').hide();
                    $('#ContentPlaceHolder1_yearslist').hide();
                    $('#ContentPlaceHolder1_monthviewheader').hide();
                    $('#ContentPlaceHolder1_dayheader').show();
                    $('#ContentPlaceHolder1_tabledayview').show();
                    break;
                default:
                    $('#ContentPlaceHolder1_theyeartable').show();
                    $('#ContentPlaceHolder1_yearslist').show();
                    $('#ContentPlaceHolder1_monthviewheader').hide();
                    $('#ContentPlaceHolder1_dayheader').hide();
                    $('#ContentPlaceHolder1_tabledayview').hide();
                    break;
            }; /* end switch*/

            $.urlParam = function (name) {
                var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (!results) {
                    return '1800';
                }
                return results[1] || '1800';
            }
            theyear = $.urlParam('year');


            //var tdyear = $('#ContentPlaceHolder1_yearslist td');

            $('#ContentPlaceHolder1_yearslist td').each(function (index, elem) {
                tdyear = $.trim($(elem).text());

                if (tdyear == theyear) {
                    $(elem).addClass('match');
                }
                else
                {
                    $(elem).addClass('nomatch');
                }
            });
        });
   
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="main" >
    
    <div id="yearslist" runat="server">
        <table>
            <tbody>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1809">1809</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1810">1810</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1811">1811</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1812">1812</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1813">1813</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1814">1814</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1815">1815</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1816">1816</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1817">1817</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1818">1818</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1819">1819</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1820">1820</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1821">1821</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1822">1822</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1823">1823</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1824">1824</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1825">1825</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1826">1826</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1827">1827</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1828">1828</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1829">1829</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1830">1830</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1831">1831</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1832">1832</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1833">1833</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1834">1834</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1835">1835</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1836">1836</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1837">1837</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1838">1838</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1839">1839</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1840">1840</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1841">1841</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1842">1842</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1843">1843</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1844">1844</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1845">1845</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1846">1846</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1847">1847</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1848">1848</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1849">1849</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1850">1850</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1851">1851</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1852">1852</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1853">1853</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1854">1854</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1855">1855</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1856">1856</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1857">1857</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1858">1858</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1859">1859</a>
                    </td>
                </tr>
                <tr>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1860">1860</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1861">1861</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1862">1862</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1863">1863</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1864">1864</a>
                    </td>
                    <td onclick="$(this).myYearFunction();">
                        <a href="?year=1865">1865</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div><p />
        <div id="theyeardiv" runat="server" style="text-align:center; ">  
              
            <table id="theyeartable" class="yeartable" runat="server" style="text-align:center; ">
                <tr>
                    <td id="Jan" class="cell">
                        <table id="tbl01" runat="server">
                            <tr>
                                <td class="column">
                                    January
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t01" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Feb" class="cell">
                        <table id="tbl02" runat="server">
                            <tr>
                                <td class="column">
                                    February
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t02" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Mar" class="cell">
                        <table id="tbl03" runat="server">
                            <tr>
                                <td class="column">
                                    March
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t03" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Apr" class="cell">
                        <table id="tbl04" runat="server">
                            <tr>
                                <td class="column">
                                    April
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t04" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="May" class="cell">
                        <table id="tbl05" runat="server">
                            <tr>
                                <td class="column">
                                    May
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t05" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Jun" class="cell">
                        <table id="tbl06" runat="server">
                            <tr>
                                <td class="column">
                                    June
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t06" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Jul" class="cell">
                        <table id="tbl07" runat="server">
                            <tr>
                                <td class="column">
                                    July
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t07" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Aug" class="cell">
                        <table id="tbl08" runat="server">
                            <tr>
                                <td class="column">
                                    August
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t08" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="Sep" class="cell">
                        <table id="tbl09" runat="server">
                            <tr>
                                <td class="column">
                                    September
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t09" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Oct" class="cell">
                        <table id="tbl10" runat="server">
                            <tr>
                                <td class="column">
                                    October
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t10" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Nov" class="cell">
                        <table id="tbl11" runat="server">
                            <tr>
                                <td class="column">
                                    November
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t11" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="Dec" class="cell">
                        <table id="tbl12" runat="server">
                            <tr>
                                <td class="column">
                                    December
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="t12" runat="server">
                                        <tr>
                                            <td>
                                                Su
                                            </td>
                                            <td>
                                                Mo
                                            </td>
                                            <td>
                                                Tu
                                            </td>
                                            <td>
                                                We
                                            </td>
                                            <td>
                                                Th
                                            </td>
                                            <td>
                                                Fr
                                            </td>
                                            <td>
                                                Sa
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>


        <div id="allmonthview" runat="server">
        <div id="monthviewheaderdiv" runat="server">
        <table id="monthviewheader" width="100%" class="month_row" border='1' runat="server">
            <tbody>
                <tr>
                    <th>
                        <span id="Month01" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=1">Jan</a></span>&nbsp;&nbsp;
                        <span id="Month02" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=2">Feb</a></span>&nbsp;&nbsp;
                        <span id="Month03" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=3">Mar</a></span>&nbsp;&nbsp;
                        <span id="Month04" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=4">Apr</a></span>&nbsp;&nbsp;
                        <span id="Month05" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=5">May</a></span>&nbsp;&nbsp;
                        <span id="Month06" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=6">Jun</a></span>&nbsp;&nbsp;
                        <span id="Month07" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=7">Jul</a></span>&nbsp;&nbsp;
                        <span id="Month08" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=8">Aug</a></span>&nbsp;&nbsp;
                        <span id="Month09" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=9">Sep</a></span>&nbsp;&nbsp;
                        <span id="Month10" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=10">Oct</a></span>&nbsp;&nbsp;
                        <span id="Month11" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=11">Nov</a></span>&nbsp;&nbsp;
                        <span id="Month12" runat="server" style="width: 90px" class="nomatch"><a href="?year=1800&month=12">Dec</a></span>&nbsp;&nbsp;
                    </th>
                </tr>
            </tbody>
        </table>
        </div>
        <span id="monthentriesfound" runat="server"></span>
        <div id ="tablemonthview" runat="server">
        <table >
        <tr>
        <td></td></tr>
        </table></div>
        </div>
        <div id="dayheader" runat="server">
        
            <h1>
            </h1>
        </div>
        <span id="dayentriesfound" runat="server"></span>
        <div id="tabledayview" runat="server">
            <table>
                <tr>
                    <td>

                    </td>
                </tr>
            </table>
        </div>
    </div>
    
</asp:Content>
