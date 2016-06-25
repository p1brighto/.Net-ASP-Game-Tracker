<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Game_tracker_project1.Dashboard" %>
<asp:Content ID="Content2" cssClass="section" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

    </div>
    <div class="container">
        <div class="row">
            <div class=" col-md-9">
                <h2>Games of the day</h2>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GameCategory" ControlStyle-Font-Bold="true" HeaderText="Game Category" SortExpression="GameCategory"/>
                        <asp:BoundField DataField="GameName" HeaderText="Name" SortExpression="GameName"/>
                        <asp:BoundField DataField="GameWinner" HeaderText="Winner" Visible="true" SortExpression="GameWinner"/>
                        <asp:BoundField DataField="TotalScore" HeaderText="Score" Visible="true" SortExpression="TotalScore"/>
                        <asp:BoundField DataField="SpectatorsNo" HeaderText="Spectators" Visible="true" SortExpression="SpectatorsNo"/>
                        <asp:BoundField DataField="EventDate" HeaderText="Date" Visible="true" SortExpression="EventDate" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:HyperLinkField ControlStyle-CssClass="btn btn-primary btn-sm" Text="Learn More" HeaderText="Teams List" NavigateUrl="~/Teams.aspx.cs" 
                            DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="Teams.aspx?GameID={0}" />                   
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-3">
                <asp:Calendar ID="DateSelectorCalendar" OnSelectionChanged="DateSelectorCalendar_SelectionChanged" runat="server"></asp:Calendar>
                <div class="row">
                    <div class="col-md-6 text-right">                      
                        <h4>Week :</h4>
                    </div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="WeekNoDropDownList" AutoPostBack="true" CssClass="btn btn-default btn-sm dropdown-toogle" OnTextChanged="WeekNoDropDownList_TextChanged" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
            </div> 
        </div>
    </div>

    <section id="brief-intro" class="section bg-blue border-top border-bottom white-text">
        <div class="container">

          <div class="row">
            <div class="col-md-6">        
              <img src="img/survey-mockup.png" alt="" title="" class="img-responsive hidden-xs hidden-sm">
            </div>
            <div class="col-md-6">
              <div class="row">
                <div class="col-md-12 margintop-50">
                  <h2>Intuitive - Simple - Fabulous</h2>
                  <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</p>
                </div>            
              </div>
              <div class="row">
                <div class="col-sm-6">
                  <i class="font-icon ion-ios-paper-outline"></i>
                  <h5>Clean &amp; Minimalistic</h5>
                  <p> There’s a lot more to simple design than you think.</p>
                </div>
                <div class="col-sm-6">
                  <i class="font-icon ion-ios-loop"></i>
                  <h5>Easy to customize</h5>
                  <p> Get fast and easy access to the features you use most in our menu.</p>
                </div>
              </div>
            </div>
        
          </div>
      
        </div>
      </section>

</asp:Content>
