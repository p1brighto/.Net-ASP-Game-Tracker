<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Game_tracker_project1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-1 col-md-8">
                <asp:Label ID="WeekNoLabel" runat="server"></asp:Label>
               <asp:Calendar runat="server" ID="DateSelector" OnSelectionChanged="DateSelector_SelectionChanged"></asp:Calendar>
            </div>
            <div class="col-md-offset-1 col-md-6">
                <h1>Games List</h1>
                <a href="Games.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add Game</a>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="GamesGridView" DataKeyNames="GameID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound"  OnRowDeleting="GamesGridView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID"/>
                        <asp:BoundField DataField="GameName" HeaderText="Game Name" Visible="true" SortExpression="GameName"/>
                        <asp:BoundField DataField="GameDesc" HeaderText="Game Description" Visible="true" SortExpression="GameName"/>
                        <asp:BoundField DataField="GameWinner" HeaderText="Game Winner" Visible="true" SortExpression="GameName"/>
                        <asp:BoundField DataField="TotalScore" HeaderText="Total Score" Visible="true" SortExpression="GameName"/>
                        <asp:BoundField DataField="EventDate" HeaderText="Event date" Visible="true" SortExpression="GameName" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Games.aspx.cs"
                            DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="Games.aspx?GameID={0}" 
                            ControlStyle-CssClass="btn btn-primary btn-sm"/>
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i>Delete" ShowDeleteButton="true" 
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div> 
        </div>
    </div>  
</asp:Content>
