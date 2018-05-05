<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CarRentalSystem.hi" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI"  TagPrefix="BotDetect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
</head>
<body class="grey lighten-3">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
	</script>
     <div class="row grey darken-2">
         <div class="col s12 center white-text">
            <h3>Car Rental System</h3>
        </div>    
     </div>
           
    <div class="center container">
        <div class="row">
            <div class="col s4 offset-s4">
        <form id="form1" runat="server">
            
            <div class="row" >
                <div class="col s12">
				    <h4>Login</h4>
                </div>
		    </div>
		    <div class="row">
                <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True"></asp:Label>
			    </div>
		    </div>
            <div class="row">
            
                <div class="input-field col s12">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="validate">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Customer</asp:ListItem>
                        <asp:ListItem>Owner</asp:ListItem>
                        <asp:ListItem>DeliveryPerson</asp:ListItem>
                    </asp:DropDownList>

			</div>
                </div>
            <div class="row">
            
                <div class="input-field col s12">
				    <i class="material-icons prefix">perm_identity</i>
				    <asp:TextBox ID="uname" placeholder="Enter username" CssClass="validate" runat="server" required></asp:TextBox>&nbsp;<label >User ID</label>
			    </div>
            </div>
		    <div class="row">
                <div class="input-field col s12">
				    <i class="material-icons prefix">vpn_key</i>
				    <asp:TextBox ID="pwd" placeholder="Enter Password" CssClass="validate" TextMode="Password" runat="server" required></asp:TextBox>&nbsp;<label for="pwd">Password</label>
			    </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />
			</div>
                </div>
             <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="CaptchaCodeTextBox" placeholder="Enter the code shown above" CssClass="validate" runat="server"></asp:TextBox>
                
           </div>
                 </div>
            <div class="row">
               <div class="input-field col s8 right">
                   <div class="input-field col s3 white-text">
                        <asp:Button class="btn waves-effect waves-light grey darken-2" ID="login" runat="server" Text="Login" OnClick="login_Click" />
                    </div>
                </div> 
                <div class="col s3"></div>
            </div>
            <div class="row">
                <div class="col s12 offset-s1">
                    <a href="register.aspx" class="left" style="color:green;">New Registration ?</a>
                </div>
                <div class="col s12">
            	    <a href="forgot.aspx" class="right" style="color:red;">Forgot Password/ID ?</a>
           	    </div>
              
            </div>
            
            
        </form>
            </div>
        </div>

     </div>
    <footer class="page-footer grey darken-2">
    <div class="footer-copyright">
        <div class="container center">

            <p class="white-text">
                Copyright © 2018 by Drive.<br />
                All Rights Reserved.<br />
                
            </p>
        </div>
    </div>
</footer>
</body>
</html>

