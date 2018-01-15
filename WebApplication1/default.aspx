<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> Welcome, peasant!! </h1>
    <asp:Repeater ID="idCategoryRepeater" runat="server" DataSourceID="idCategoryDataSource">
        <ItemTemplate>
            <div>
                <asp:Label ID="idHelperLabel" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                <div onclick='<%#Eval("Id","javascript:Redir(\"/categoryNews.aspx\",\"{0}\")") %>' style="background-color:lightseagreen;">
                    <h3 style="display:block;"><%#Eval("Name")%></h3>
                </div>
                <asp:Repeater ID="idNewsRepeater" runat="server" DataSourceID="idNewsDataSource">
                    <ItemTemplate>
                        <p><%#Eval("Title")%></p>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="idNewsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TOP 2 Title FROM News WHERE News.CategoryId = @id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idHelperLabel" Name="id" PropertyName="Text" Type="String"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <p>--------------</p>
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="idCategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Name, Id FROM [Categories]"></asp:SqlDataSource>
    <script type="text/javascript">
    function Redir(url, idparam)
    {
        window.location.href = url + "?id=" + idparam;
    }
    </script>
</asp:Content>

