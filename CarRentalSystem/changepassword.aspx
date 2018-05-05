<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="CarRentalSystem.changepassword" %>

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
     
   


    <form id="form1" runat="server">
        <div class="row">
            <asp:Label ID="msg" runat="server" ForeColor="Red" Font-Italic="true" Text=""></asp:Label>
        </div>
         <div class="row">
		
            
                </div>
         <div class="row">
			<div class="input-field col s3">
                
                <h5>Enter Password:</h5><asp:TextBox ID="pwd" runat="server"   CssClass="validate" pattern="[A-Za-z0-9~!@#$%^&*()_+]{8,15}" title="Length 8 to 10 , valid from alphanumeric and some special characters" required></asp:TextBox>
                
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s3">
                
                <h5>Confirm Password:</h5><asp:TextBox ID="cpwd" runat="server"   CssClass="validate" pattern="[A-Za-z0-9~!@#$%^&*()_+]{8,15}" title="Length 8 to 10 , valid from alphanumeric and some special characters" required></asp:TextBox>
                
               
				
				</div>
		</div>
        
        
             <div class="row">
           	
                <div class="input-field col s3 white-text">
                    <asp:Button ID="get" class="btn waves-effect waves-light grey darken-2" 
                        runat="server" Text="CHANGE" OnClick="get_Click" />
                </div>
            </div>
        </form>
</body>
</html>
