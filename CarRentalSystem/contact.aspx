<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CarRentalSystem.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Conact Us</title>
</head>
<body class="grey lighten-3">
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
	</script>
     <div class="row ">
    <div class="container">
    <form id="form1" runat="server">
        <div class="row">
			<div class="input-field col s6">
                
                <h5><asp:Label ID="msg" Text="Licenceno" runat="server"/></h5>
                </div>
            </div>
        </form>
        </div>
         </div>
</body>
    </html>