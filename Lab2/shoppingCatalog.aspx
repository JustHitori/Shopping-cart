<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shoppingCatalog.aspx.cs" Inherits="Lab2.shoppingCatalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<h2>Shopping Catalog</h2>
<br />

<asp:Label ID ="Label1" runat="server" Text="Label"></asp:Label>
<br /><br />


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MWMCS %>" SelectCommand="SELECT * FROM [tblProducts]"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MWMCS %>" SelectCommand="SELECT * FROM [tblCategory]"></asp:SqlDataSource>

<asp:DataList ID="DataList2" runat="server" DataKeyField="cid" DataSourceID="SqlDataSource2">
<ItemTemplate>
<asp:LinkButton ID="LinkButton1" runat="server">
<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
</asp:LinkButton><br /><br /></ItemTemplate></asp:DataList><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

<asp:DataList ID="DataList1" runat="server" DataKeyField="pid" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"><ItemTemplate>
<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("picture") %>'
    Height="200" Width="200" />
<br />
pid: <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
<br />
name: <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
<br />
description: <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
<br />
price: <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
<br />
<br />
<asp:Button ID="btnDetails" CommandName="btnDetails" runat="server" Text="Details" />
<br />
<br />
</ItemTemplate>
</asp:DataList>
</asp:Content>