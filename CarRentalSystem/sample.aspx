<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="CarRentalSystem.sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT did FROM chauffer  WHERE did NOT IN(SELECT did FROM carstatus AS cs WHERE ((@sdate &gt;= cs.startdate) AND (@sdate &lt;= cs.enddate)) OR ((@edate &gt;= cs.startdate) AND (@edate &lt;= cs.enddate)) )">
            <SelectParameters>
                <asp:SessionParameter Name="sdate" SessionField="startdate" />
                <asp:SessionParameter Name="edate" SessionField="enddate" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
