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
            DateSelector.SelectedDate = DateTime.Today;//initial date 
            this.GetWeekNo();

            //if  loading page for the first time populate the Games grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GameName";
                Session["SortDirection"] = "ASC";
                // Get the games list
                this.GetGames();
            }
        }
        protected void GetGames()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // query the games Table using EF and LINQ
                var Games = (from allGames in db.Games
                             select allGames);

                // bind the result to the GridView
                GamesGridView.DataSource = Games.AsQueryable().OrderBy(sortString).ToList();
                GamesGridView.DataBind();
            }
        }
        protected void DateSelector_SelectionChanged(object sender, EventArgs e)
        {
            this.GetWeekNo();
            this.GetGames();
        }

        protected void GamesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
    }
}