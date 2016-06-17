<%@ Page Title="Teams" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="Game_tracker_project1.Teams" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="container">
            <div id="TeamsDiv" class=" col-md-6">
                <h1>Teams List</h1>
                <asp:GridView runat="server"  CssClass="table table-bordered table-striped table-hover" ID="TeamsGridView" DataKeyNames="TeamID" AutoGenerateColumns="false"
                     AllowSorting="true" OnSorting="TeamsGridView_Sorting" OnRowDataBound="TeamsGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="Team ID" Visible="true" SortExpression="TeamID"/>
                        <asp:BoundField DataField="TeamName" HeaderText="Team Name" Visible="true" SortExpression="TeamName"/>                    
                        <asp:BoundField DataField="TeamDesc" HeaderText="Team Description" Visible="true" SortExpression="TeamDesc"/>
                        <asp:BoundField DataField="TeamScore" HeaderText="Score" Visible="true" SortExpression="TeamScore"/>
                    </Columns>
                </asp:GridView>
            </div> 
        </div>
    </div>
</asp:Content>
