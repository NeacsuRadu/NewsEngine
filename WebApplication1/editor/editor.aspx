<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editor.aspx.cs" Inherits="WebApplication1.editor.editor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="Label1" runat="server" Text="Add a new category: "></asp:Label>
     <asp:TextBox ID="idCategoryTextbox" runat="server"></asp:TextBox>
     <asp:Button ID="idAddCategoryButton" runat="server" OnClick="idAddCategoryButton_Click" Text="Add category" />
     <br />
     <asp:Label ID="error" runat="server"></asp:Label>
     <br />
</asp:Content>
