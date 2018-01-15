<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editor.aspx.cs" Inherits="WebApplication1.editor.editor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="Label1" runat="server" Text="Add a new category: "></asp:Label>
     <asp:TextBox ID="idCategoryTextbox" runat="server"></asp:TextBox>
     <asp:Button ID="idAddCategoryButton" runat="server" OnClick="idAddCategoryButton_Click" Text="Add category" />
     <br />
     <asp:Label ID="error" runat="server"></asp:Label>
     &nbsp;<br />
     <asp:Label ID="Label2" runat="server" Text="Add news"></asp:Label>
     <br />
     <br />
     <asp:Label ID="Label3" runat="server" Text="Title: "></asp:Label>
     <asp:TextBox ID="idTitleTextBox" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="idTitleValidator" runat="server" ControlToValidate="idTitleTextBox" ErrorMessage="Complete the title!"></asp:RequiredFieldValidator>
     <br />
     <asp:Label ID="Label4" runat="server" Text="Category: "></asp:Label>
     <asp:DropDownList ID="idDropCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
         <asp:ListItem Selected="True" Value="Select">Select</asp:ListItem>
     </asp:DropDownList>
     <asp:RequiredFieldValidator ID="idCategoryValidator" runat="server" ControlToValidate="idDropCategory" ErrorMessage="Select a category!" InitialValue="Select"></asp:RequiredFieldValidator>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Name] FROM [Categories]"></asp:SqlDataSource>
     <asp:Button ID="idAddNews" runat="server" OnClick="idAddNews_Click" Text="Add news" />
     <br />
</asp:Content>
