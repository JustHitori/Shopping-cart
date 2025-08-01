<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Lab2.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #e3e3e3;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-container {
            width: 400px;
            margin: 80px auto;
            padding: 40px;
            background-color: #f0f0f0;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            text-align: center;
        }                                      

        .login-title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
            width: 100%;
            margin-left: 20px; 

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
            padding: 15px 20px 15px 45px;
            border: none;
            border-radius: 40px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            font-size: 16px;
        }

        .checkbox-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            font-size: 14px;
            color: #555;
        }

        .checkbox-row label {
            margin-left: 6px;
        }

        .sign-in-btn {
            width: 100%;
            padding: 14px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 40px;
            font-size: 16px;
            cursor: pointer;
        }

        .sign-in-btn:hover {
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
    </style>

    <div class="login-container">
        <div class="login-title">Login</div>

        <div class="input-group">
            <i class="fa fa-envelope input-icon"></i>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Email or Username"></asp:TextBox>
        </div>

        <div class="input-group">
            <i class="fa fa-lock input-icon"></i>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Password"></asp:TextBox>
        </div>

        <div class="checkbox-row">
            <div>
                <asp:CheckBox ID="chkRemember" runat="server" />
                <label for="chkRemember">Remember me</label>
            </div>
            <div>
                <a href="forgotpassword.aspx">Forgot password</a>
            </div>
        </div>

        <asp:Button ID="btnLogin" runat="server" CssClass="sign-in-btn" Text="Sign In" OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" CssClass="footer-text" ForeColor="Red" Text=""></asp:Label>

        <div class="footer-text">
            Don’t have an account? <a href="registration.aspx">Sign Up</a>
        </div>
    </div>

</asp:Content>
