using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using Game_tracker_project1.Models;
using System.Web.ModelBinding;
using System.Globalization;
/**
* @author: Brighto Paul(2003003805),Kuldeepsingh Jeewoololl(200304689)
* @date: June 15, 2016
* version:1.2
* Desc: Give the option to the user to create or edit a game and store all the details including the score to the database
*/


namespace Game_tracker_project1
{
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if  loading page for the first time and if getting the GameID
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetGames();
            }
        }
        /**
         * <summary>
         * This method pupulate the form with all the details
         * </summary>
         * 
         * @method GetGames
         * @returns {void}
         */
        protected void GetGames()
        {
            // populate the form with existing gmae data from the db
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            // connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                // populate a game instance with the GameID from the URL parameter
                Game updatedGame= (from game in db.Games
                                          where game.GameID == GameID
                                    select game).FirstOrDefault();
                Team updatedTeam1 = (from team in db.Teams
                                    where team.GameID == GameID where team.TeamNo==1
                                    select team).FirstOrDefault();
                Team updatedTeam2 = (from team in db.Teams
                                     where team.GameID == GameID
                                     where team.TeamNo == 2
                                     select team).FirstOrDefault();

                // map the game properties to the form controls
                if (updatedGame != null)
                {
                    GameCategoryDropDownList.SelectedValue = updatedGame.GameCategory;
                    GameNameTextBox.Text = updatedGame.GameName;
                    GameDescTextBox.Text = updatedGame.GameDesc;
                    EventDateTextBox.Text = updatedGame.EventDate.ToString("yyyy-MM-dd");
                    SpectatorTextBox.Text = updatedGame.SpectatorsNo.ToString();

                    Team1TextBox.Text = updatedTeam1.TeamName;
                    Team1DescTextBox.Text = updatedTeam1.TeamDesc;
                    Team1PointsTextBox.Text = updatedTeam1.TeamScore.ToString();
                    PointsAllowedTextBox.Text = updatedTeam1.TotalScoreAllowed.ToString();

                    Team2TextBox.Text = updatedTeam2.TeamName;
                    Team2DescTextBox.Text = updatedTeam2.TeamDesc;
                    Team2PointsTextBox.Text = updatedTeam2.TeamScore.ToString();
                }
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //Redirect  back to Games page
            Response.Redirect("~/GameTracker/Dashboard.aspx");
        }
        /**
        * <summary>
        * This method gets week number based on the  date provided
        * </summary>
        * 
        * @method GetWeekNo
        * @returns {int, week number}
        */
        protected int GetWeekNo()
        {
            //calculating the week number
            int weeknum = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(
            Convert.ToDateTime(EventDateTextBox.Text),
            CultureInfo.CurrentCulture.DateTimeFormat.CalendarWeekRule,
            CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek);
            weeknum--;
            //returning value
            return weeknum;
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (CustomValidator1.IsValid)
            {
                //convert scores
                int Points1 = Convert.ToInt32(Team1PointsTextBox.Text), Points2 = Convert.ToInt32(Team2PointsTextBox.Text), PointsAllowed = Convert.ToInt32(PointsAllowedTextBox.Text);

                // Use EF to connect to the server
                using (GameTrackerConnection db = new GameTrackerConnection())
                {
                    // use the Game model to create a new Games object and
                    // save a new record
                    Game newGame = new Game();
                    Team newTeam1, newTeam2;
                    newTeam1 = new Team();
                    newTeam2 = new Team();

                    int GameID = 0;

                    if (Request.QueryString.Count > 0)
                    {
                        // get the id from url
                        GameID = Convert.ToInt32(Request.QueryString["GameID"]);

                        // get the current ames from EF DB
                        newGame = (from game in db.Games
                                   where game.GameID == GameID
                                   select game).FirstOrDefault();

                        newTeam1 = (from team in db.Teams
                                    where team.GameID == GameID
                                    where team.TeamNo == 1
                                    select team).FirstOrDefault();

                        newTeam2 = (from team in db.Teams
                                    where team.GameID == GameID
                                    where team.TeamNo == 2
                                    select team).FirstOrDefault();
                    }
                    // add form data to the new Game record
                    newGame.GameCategory = GameCategoryDropDownList.SelectedValue;
                    newGame.GameName = GameNameTextBox.Text;
                    newGame.GameDesc = GameDescTextBox.Text;
                    newGame.WeekNo = this.GetWeekNo();
                    newGame.EventDate = Convert.ToDateTime(EventDateTextBox.Text);
                    newGame.SpectatorsNo = Convert.ToInt32(SpectatorTextBox.Text);
                    if (Points1 > Points2)
                    {
                        newGame.GameWinner = Team1TextBox.Text;
                    }
                    else
                    {
                        newGame.GameWinner = Team2TextBox.Text;
                    }
                    newGame.TotalScore = Points1 + Points2;

                    // add form data to the  Team1 record
                    newTeam1.TeamName = Team1TextBox.Text;
                    newTeam1.TeamDesc = Team1DescTextBox.Text;
                    newTeam1.TeamScore = Points1;
                    newTeam1.TeamNo = 1;
                    newTeam1.TotalScoreAllowed = PointsAllowed;

                    // add form data to the  Team2 record
                    newTeam2.TeamName = Team2TextBox.Text;
                    newTeam2.TeamDesc = Team2DescTextBox.Text;
                    newTeam2.TeamScore = Points2;
                    newTeam2.TeamNo = 2;
                    newTeam2.TotalScoreAllowed = PointsAllowed;
                    // use LINQ to ADO.NET to add / insert new game into the database
                    // check to see if a new game is being added
                    if (GameID == 0)
                    {
                        db.Games.Add(newGame);
                        db.Teams.Add(newTeam1);
                        db.Teams.Add(newTeam2);
                    }

                    // save our changes
                    db.SaveChanges();

                    // Redirect back to the updated Dashboard page
                    Response.Redirect("~/GameTracker/Dashboard.aspx");
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs e)
        {
            if (Convert.ToInt32(Team1PointsTextBox.Text) > Convert.ToInt32(e.Value) || Convert.ToInt32(Team2PointsTextBox.Text)> Convert.ToInt32(e.Value))
            {
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }
        }
    }
}
