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
 * @date: June 8, 2016
 * version:1.0
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
                // query the departments Table using EF and LINQ
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

            // get the selected DepartmentID using the Grid's DataKey Collection
            int gameID = Convert.ToInt32(GamesGridView.DataKeys[selectedRow].Values["GameID"]);

            // use EF to find the selected department from DB and remove it
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
    }
}