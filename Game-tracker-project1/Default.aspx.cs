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
 * @date: June 10, 2016
 * Desc: List the the games according to the week number or date selected and display which team won or lose
 * version:1.2
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
                DateSelectorCalendar.SelectedDate = DateTime.Today;//getting the current date 
                this.PopulateDropDown();//create the drop down with 53 weeks
                this.GetWeekNo();//initialise the current week number

                //assigning the initial coloumn and the direction that needs to be sorted
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";

                // Get the games list by the current week
                DateSelectorCalendar.SelectedDate = Convert.ToDateTime("01/01/0001");//deselect the date in calender
                this.GetGames(false);//show games by week
            }
            if (Request.QueryString.Count > 0)
            {
                // get the ID from the url
                this.GetTeams(Convert.ToInt32(Request.QueryString["GameID"]));
            }

        }
        /**
        * <summary>
        * This method pupulate the Gridview with teams list
        * </summary>
        * 
        * @method GetTeams
        * @returns
        * */
        protected void GetTeams(int GameID)
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // query the games Table using EF and LINQ
                var Teams = (from allTeam in db.Teams
                             where allTeam.GameID == GameID
                             select allTeam);

                // bind the result to the GridView
                TeamsGridView.DataSource = Teams.AsQueryable().OrderBy(sortString).ToList();
                TeamsGridView.DataBind();
            }
        }

        /**
         * <summary>
         * This method pupulate the dropdownlist for the weeek number
         * </summary>
         * 
         * @method PopulateDropDown
         * @returns {void}
         */
        protected void PopulateDropDown()
        {
            for (int i=1; i<=53; i++)
            {
                WeekNoDropDownList.Items.Add(i.ToString());//adding items
            }
        }
        protected void DateSelectorCalendar_SelectionChanged(object sender, EventArgs e)
        {
            this.GetWeekNo();//initialise the selected_week match to the calender
            this.GetGames(true);//get games by date
            this.GetTeams(0);//reset the value

        }
        /**
         * <summary>
         * This method pupulate the Gridview with games list
         * The method take a boolean value
         * if its true-show the list in that date, which can be selected using calender
         * if its false-show the list in the  week,which can be selected using the dropdown
         * </summary>
         * 
         * @method GetGames
         * @returns {void}
         */
        protected void GetGames(Boolean checker)
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                //checks whether it list should list by date or week
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
        /**
        * <summary>
        * This method gets week number based on the  date selected in the calender
        * </summary>
        * 
        * @method GetWeekNo
        * @returns {void}
        */
        protected void GetWeekNo()
        {
            //getting the current date and calculating the week number
            int weeknum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
            DateSelectorCalendar.SelectedDate,
            CultureInfo.CurrentCulture.DateTimeFormat.CalendarWeekRule,
            CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek);
            weeknum--;
            //giving the value to the DropDown
            WeekNoDropDownList.SelectedValue = weeknum.ToString();
        }
        protected void GamesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();
                    //go throgh each coloumn to check which one need to sort
                    for (int i = 0; i < GamesGridView.Columns.Count; i++)
                    {
                        //check coloumn
                        if (GamesGridView.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            //check direction
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = "<i class='fa fa-caret-down fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = "<i class='fa fa-caret-up fa-lg'></i>";
                            }
                            //adding the fontawsome up or down icon to the coloumn that need to sort 
                            e.Row.Cells[i].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }

        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the coloum to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetGames(false);

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void WeekNoDropDownList_TextChanged(object sender, EventArgs e)
        {
            //shows the game list in the week selected
            this.GetGames(false);
            DateSelectorCalendar.SelectedDate= Convert.ToDateTime("01/01/0001");//deselect the date in calender
            this.GetTeams(0);//reset value
        }

        protected void TeamsGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the coloumb to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetTeams(Convert.ToInt32(Request.QueryString["GameID"]));

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void TeamsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();
                    //go throgh each coloumn to check which one need to sort
                    for (int i = 0; i < TeamsGridView.Columns.Count; i++)
                    {
                        //check coloumn
                        if (TeamsGridView.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            //check direction
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = "<i class='fa fa-caret-down fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = "<i class='fa fa-caret-up fa-lg'></i>";
                            }
                            //adding the fontawsome up or down icon to the coloumn that need to sort 
                            e.Row.Cells[i].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }
    }
}