using System;
using System.Collections.Generic;
using System.Globalization;
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
 * @date: June 15, 2016
 * Desc: Shows all the games in the database and give the option to edit it
 * version:1.2
 */

namespace Game_tracker_project1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if  loading page for the first time populate the Games grid
            if (!IsPostBack)
            {
                //assigning the initial coloumn and the direction that needs to be sorted
                Session["SortColumn"] = "WeekNo";
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
        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the coloumb to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetGames();

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void GamesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // store which row was clicked
            int selectedRow = e.RowIndex;

            // get the selected GamesID using the Grid's DataKey Collection
            int gameID = Convert.ToInt32(GamesGridView.DataKeys[selectedRow].Values["GameID"]);

            // use EF to find the selected Game from DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                Game deletedGame = (from gameRecords in db.Games
                                     where gameRecords.GameID == gameID
                                     select gameRecords).FirstOrDefault();

                // perform the removal in the DB
                db.Games.Remove(deletedGame);
                db.SaveChanges();

                // refresh the grid
                this.GetGames();
            }
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
    }
}