<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Game_tracker_project1.Dashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h4>Show by Week Number</h4>
                    <asp:DropDownList ID="WeekNoDropDownList" AutoPostBack="true" CssClass="btn btn-default btn-sm dropdown-toogle" OnTextChanged="WeekNoDropDownList_TextChanged" runat="server">
                    </asp:DropDownList>
                <h4>Show by date</h4>
                    <asp:Calendar ID="DateSelectorCalendar" OnSelectionChanged="DateSelectorCalendar_SelectionChanged" runat="server"></asp:Calendar>
            </div>
            <div class=" col-md-5">
                <h1>Games List</h1>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound" OnRowCommand="GamesGridView_RowCommand">
                    <Columns>
                        <asp:ButtonField CommandName="GameID"  DataTextField="GameName" HeaderText="Name" SortExpression="GameName"/>
                        <asp:BoundField DataField="GameDesc" HeaderText="Description" Visible="true" SortExpression="GameDesc"/>
                        <asp:BoundField DataField="GameWinner" HeaderText="Winner" Visible="true" SortExpression="GameWinner"/>
                        <asp:BoundField DataField="TotalScore" HeaderText="Total Score" Visible="true" SortExpression="TotalScore"/>
                        <asp:BoundField DataField="EventDate" HeaderText="Event date" Visible="true" SortExpression="EventDate" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:BoundField DataField="WeekNo" HeaderText="Week Number" Visible="true" SortExpression="WeekNo"/>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="TeamsDiv" visible="false" runat="server" class=" col-md-3" >
                <h1>Teams List</h1>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="TeamsGridView" DataKeyNames="TeamID" AutoGenerateColumns="false"
                     AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderStyle-BackColor="Red" HeaderText="Team ID" Visible="false"/>
                        <asp:BoundField DataField="TeamName" HeaderStyle-BackColor="Red" HeaderText="Team Name" Visible="true"  />                    
                        <asp:BoundField DataField="TeamDesc" HeaderStyle-BackColor="Red" HeaderText="Team Description" Visible="true"/>
                        <asp:BoundField DataField="TeamScore" HeaderStyle-BackColor="Red" HeaderText="Score" Visible="true"/>
                    </Columns>
                </asp:GridView>
            </div>  
        </div>
    </div>
</asp:Content>
