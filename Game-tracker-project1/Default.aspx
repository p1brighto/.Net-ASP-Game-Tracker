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
                <div>
                    <asp:Button ID="ShowButton"   runat="server" OnClick="ShowButton_Click" Text="Show All" />
                </div>
            </div>
            <div class=" col-md-8">
                <h1>Games List</h1>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GameCategory" ControlStyle-Font-Bold="true" HeaderText="Game Category" SortExpression="GameCategory"/>
                        <asp:BoundField DataField="GameName" HeaderText="Name" SortExpression="GameName"/>
                        <asp:BoundField DataField="GameDesc" HeaderText="Description" Visible="true" SortExpression="GameDesc"/>
                        <asp:BoundField DataField="GameWinner" HeaderText="Winner" Visible="true" SortExpression="GameWinner"/>
                        <asp:BoundField DataField="TotalScore" HeaderText="Total Score" Visible="true" SortExpression="TotalScore"/>
                        <asp:BoundField DataField="SpectatorsNo" HeaderText="Number of Spectators" Visible="true" SortExpression="SpectatorsNo"/>
                        <asp:BoundField DataField="EventDate" HeaderText="Event date" Visible="true" SortExpression="EventDate" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:BoundField DataField="WeekNo" HeaderText="Week Number" Visible="true" SortExpression="WeekNo"/>
                        <asp:HyperLinkField ControlStyle-CssClass="btn btn-primary btn-sm" Text="Teams" HeaderText="Teams List" NavigateUrl="~/Teams.aspx.cs" 
                            DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="Teams.aspx?GameID={0}" />                   
                    </Columns>
                </asp:GridView>
            </div>  
        </div>
    </div>
</asp:Content>
