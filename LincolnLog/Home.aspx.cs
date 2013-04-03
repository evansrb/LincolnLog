using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LincolnLog1
{
    public partial class HomePage : System.Web.UI.Page
    {
        #region Fields
        HttpCookie cookieShowView = new HttpCookie("showView");
        public TextBox pp_txtSearch
        {
            get
            {
                return txtSearch;
            }
        }
        public DropDownList pp_DayFrom
        {
            get
            {
                return DropDownAdvDayFrom;
            }
        }

        public DropDownList pp_MonthFrom
        {
            get
            {
                return DropDownAdvMonthFrom;
            }
        }

        public DropDownList pp_YearFrom
        {
            get
            {
                return DropDownAdvYearFrom;
            }
        }

        public DropDownList pp_DayTo
        {
            get
            {
                return DropDownAdvDayTo;
            }
        }

        public DropDownList pp_MonthTo
        {
            get
            {
                return DropDownAdvMonthTo;
            }
        }

        public DropDownList pp_YearTo
        {
            get
            {
                return DropDownAdvYearTo;
            }
        }
        public DropDownList pp_SearchPlace
        {
            get
            {
                return search_place;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies.Count == 0)
            {
                Response.Cookies.Add(cookieShowView);
                cookieShowView.Value = "0";
            }

        }

        protected void btnSelect3_Click(object sender, EventArgs e)
        {
            int Year = 1800;
            int Month = 1;
            int Day = 1;
            if (!string.IsNullOrEmpty(this.DropDownBasicYear.Text) && !DropDownBasicYear.Text.Contains("-"))
            {
                Year = Convert.ToInt32(DropDownBasicYear.Text);
                if (!string.IsNullOrEmpty(DropDownBasicMonth.Text) && !DropDownBasicMonth.Text.Contains("-"))
                {
                    Month = Convert.ToInt32(DropDownBasicMonth.Text);
                    if (!string.IsNullOrEmpty(DropDownBasicDay.Text) && !DropDownBasicDay.Text.Contains("-"))
                    {
                        Day = Convert.ToInt32(DropDownBasicDay.Text);
                        cookieShowView.Value = "2";
                        Response.Cookies.Add(cookieShowView);
                        //Session["calView"] = 2; // 0=year, 1=month, 2=day
                        Response.Redirect("~/Calendar.aspx?year=" + DropDownBasicYear.Text + "&month=" + DropDownBasicMonth.Text + "&day=" + DropDownBasicDay.Text);
                    }
                    else
                    {
                    }
                }
                else
                {
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(DropDownBasicMonth.Text) && !DropDownBasicMonth.Text.Contains("-"))
                {
                    Month = Convert.ToInt32(DropDownBasicMonth.Text);
                    if (!string.IsNullOrEmpty(DropDownBasicDay.Text) && !DropDownBasicDay.Text.Contains("-"))
                    {
                        Day = Convert.ToInt32(DropDownBasicDay.Text);
                        cookieShowView.Value = "2";
                        Response.Cookies.Add(cookieShowView);
                        //Session["calView"] = 2; // 0=year, 1=month, 2=day
                        Response.Redirect("~/ThisDay.aspx?month=" + DropDownBasicMonth.Text + "&day=" + DropDownBasicDay.Text);
                    }
                    else
                    {
                    }
                }
                else
                {
                }
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(DropDownBasicMonth.Text.Contains("-"))
            {
            }
        }


    }
}