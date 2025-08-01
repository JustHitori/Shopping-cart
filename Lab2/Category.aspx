<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Lab2.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Manage Category</h4>

    <p>
        <asp:Label ID="Lbl_Name" runat="server" Text="Name:"></asp:Label><br />
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
    </p>

    <p>
        <asp:Label ID="Lbl_Description" runat="server" Text="Description:"></asp:Label><br />
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
    </p>

    <p>
        <asp:Label ID="lblDTAdded" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="lblMessage" runat="server" Text="Label" ForeColor="Green"></asp:Label>
    </p>

    <p>
        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
    </p>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MWMCS %>"
        SelectCommand="SELECT * FROM [tblCategory]" 
        InsertCommand="INSERT INTO [tblCategory] ([name], [description], [dtadded]) VALUES (@name, @description, @dtadded)"
        UpdateCommand="UPDATE [tblCategory] SET [name] = @name, [description] = @description, [dtadded] = @dtadded WHERE [cid] = @cid"
        DeleteCommand="DELETE FROM [tblCategory] WHERE [cid] = @cid">
        
        <SelectParameters></SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="lblDTAdded" Name="dtadded" PropertyName="Text" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="lblCID" Name="cid" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="lblCID" Name="cid" PropertyName="Text" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:Label ID="lblCID" runat="server" Text="Label" Visible="false"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped"
        AutoGenerateColumns="False" 
        DataKeyNames="cid" 
        DataSourceID="SqlDataSource1" 
        Height="199px" Width="528px"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="dtadded" HeaderText="dtadded" SortExpression="dtadded" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
        </Columns>
    </asp:GridView>

</asp:Content>