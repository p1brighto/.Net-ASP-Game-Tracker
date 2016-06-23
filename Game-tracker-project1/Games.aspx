<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="Game_tracker_project1.Games" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-align">
                            <h1>Games Details</h1>
                            <h5>All Fields are Required</h5>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="GameCategory">Select the Game Category</label>
                            <asp:DropDownList CssClass="form-control" ID="GameCategoryDropDownList" DataValueField="asca" runat="server">
                                <asp:ListItem Text="Football" Value="Football" />
                                <asp:ListItem Text="Cricket" Value="Cricket" />
                                <asp:ListItem Text="Online Games" Value="Online Games" />
                                <asp:ListItem Text="Baseball" Value="Baseball" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="GameName">Game Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="GameNameTextBox" placeholder="Game Name" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="GameDescTextBox">Game Description</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="GameDescTextBox" placeholder="Game Description" required="true"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="Team1TextBox">Team 1</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team1TextBox" placeholder="Name of the Team-1" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="Team1DescTextBox">Team 1 Description</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team1DescTextBox" placeholder="Description of the Team-1" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="Team1PointsTextBox">Team 1 Points</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team1PointsTextBox" placeholder="Points of the Team-1" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" ControlToValidate="Team1PointsTextBox" ValidationExpression="\d+" runat="server" ErrorMessage="Only Numbers allowed!" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="Team2TextBox">Team 2</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team2TextBox" placeholder="Name of the Team-2" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="Team2DescTextBox">Team 2 Description </label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team2DescTextBox" placeholder="Description of the Team-2" required="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="Team2PointsTextBox">Team 2 Points </label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Team2PointsTextBox" placeholder="Points of the Team-2" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" ControlToValidate="Team2PointsTextBox" ValidationExpression="\d+" runat="server" ErrorMessage="Only Numbers allowed!" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CompareValidator Display="Dynamic" ID="CompareValidator1" ControlToValidate="Team2PointsTextBox" ControlToCompare="Team1PointsTextBox" Operator="NotEqual" runat="server" ForeColor="Red" ErrorMessage="Cannot be a draw match! (Team-1 points & Team-2 points cannot be the same!)"></asp:CompareValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label" for="SpectatorTextBox">Number of Spectators </label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="SpectatorTextBox" placeholder="Number of Spectators" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ControlToValidate="SpectatorTextBox" ValidationExpression="\d+" runat="server" ErrorMessage="Only Numbers allowed!" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="PointsAllowedTextBox">Total Pointss allowed </label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="PointsAllowedTextBox" placeholder="Total Pointss allowed" required="true"></asp:TextBox>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ControlToValidate="PointsAllowedTextBox" ValidationExpression="\d+" runat="server" ErrorMessage="Only Numbers allowed!" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" SetFocusOnError="true" runat="server" ForeColor="Red" ControlToValidate="PointsAllowedTextBox" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic" ErrorMessage="Individual points cannot exceed Total pionts!"></asp:CustomValidator>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="EventDateTextBox">Event Date</label>
                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="EventDateTextBox" placeholder="Event Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                                ControlToValidate="EventDateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                                Type="Date" Display="Dynamic" ForeColor="Red" Font-Size="Medium"></asp:RangeValidator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-offset-3 col-md-6">
                        <div class="text-right">
                            <asp:Button Text="Cancel" ID="CancelButton" CssClass="btn btn-warning btn-lg" runat="server"
                                UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                            <asp:Button Text="Save" ID="SaveButton" CssClass="btn btn-primary btn-lg" runat="server" OnClick="SaveButton_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
