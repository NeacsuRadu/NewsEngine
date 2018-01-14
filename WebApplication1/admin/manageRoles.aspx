<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageRoles.aspx.cs" Inherits="WebApplication1.admin.manageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome, my lord, to the user management page</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Users.UserName, Roles.RoleName FROM Roles INNER JOIN UsersInRoles ON Roles.RoleId = UsersInRoles.RoleId INNER JOIN Users ON UsersInRoles.UserId = Users.UserId"></asp:SqlDataSource>

    <h2>Change users' roles<asp:Label ID="Label1" runat="server" Text="User: "></asp:Label>
&nbsp;<asp:TextBox ID="idUsernameTextbox" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Role:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="RoleName" DataValueField="RoleId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [RoleId], [RoleName] FROM [Roles]"></asp:SqlDataSource>
        <asp:Button ID="idButtonUpdate" runat="server" OnClick="idButtonUpdate_Click" Text="Update user" />
        <asp:Label ID="idErrorLabelUpdate" runat="server" Text="Label" Visible="False"></asp:Label>
    </h2>
</asp:Content>
