<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Game_tracker_project1.Navbar" %>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><img title="Game tracker" src="../Assets/logo.png" /></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a href="/Default.aspx"><i class="fa fa-home fa-lg"></i> Home</a></li>
                <li id="about" runat="server"><a href="/About.aspx"><i class="fa fa-gamepad fa-lg"></i> About</a></li>
                <li id="Li1" runat="server"><a href="/About.aspx"><i class="fa fa-gamepad fa-lg"></i> Contact</a></li>
                
                <asp:PlaceHolder ID="PublicPlaceHolder" runat="server">
                    <li id="login" runat="server"><a href="/Login.aspx"><i class="fa fa-sign-in fa-lg"></i> Login</a></li>
                    <li id="register" runat="server"><a href="/Register.aspx"><i class="fa fa-user-plus fa-lg"></i> Register</a></li>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="adminPlaceHolder" runat="server">
                    <li id="dashboard" runat="server"><a href="/GameTracker/Dashboard.aspx"><i class="fa fa-tachometer fa-lg"></i> Dashboard</a></li>
                    <li id="logout" runat="server"><a href="/Logout.aspx"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                </asp:PlaceHolder>
            </ul>
        </div>
    </div>
</nav>