<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewowner.aspx.cs" Inherits="CarRentalSystem.viewowner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body class="grey lighten-3">
    <%Response.WriteFile("adminnav.html"); %>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
     <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="oid" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="oid" HeaderText="oid" InsertVisible="False" ReadOnly="True" SortExpression="oid" />
                    <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                    <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [owner]"></asp:SqlDataSource>
        </div>

   </form>
</body>
    </html>