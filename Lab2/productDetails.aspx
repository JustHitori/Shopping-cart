<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="Lab2.productDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Product Details Page</h1>
    <br />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br /><br />
    
    <asp:Image ID="imgProduct" runat="server" Height="200px" Width="200px" />
    <br /><br />

    <asp:Label runat="server" Text="Name: " />
    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
    <br />

    <asp:Label runat="server" Text="Description: " />
    <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
    <br />

    <asp:Label runat="server" Text="Price: " />
    <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
    <br />

    <asp:Label runat="server" Text="Quantity: " />
    <asp:TextBox ID="txtQTY" runat="server" TextMode="Number"></asp:TextBox>
    <br /><br />

    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add to Cart" />
</asp:Content>
