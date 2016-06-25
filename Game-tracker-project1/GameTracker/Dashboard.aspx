<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Game_tracker_project1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Games List</h2>
            </div>
            <div class="col-md-6 text-right">
                <a href="/GameTracker/Games.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add Game</a>
            </div>
        </div>
        <div class="row">
            <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                    AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound"  OnRowDeleting="GamesGridView_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID"/>
                    <asp:BoundField DataField="GameCategory" HeaderStyle-Font-Bold="true" HeaderText="Category" SortExpression="GameCategory"/>
                    <asp:BoundField DataField="GameName" HeaderText="Name" SortExpression="GameName"/>
                    <asp:BoundField DataField="GameDesc" HeaderText="Description" Visible="true" SortExpression="GameDesc"/>
                    <asp:BoundField DataField="GameWinner" HeaderText="Winner" Visible="true" SortExpression="GameWinner"/>
                    <asp:BoundField DataField="TotalScore" HeaderText="Score" Visible="true" SortExpression="TotalScore"/>
                    <asp:BoundField DataField="SpectatorsNo" HeaderText="Spectators" Visible="true" SortExpression="SpectatorsNo"/>
                    <asp:BoundField DataField="WeekNo" HeaderText="Week Number" Visible="true" SortExpression="WeekNo"/>
                    <asp:BoundField DataField="EventDate" HeaderText="Date" Visible="true" SortExpression="EventDate" DataFormatString="{0:MMM dd, yyyy}"/>
                    <asp:HyperLinkField ControlStyle-CssClass="btn btn-primary btn-sm" Text="Teams" HeaderText="Teams List" NavigateUrl="../Teams.aspx.cs" 
                        DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="../Teams.aspx?GameID={0}" />                     
                    <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/GameTracker/Games.aspx.cs"
                        DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="Games.aspx?GameID={0}" 
                        ControlStyle-CssClass="btn btn-primary btn-sm"/>
                    <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i>Delete" ShowDeleteButton="true" 
                        ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm"/>
                </Columns>
            </asp:GridView>
        </div> 
    </div>  
</asp:Content>
