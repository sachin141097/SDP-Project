
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addoffer.aspx.cs" Inherits="CarRentalSystem.addoffer" %>

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
                
                <h5>Promocode:</h5><asp:TextBox ID="promo" runat="server"></asp:TextBox>
 
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Description:</h5><asp:TextBox ID="desc" runat="server"></asp:TextBox>
 
               
				
				</div>
		</div>
          <div class="row">
			<div class="input-field col s6">
                
                <h5>Isonetime:</h5> <asp:DropDownList ID="ison" runat="server">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:DropDownList> 
               
				
				</div>
		</div>
       <div class="row">
			<div class="input-field col s6">
                
                <h5>Ofbased:</h5> <asp:DropDownList ID="ofbase" runat="server" AutoPostBack="True">
                <asp:ListItem>Amount</asp:ListItem>
                <asp:ListItem>Percentage</asp:ListItem>
            </asp:DropDownList> </div></div>
        
               
		
     <div class="row">
			<div class="input-field col s6">
                
                <h5><asp:Label ID="at" Text="Amount" runat="server"/></h5><asp:TextBox ID="amt" runat="server" CssClass="validate" required></asp:TextBox>
                
              
				
				</div>
		</div>
     <div class="row">
			<div class="input-field col s6">
                
                <h5><asp:Label ID="pt" Text="Percentage" runat="server"/></h5><asp:TextBox ID="per" runat="server" CssClass="validate" required></asp:TextBox>
                
               
				
				</div>
		</div>
     <div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="button1" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Add" OnClick="button1_Click"  />
	                 </div>
         </div>
       
       </form>
        </div></div>
    
 </body>
 </html>
