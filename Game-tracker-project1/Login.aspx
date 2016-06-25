<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Game_tracker_project1.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">    
        <div class="row">
            <div class="col-md-8"> 
                <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">
                    <asp:Label runat="server" ID="StatusLabel" />
                </div>
                <div class="login-form">
                    <h2>Enter your credentials to login</h2>
                    <label class="control-label" for="UserNameTextBox">Username:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                    <label class="control-label" for="PasswordTextBox">Password:</label>
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                    <asp:Button Text="Login" ID="LoginButton" runat="server" CssClass="btn btn-primary" OnClick="LoginButton_Click" TabIndex="0" />
                </div>
            </div>
            <div class="col-md-4">
              <h2>New Here ? </h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, libero voluptates. Cumque consectetur vel voluptate suscipit pariatur!</p>
              <p>Voluptate officia ipsa officiis vero, est tempore quas possimus nulla mollitia id, blanditiis.</p>
              <a href="/register.aspx" class="btn btn-default btn-blue">Register Now</a>
            </div>
        </div>
    </div>

</asp:Content>
