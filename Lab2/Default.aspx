<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="logo-container">
    <img src="images/logo.png" alt="Logo" class="logo-image" />
</div>

    <style>
        .logo-container {
            position: absolute;
            top: 1px;
            left: 20px;
        }

        .logo-image {
            height: 50px;
        }

        body {
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .hero-section {
            text-align: center;
            padding: 60px 20px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
            margin-bottom: 40px;
            border-radius: 20px;
        }

        .hero-section h1 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .hero-section p {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
        }

        .btn-primary, .btn-default {
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 16px;
            text-decoration: none;
            margin: 5px;
            display: inline-block;
        }

        .btn-primary {
            background-color: #000;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #333;
        }

        .btn-default {
            background-color: #e3e3e3;
            color: #333;
        }

        .btn-default:hover {
            background-color: #ccc;
        }

        .action-links {
            margin-top: 20px;
        }

        .action-links a, .action-links button {
            margin: 5px;
        }

        .features-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            text-align: center;
        }

        .feature-card {
            background-color: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            width: 300px;
            transition: transform 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-card h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .feature-card p {
            color: #555;
            font-size: 15px;
            margin-bottom: 15px;
        }
    </style>
    
    <div class="logo-container">
        <img src="images/logo.png" alt="Logo" class="logo-image" />
    </div>

    <div class="hero-section">
        <h1>
            <asp:Label runat="server" Text="Welcome!" ID="lblName"></asp:Label>
        </h1>
        <p>Discover amazing deals and shop your favorite products today!</p>
        
        <div class="action-links">
            <asp:HyperLink runat="server" ID="HReg" NavigateUrl="~/registration.aspx" CssClass="btn-default">Register</asp:HyperLink>
            <asp:HyperLink runat="server" ID="HLogin" NavigateUrl="~/login.aspx" CssClass="btn-default">Login</asp:HyperLink>
            <asp:LinkButton ID="HLogout" runat="server" OnClick="HLogout_Click" CssClass="btn-default">Logout</asp:LinkButton>
            <asp:LinkButton ID="HSettings" runat="server" OnClick="HSettings_Click" CssClass="btn-default">Account Settings</asp:LinkButton>
        </div>
    </div>

    <div class="features-section">
        <div class="feature-card">
            <h3>Fast Delivery</h3>
            <p>We deliver your products to your doorstep in record time.</p>
        </div>
        <div class="feature-card">
            <h3>Best Prices</h3>
            <p>Enjoy unbeatable deals and discounts across all categories.</p>
        </div>
        <div class="feature-card">
            <h3>24/7 Support</h3>
            <p>Our team is ready to assist you anytime, anywhere.</p>
        </div>
    </div>

</asp:Content>
