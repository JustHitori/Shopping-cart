<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountSettings.aspx.cs" Inherits="Lab2.AccountSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>Account Settings</p>
    <p>Firstname:
        <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
    </p>
    <p>Lastname:
        <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
    </p>
    <p>Email Address:
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </p>

    <asp:Label runat="server" ID="lblMessage" Text="Label" ForeColor="Green" />

    <asp:SqlDataSource
    ID="SqlDataSource1"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:MWMCS %>"
    SelectCommand="SELECT * FROM [tblUsers]"
    InsertCommand="INSERT INTO [tblUsers] ([firstname], [lastname], [email], [password]) VALUES (@firstname, @lastname, @email, @password)"
    UpdateCommand="UPDATE tblUsers SET firstname = @firstname, lastname = @lastname, email = @email WHERE (UID = @UID)"
    DeleteCommand="DELETE FROM [tblUsers] WHERE [UID] = @UID">

    <DeleteParameters>
        <asp:Parameter Name="UID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="firstname" Type="String" />
        <asp:Parameter Name="lastname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter Name="firstname" Type="String" ControlID="txtFName" />
        <asp:ControlParameter Name="lastname" Type="String" ControlID="txtLName"/>
        <asp:SessionParameter Name="UID" Type="Int32" SessionField="uid" />
    </UpdateParameters>
</asp:SqlDataSource>
    <p>
        <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
    </p>
</asp:Content>

