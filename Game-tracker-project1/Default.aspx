<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Game_tracker_project1.Dashboard" %>
<asp:Content ID="Content2" cssClass="section" ContentPlaceHolderID="MainContent" runat="server">

    <section id="top-banner" class="bg-intro">
        <div class="container">
          <div class="row banner-content">
            <div class="col-md-6">
                <h2>Welcome To Game Tracker</h2>
                <p>Cras ultricies ligula sed magna dictum porta. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Sed porttitor lectus nibh. Pellentesque in ipsum id orci porta dapibus. Curabitur aliquet quam id dui posuere blandit. </p>
                <ul>
                    <li><i class="fa fa-check"></i> Track your teams's score</li>
                    <li><i class="fa fa-check"></i> Instantly update scores</li>
                    <li><i class="fa fa-check"></i> Get your own profile banner</li>
                    <li><i class="fa fa-check"></i> Create as many games as you want</li>
                </ul>
                <div class="buttons-group">
                  <a href="/Register.aspx" class="btn btn-default btn-blue">Get Started</a>
                  <a href="#how-it-works" class="btn btn-lg btn-intro btn-primary">Learn More</a>
                </div>
            </div>
            <div class="col-md-6">
                <iframe src="https://www.youtube.com/embed/OCWj5xgu5Ng" frameborder="0" allowfullscreen></iframe>
            </div>
      
          </div>
        </div>
    </section>
    <div class="container">
        <div class="row">
            <div class=" col-md-9">
                <div class="row">
                    <div class="col-md-9 text-left">
                        <h2 runat="server" id="GameH2">Games of the week selected</h2>
                    </div>
                    <div class="col-md-3">
                        <span class="week">Show by Week :</span>
                        <asp:DropDownList ID="WeekNoDropDownList" AutoPostBack="true" CssClass="btn btn-default btn-sm dropdown-toogle" OnTextChanged="WeekNoDropDownList_TextChanged" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
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
                <span class="date">Show by Date :</span>
                <asp:Calendar ID="DateSelectorCalendar" OnSelectionChanged="DateSelectorCalendar_SelectionChanged" runat="server"></asp:Calendar>
            </div> 
        </div>
    </div>

</asp:Content>
