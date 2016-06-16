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
* @date: June 8, 2016
* version:1.2
*/


namespace Game_tracker_project1
{
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetGames();
            }
        }
        protected void GetGames()
        {
            // populate the form with existing student data from the db
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            // connect to the EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                // populate a student instance with the StudentID from the URL parameter
                Game updatedGame= (from game in db.Games
                                          where game.GameID == GameID
                                    select game).FirstOrDefault();

                // map the student properties to the form controls
                if (updatedGame != null)
                {
                    GameNameTextBox.Text = updatedGame.GameName;
                    GameDescTextBox.Text = updatedGame.GameDesc;
                    TotalScoreTextBox.Text = updatedGame.TotalScore.ToString();
                    EventDateTextBox.Text = updatedGame.EventDate.ToString("yyyy-MM-dd");
                }
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //Redirect  back to Studeents page
            Response.Redirect("~/Default.aspx");
        }
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
            // Use EF to connect to the server
            using (DefaultConnection db = new DefaultConnection())
            {
                // use the Department model to create a new department object and
                // save a new record
                Game newGame = new Game();

                int GameID = 0;

                if (Request.QueryString.Count > 0)
                {
                    // get the id from url
                    GameID = Convert.ToInt32(Request.QueryString["GameID"]);

                    // get the current department from EF DB
                    newGame = (from game in db.Games
                               where game.GameID == GameID
                               select game).FirstOrDefault();
                }

                // add form data to the new department record
                newGame.GameName = GameNameTextBox.Text;
                newGame.GameDesc = GameDescTextBox.Text;
                newGame.WeekNo = this.GetWeekNo();
                newGame.EventDate = Convert.ToDateTime(EventDateTextBox.Text);
                newGame.GameWinner = "";
                newGame.TotalScore = 8;
                // use LINQ to ADO.NET to add / insert new department into the database
                // check to see if a new department is being added
                if (GameID == 0)
                {
                    db.Games.Add(newGame);
                }

                // save our changes
                db.SaveChanges();

                // Redirect back to the updated Departments page
                Response.Redirect("~/Dashboard.aspx");
            }
        }
    }
}
