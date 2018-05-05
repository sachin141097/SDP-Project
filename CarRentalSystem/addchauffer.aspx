<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addchauffer.aspx.cs" Inherits="CarRentalSystem.addchauffer" %>

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
        $(document).ready(function () {
            $('select').material_select();
        });
        </script>
     <script>
         $(document).ready(function () {
             $(".button-collapse").sideNav();
         });
</script>
    <div class="row ">
    <div class="container">
    <form id="form1" runat="server">
        
        <div class="row">
                <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True"></asp:Label>
			    </div>
		    </div>
        <div class="row">
			<div class="input-field col s6">
                
                <h5>Firstname:</h5><asp:TextBox ID="firstname" runat="server" pattern="[A-Za-z]{3,12}" title="Only alphabate length(3-12)" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Lastname:</h5><asp:TextBox ID="lastname" runat="server"  pattern="[A-Za-z]{3,12}" title="Only alphabate length(3-12)" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>
		</div>
             <div class="row">
			<div class="input-field col s6">
                
                <h5>Email:</h5><asp:TextBox ID="email" runat="server" CssClass="validate" pattern="^([a-zA-Z0-9_\-\.]+)@((gmail.com)|(yahoo.com))$" title="Only alphabate length(3-12)" required></asp:TextBox>
                
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Address:</h5><asp:TextBox ID="address" runat="server" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>
		</div>
             <div class="row">
			<div class="input-field col s6">
                
                <h5>Mobileno:</h5><asp:TextBox ID="mobileno" runat="server"   pattern="[987]{1}[0-9]{9}" title="Invalid format" CssClass="validate"  required ></asp:TextBox>
                
               
				
				</div>
		</div>
             <div class="row">
			<div class="input-field col s6">
                
                <h5><asp:Label ID="licno" Text="Licenceno" runat="server"/></h5><asp:TextBox ID="licenceno" runat="server" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>


		</div>
        <div class="row">
			<div class="input-field col s6">
                
                <h5><asp:Label ID="salary" Text="Salary" runat="server"/></h5><asp:TextBox ID="salry" runat="server" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>


		</div>
        <div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="add" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Add" OnClick="add_Click"  />
	                 </div>
            <div class="input-field col s3 white-text">
                  	<asp:Button ID="reset" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Reset" OnClick="reset_Click" />
            </div>
            </div>
        
         </form>
        </div>
        </div>

            
</body>
    </html>