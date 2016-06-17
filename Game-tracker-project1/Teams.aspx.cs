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

namespace Game_tracker_project1
{
    public partial class Teams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if  loading page for the first time and if getting the GameID
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                //assigning the initial coloumn and the direction that needs to be sorted
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";
                this.GetTeams();
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
        protected void GetTeams()
        {
            // populate the form with existing gmae data from the db
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // query the games Table using EF and LINQ
                var Teams = (from allTeam in db.Teams
                             where allTeam.GameID == GameID
                             select allTeam);

                // bind the result to the GridView
                TeamsGridView.DataSource = Teams.AsQueryable().ToList();
                TeamsGridView.DataBind();
            }
        }
        protected void TeamsGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the coloumb to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetTeams();

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