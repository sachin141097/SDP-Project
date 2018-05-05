<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CarRentalSystem.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <form runat="server">
        <asp:label ID="message_text" Visible="false" runat="server" CssClass="alert alert-info"></asp:label>
        <h2 class ="jumbotron">
            Welcome, <asp:Label ID="username_text" runat="server"></asp:Label>
        </h2>
           
    <div>
                <span>
                    <asp:FormView ID="FormView1" runat="server" CssClass="table table-bordered" DataSourceId="SqlDataSource1">
                        <ItemTemplate>
                        <table class="table table-hover table-striped table-bordered">
                            <tr>
                                <td> First Name : </td>
                                <td><asp:Label ID="firstnameLabel" runat="server" Text='<%# Bind("firstname") %>' /></td>
                            </tr>
                            <tr>
                                <td>Last Name : </td>
                                <td><asp:Label ID="lastnameLabel" runat="server" Text='<%# Bind("lastname") %>' /></td>
                            </tr>
                            <tr>
                                <td>Email : </td>
                                <td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></td>
                            </tr>
                            <tr>
                                <td>Mobile No : </td>
                                <td><asp:Label ID="mobilenoLabel" runat="server" Text='<%# Bind("phone") %>' /></td>
                            </tr>
                            </table>                           
                            </ItemTemplate>              
                </asp:FormView>
                </span>             
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [admin] WHERE ([email] = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="loginid" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            

            </form>
        </div>
    
</asp:Content>
