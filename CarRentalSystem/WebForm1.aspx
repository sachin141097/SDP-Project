<%@ Page Language="C#" AutoEventWireup="true"  Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }
        table th
        {
            background-color: #B8DBFD;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%;">
        <div style="float:left; width: 70%">
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="OnSelectedIndexChanged">
            <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:TemplateField HeaderText="Country" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='abcd'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField Text="Select" CommandName="Select" />
            </Columns>
        </asp:GridView>
        <br />
        <u>Selected Row:</u>
        <br />
        <br />
        </div>
        <div style="float:right;">
        <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        ID:
                    </td>
                    <td>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        Description:
                    </td>
                    <td>
                       
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        </asp:FormView>
        </div>
    </div>
    </form>
</body>
</html>
