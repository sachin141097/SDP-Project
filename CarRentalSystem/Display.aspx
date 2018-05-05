<%@ Page Title="" Language="C#" MasterPageFile="~/Parent.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="CarRentalSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ListView ID="ListView1" runat="server"
        ItemType="CarRentalSystem.Cardetail"
        GroupItemCount="3"
        HorizontalAlign="center">


        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>

        <ItemTemplate>
            <td runat="server" style="">city:
                <asp:Label ID="carLabel" runat="server" Text='<%# Item.model %>' />
                <br />
                    <asp:Image ID="picImg" runat="server" Height="400px" Width="500px" ImageUrl='<%# Item.carimage %>' /></a>
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">city:
                <asp:Label ID="carLabel" runat="server" Text='<%# Item.model %>' />
                <br />
                    <asp:Image ID="picImg" runat="server" Height="300px" Width="400px" ImageUrl='<%# Item.carimage %>' /></a>
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    </asp:Content>

