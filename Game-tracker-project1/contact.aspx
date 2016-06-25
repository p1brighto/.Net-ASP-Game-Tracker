<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Game_tracker_project1.contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
      <div class="row">          
          <div class="col-md-8">            
            <div class="login-form">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Your Name:" required="">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="yourname@youremail.com" required="">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your contact number" required="">
                </div>
                <div class="form-group">
                    <label for="message">Message:</label>
                    <textarea class="form-control" id="message" name="message" rows="5" placeholder="Enter Your Message Here..." required=""></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-blue">Send</button>
            </div>
          </div>
        </div>
    </div>
</asp:Content>
