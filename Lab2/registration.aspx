<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Lab2.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

<style>
    body {
        background-color: #e3e3e3;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-label1{
        font-weight: bold;
        color: #444;
        margin-bottom: 6px;
        text-align: center;
        width: 100%;
        margin-right: 175px;
    }
    .form-label2{
        font-weight: bold;
        color: #444;
        margin-bottom: 6px;
        text-align: center;
        width: 100%;
        margin-right: 210px;
    }
    .form-label3{
        font-weight: bold;
        color: #444;
        margin-bottom: 6px;
        text-align: center;
        width: 100%;
        margin-right: 142px;
    }

    .register-container {
        width: 500px;
        margin: 70px auto;
        padding: 40px;
        background-color: #f0f0f0;
        border-radius: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .register-title {
        font-size: 26px;
        font-weight: 600;
        margin-bottom: 25px;
        color: #333;
    }

    .input-row-column {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 18px;
    }

    .form-label {
        font-weight: bold;
        color: #444;
        margin-bottom: 6px;
        text-align: center;
        width: 100%;
        margin-right: 200px;
    }

    .input-group {
        position: relative;
        width: 100%;
        max-width: 400px;
        margin-left: 120px;
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
        border: none;
        font-size: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        box-sizing: border-box;
    }

    .button-row {
        display: flex;
        gap: 10px;
        margin-top: 20px;
        justify-content: center;
    }

    .form-button {
        flex: 1;
        max-width: 180px;
        background-color: #000;
        color: white;
        padding: 14px;
        font-size: 16px;
        border: none;
        border-radius: 40px;
        cursor: pointer;
    }

    .form-button:hover {
        background-color: #333;
    }

    .message-label {
        margin-top: 20px;
        font-size: 16px;
        display: block;
        color: green;
        text-align: center;
    }
</style>

<div class="register-container">
    <div class="register-title">User Registration</div>

    <div class="input-row-column">
        <label class="form-label" for="txtFName">First Name:</label>
        <div class="input-group">
            <i class="fa fa-user input-icon"></i>
            <asp:TextBox ID="txtFName" runat="server" CssClass="input-box" placeholder="First Name"></asp:TextBox>
        </div>
    </div>

    <div class="input-row-column">
        <label class="form-label" for="txtLName">Last Name:</label>
        <div class="input-group">
            <i class="fa fa-user input-icon"></i>
            <asp:TextBox ID="txtLName" runat="server" CssClass="input-box" placeholder="Last Name"></asp:TextBox>
        </div>
    </div>

    <div class="input-row-column">
        <label class="form-label1" for="txtEmail">Email Address:</label>
        <div class="input-group">
            <i class="fa fa-envelope input-icon"></i>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Email Address"></asp:TextBox>
        </div>
    </div>

    <div class="input-row-column">
        <label class="form-label2" for="txtPassword">Password:</label>
        <div class="input-group">
            <i class="fa fa-lock input-icon"></i>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Password"></asp:TextBox>
        </div>
    </div>

    <div class="input-row-column">
        <label class="form-label3" for="txtConfirmPass">Confirm Password:</label>
        <div class="input-group">
            <i class="fa fa-lock input-icon"></i>
            <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="input-box" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
        </div>
    </div>

    <div class="button-row">
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="form-button" OnClick="btnBack_Click" />
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-button" OnClick="btnRegister_Click" />
    </div>

    <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Text="" />
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:MWMCS %>"
    DeleteCommand="DELETE FROM [tblUsers] WHERE [UID] = @UID"
    InsertCommand="INSERT INTO [tblUsers] ([firstname], [lastname], [email], [password]) VALUES (@firstname, @lastname, @email, @password)"
    SelectCommand="SELECT * FROM [tblUsers]"
    UpdateCommand="UPDATE [tblUsers] SET [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [password] = @password WHERE [UID] = @UID">

    <DeleteParameters>
        <asp:Parameter Name="UID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter Name="firstname" ControlID="txtFName" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="lastname" ControlID="txtLName" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="email" ControlID="txtEmail" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="password" ControlID="txtPassword" PropertyName="Text" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="firstname" Type="String" />
        <asp:Parameter Name="lastname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="UID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
