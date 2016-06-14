using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using Game_tracker_project1.Models;
using System.Web.ModelBinding;
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
                Games updatedGame= (from game in db.Games1
                                          where game.GameID == GamseID
                                        select game).FirstOrDefault();

                // map the student properties to the form controls
                if (updatedGame != null)
                {
                    GameNameTextBox.Text = updatedGame.GameName;
                    GameDescTextBox.Text = updatedGame.GameDesc;
                    EnrollmentDateTextBox.Text = updatedStudent.EnrollmentDate.ToString("yyyy-MM-dd");
                }
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //Redirect  back to Studeents page
            Response.Redirect("~/Default.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {

        }
    }
}
