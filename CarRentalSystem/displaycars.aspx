<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displaycars.aspx.cs" Inherits="CarRentalSystem.WebForm5"  %>

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
    <style type="text/css">
        .auto-style1 {
          height: 54px;
        }
    </style>
</head>
<body class="grey lighten-3">
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
   <script>
       $(document).ready(function () {
           $(".button-collapse").sideNav();
       });
</script>
    <%Response.WriteFile("~/customernav.html"); %>
    

    <form id="form1" runat="server">
    <div>
    
        
     <div class="row">
                    <div class="col s6">
                        
        <asp:DataList ID="DataList1" runat="server" DataKeyField="carno" GridLines="Both" RepeatColumns="3" 
            RepeatDirection="Horizontal" Width="100%" OnItemCommand="datalist1_itemcommand"   >
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Text='<%# Eval("model") %>'></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image1" runat="server" Height="300px" Width="400px" ImageUrl='<%# Eval("carimage") %>'    />
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="button1" class="btn waves-effect waves-light grey darken-2" runat="server" Width="200" Text="View Detail"  CommandName="viewdetail" CommandArgument='<%# Eval("carno") %>'  />
                    </tr>
                </table>
                <br />
            </ItemTemplate>
             
        </asp:DataList>
                        </div>
         </div>
    
        
    
    </div>
    </form>
</body>
</html>
