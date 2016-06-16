<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="Game_tracker_project1.Games" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Games Details</h1>
                <h5>All Fields are Required</h5>
                <br />
                <div class="form-group">
                    <label class="control-label" for="GameName">Game Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameNameTextBox" placeholder="Game Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="GameDescTextBox">Game Description</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameDescTextBox" placeholder="Game Description" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Team1TextBox">Team 1</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team1TextBox" placeholder="Name of the Team-1" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Team1DescTextBox">Team 1 Description</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team1DescTextBox" placeholder="Description of the Team-1" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Team1ScoreTextBox">Team 1 Score</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team1ScoreTextBox" placeholder="Score of the Team-1" required="true"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label class="control-label" for="Team2TextBox">Team 2</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team2TextBox" placeholder="Name of the Team-2" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Team2DescTextBox">Team 2 Description</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team2DescTextBox" placeholder="Description of the Team-2" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Team2ScoreTextBox">Team 2 Score</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Team2ScoreTextBox" placeholder="Score of the Team-2" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="EventDateTextBox">Event Date</label>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="EventDateTextBox" placeholder="Event Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                        ControlToValidate="EventDateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                        Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
                </div>
                <div class="text-right">
                    <asp:Button Text="Cancel" ID="CancelButton" CssClass="btn btn-warning btn-lg" runat="server" 
                        UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                    <asp:Button Text="Save" ID="SaveButton" CssClass="btn btn-primary btn-lg" runat="server" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
