<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="Lab2.forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<style>
    body {
        background-color: #e3e3e3;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .forgot-container {
        width: 400px;
        margin: 100px auto;
        padding: 40px;
        background-color: #f0f0f0;
        border-radius: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .forgot-title {
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 25px;
        color: #333;
    }

    .input-row-column {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 20px;
    }

    .form-label {
        font-weight: bold;
        color: #444;
        margin-bottom: 6px;
        text-align: center;
        width: 100%;
    }

    .input-group {
        position: relative;
        width: 100%;
        max-width: 350px;
        margin-left: 50px;
    }

    .input-icon {
        position: absolute;
        top: 50%;
        left: 15px;
        transform: translateY(-50%);
        color: #555;
        font-size: 16px;
    }

    .input-box {
        width: 100%;
        padding: 14px 20px 14px 45px;
        border-radius: 40px;
        border: 1px solid #ccc;
        font-size: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        box-sizing: border-box;
    }

    .form-button {
        width: 100%;
        max-width: 200px;
        background-color: #000;
        color: white;
        padding: 14px;
        font-size: 16px;
        border: none;
        border-radius: 40px;
        cursor: pointer;
        margin-top: 15px;
    }

    .form-button:hover {
        background-color: #333;
    }

    .footer-text {
        margin-top: 25px;
        font-size: 14px;
        color: #333;
    }

    .footer-text a {
        font-weight: bold;
        text-decoration: none;
        color: #000;
    }

    .footer-text a:hover {
        text-decoration: underline;
    }

    .message-label {
        margin-top: 15px;
        color: green;
        font-size: 14px;
    }
</style>

<div class="forgot-container">
    <div class="forgot-title">Forgot Password</div>

    <div class="input-row-column">
        <label class="form-label" for="txtEmail">Email Address:</label>
        <div class="input-group">
            <i class="fa fa-envelope input-icon"></i>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
        </div>
    </div>

    <asp:Button ID="btnReset" runat="server" Text="Submit Password" CssClass="form-button" OnClick="btnSubmit_Click" />

    <div class="footer-text">
        <a href="login.aspx">Back to Login</a>
    </div>

    <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Text="" />
</div>

</asp:Content>
