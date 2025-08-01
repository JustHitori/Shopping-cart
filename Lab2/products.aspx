<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Lab2.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Manage Products</h4>
    <br />
    <p>
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </p>

    <p>
        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    </p>

    <p>
        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    </p>

    <p>
        <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="cid" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        <asp:Label ID="lblCID" runat="server" Text="Label"></asp:Label>
    </p>

    <p>
        <asp:Label ID="lblPictureLabel" runat="server" Text="Picture"></asp:Label>
        <asp:FileUpload ID="fuPicture" runat="server" />
    </p>

    <p>
        <asp:Label ID="lblDTadded" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblPicture" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="lblPID" runat="server" Text="Label"></asp:Label>
    </p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pid" HeaderText="PID" ReadOnly="True" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="picture" HeaderText="Picture" />
            <asp:BoundField DataField="cid" HeaderText="CID" />
            <asp:BoundField DataField="dtadded" HeaderText="Date Added" />
        </Columns>
    </asp:GridView>

    <p>
        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
    </p>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:MWMCS  %>" 
    SelectCommand="SELECT * FROM [tblCategory]" 
    InsertCommand="INSERT INTO [tblCategory] ([name], [description], [dtadded]) VALUES (@name, @description, @dtadded)" 
    UpdateCommand="UPDATE [tblCategory] SET [name] = @name, [description] = @description, [dtadded] = @dtadded WHERE [cid] = @cid" 
    DeleteCommand="DELETE FROM [tblCategory] WHERE [cid] = @cid" >

    <DeleteParameters>
        <asp:Parameter Name="cid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="dtadded" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="dtadded" Type="DateTime" />
        <asp:Parameter Name="cid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MWMCS %>" 
        SelectCommand="SELECT * FROM [tblProducts]"
        InsertCommand="INSERT INTO [tblProducts] ([name], [description], [price], [picture], [cid], [dtadded]) VALUES (@name, @description, @price, @picture, @cid, @dtadded)"
        UpdateCommand="UPDATE [tblProducts] SET [name]=@name, [description]=@description, [price]=@price, [picture]=@picture, [cid]=@cid, [dtadded]=@dtadded WHERE [pid]=@pid"
        DeleteCommand="DELETE FROM [tblProducts] WHERE [pid]=@pid">

        <DeleteParameters>
            <asp:ControlParameter Name="pid" ControlID="lblPID" PropertyName="Text" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:ControlParameter Name="name" ControlID="txtName" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="description" ControlID="txtDescription" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="price" ControlID="txtPrice" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter Name="picture" ControlID="lblPicture" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="cid" ControlID="DropDownList1" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter Name="dtadded" ControlID="lblDTadded" PropertyName="Text" Type="DateTime" />
        </InsertParameters>

        <UpdateParameters>
            <asp:ControlParameter Name="name" ControlID="txtName" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="description" ControlID="txtDescription" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="price" ControlID="txtPrice" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter Name="picture" ControlID="lblPicture" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="cid" ControlID="lblCID" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter Name="dtadded" ControlID="lblDTadded" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter Name="pid" ControlID="lblPID" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
