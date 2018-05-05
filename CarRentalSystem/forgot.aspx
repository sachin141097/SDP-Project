<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="CarRentalSystem.forgot" %>

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
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
    <div class="row grey darken-2">
         <div class="col s12 center white-text">
            <h3>Forgot Password</h3>
        </div>    
     </div>
     
   


    <form id="form1" runat="server">
        <div class="row">
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
        </div>
         <div class="row">
		
            
                <div class="input-field col s4">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="validate" AutoPostBack="True" >
                        <asp:ListItem>Customer</asp:ListItem>
                        <asp:ListItem>Owner</asp:ListItem>
                        <asp:ListItem>Delivery Person</asp:ListItem>


                        </asp:DropDownList>

			</div>
        </div>
            <div class="row">
                <div class="input-field col s4 body-align:center;">
                    	<i class="material-icons prefix ">email</i>
                        <asp:TextBox ID="Email" class="validate" runat="server" required></asp:TextBox>&nbsp;<label>Email</label>
                	</div>
            </div>
             <div class="row">
           	
                <div class="input-field col s3 white-text">
                    <asp:Button ID="get" class="btn waves-effect waves-light grey darken-2" 
                        runat="server" Text="GET" OnClick="get_Click" />
                </div>
            </div>
        </form>
</body>
</html>
