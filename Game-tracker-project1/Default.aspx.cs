using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// using statements that are required to connect to EF DB
using Game_tracker_project1.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;
using System.Globalization;

/**
 * @author: Brighto Paul(2003003805),Kuldeepsingh Jeewoololl(200304689)
 * @date: June 8, 2016
 * version:1.0
 */

namespace Game_tracker_project1
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if  loading page for the first time populate the Games grid
            if (!IsPostBack)
            {
                DateSelectorCalendar.SelectedDate = DateTime.Today;//initial date 
                this.PopulateDropDown();//create the drop down with 53 weeks
                this.GetWeekNo();

                Session["SortColumn"] = "GameName";
                Session["SortDirection"] = "ASC";

                // Get the games list by the current week
                DateSelectorCalendar.SelectedDate = Convert.ToDateTime("01/01/0001");
                this.GetGames(false);
            }
        }
        protected void PopulateDropDown()
        {
            for (int i=1; i<=53; i++)
            {
                WeekNoDropDownList.Items.Add(i.ToString());
            }
        }
        protected void DateSelectorCalendar_SelectionChanged(object sender, EventArgs e)
        {
            this.GetWeekNo();
            this.GetGames(true);
        }
        protected void GetGames(Boolean checker)
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                /**
                 * true-show the games list by the date
                 * false-shows the games by weekNumber
                 */
                if (checker)
                {
                    // query the games Table using EF and LINQ
                    var Games = (from allGames in db.Games
                                 where allGames.EventDate == DateSelectorCalendar.SelectedDate
                                 select allGames);

                    // bind the result to the GridView
                    GamesGridView.DataSource = Games.AsQueryable().OrderBy(sortString).ToList();
                    GamesGridView.DataBind();
                }
                else
                {
                    int weekNo = Convert.ToInt32(WeekNoDropDownList.SelectedValue);//converting the selected week number to the int

                    // query the games Table using EF and LINQ
                    var Games = (from allGames in db.Games
                                 where allGames.WeekNo == weekNo
                                 select allGames);

                    // bind the result to the GridView
                    GamesGridView.DataSource = Games.AsQueryable().OrderBy(sortString).ToList();
                    GamesGridView.DataBind();
                }
            }
        }
        protected void GetWeekNo()
        {
            //getting the current date and calculating the week number
            int weeknum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
            DateSelectorCalendar.SelectedDate,
            CultureInfo.CurrentCulture.DateTimeFormat.CalendarWeekRule,
            CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek);
            //giving the value to the DropDown
            weeknum--;
            WeekNoDropDownList.SelectedValue = weeknum.ToString();
        }
        protected void GamesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int i = 0; i < GamesGridView.Columns.Count; i++)
                    {
                        if (GamesGridView.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = "<i class='fa fa-caret-down fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = "<i class='fa fa-caret-up fa-lg'></i>";
                            }
                            e.Row.Cells[i].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }

        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the coloumb to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetGames(false);

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void WeekNoDropDownList_TextChanged(object sender, EventArgs e)
        {
            this.GetGames(false);
            DateSelectorCalendar.SelectedDate= Convert.ToDateTime("01/01/0001");
        }
    }
}