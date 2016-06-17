<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Game_tracker_project1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class=" col-md-7">
                <h1>Games List</h1>
                <a href="Games.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add Game</a>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound"  OnRowDeleting="GamesGridView_RowDeleting" OnRowCommand="GamesGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID"/>
                        <asp:ButtonField CommandName="GameID" DataTextField="GameName" HeaderText="Name" Visible="true" SortExpression="GameName"/>                     
                        <asp:BoundField DataField="GameDesc" HeaderText="Game Description" Visible="true" SortExpression="GameDesc"/>
                        <asp:BoundField DataField="GameWinner" HeaderText="Game Winner" Visible="true" SortExpression="GameWinner"/>
                        <asp:BoundField DataField="TotalScore" HeaderText="Total Score" Visible="true" SortExpression="TotalScore"/>
                        <asp:BoundField DataField="WeekNo" HeaderText="Week Number" Visible="true" SortExpression="WeekNo"/>
                        <asp:BoundField DataField="EventDate" HeaderText="Event date" Visible="true" SortExpression="EventDate" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Games.aspx.cs"
                            DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="Games.aspx?GameID={0}" 
                            ControlStyle-CssClass="btn btn-primary btn-sm"/>
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i>Delete" ShowDeleteButton="true" 
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div> 
            <div id="TeamsDiv" runat="server" visible="false" class=" col-md-3">
                <h1>Teams List</h1>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="TeamsGridView" DataKeyNames="TeamID" AutoGenerateColumns="false"
                     AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="Team ID" Visible="true"/>
                        <asp:BoundField DataField="TeamName" HeaderText="Team Name" Visible="true"/>                    
                        <asp:BoundField DataField="TeamDesc" HeaderText="Team Description" Visible="true"/>
                        <asp:BoundField DataField="TeamScore" HeaderText="Score" Visible="true"/>
                    </Columns>
                </asp:GridView>
            </div> 
        </div>
    </div>  
</asp:Content>
