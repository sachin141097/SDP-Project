<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewcustomer.aspx.cs" Inherits="CarRentalSystem.WebForm4" %>

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
        </div>

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SqlDataSource1" >
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" Visible="False" />
                 <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                 <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                 <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                 <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                 <asp:BoundField DataField="licenceno" HeaderText="licenceno" SortExpression="licenceno" />
                 <asp:BoundField DataField="mobileno" HeaderText="mobileno" SortExpression="mobileno" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [customer] WHERE [cid] = @cid" InsertCommand="INSERT INTO [customer] ([email], [firstname], [lastname], [address], [licenceno], [mobileno]) VALUES (@email, @firstname, @lastname, @address, @licenceno, @mobileno)" SelectCommand="SELECT * FROM [customer]" UpdateCommand="UPDATE [customer] SET [email] = @email, [firstname] = @firstname, [lastname] = @lastname, [address] = @address, [licenceno] = @licenceno, [mobileno] = @mobileno WHERE [cid] = @cid">
             <DeleteParameters>
                 <asp:Parameter Name="cid" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="email" Type="String" />
                 <asp:Parameter Name="firstname" Type="String" />
                 <asp:Parameter Name="lastname" Type="String" />
                 <asp:Parameter Name="address" Type="String" />
                 <asp:Parameter Name="licenceno" Type="String" />
                 <asp:Parameter Name="mobileno" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="email" Type="String" />
                 <asp:Parameter Name="firstname" Type="String" />
                 <asp:Parameter Name="lastname" Type="String" />
                 <asp:Parameter Name="address" Type="String" />
                 <asp:Parameter Name="licenceno" Type="String" />
                 <asp:Parameter Name="mobileno" Type="String" />
                 <asp:Parameter Name="cid" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

   </form>
</body>
    </html>