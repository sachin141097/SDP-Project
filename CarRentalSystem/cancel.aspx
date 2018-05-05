<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancel.aspx.cs" Inherits="CarRentalSystem.cancel" %>

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
            width: 100%;
        }
        .auto-style2 {
            width: 360px;
        }
        .auto-style3 {
            width: 360px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body class="grey lighten-3">
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
    <div>
         <div class="row">
                <div class="col s12">
 
                    <asp:Label ID="Label10" runat="server" Text="Booking cancel Successfully"></asp:Label></div></div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <div class="row">
                <div class="col s12">
                    <asp:Label ID="Label1" runat="server" Text="Booking ID:"></asp:Label></div></div>
                </td>
                <td class="auto-style4">
                    <div class="row">
			<div class="input-field col s6">
                    <asp:TextBox ID="bid" runat="server" Width="265px"></asp:TextBox></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
                    <asp:Button ID="Button1" runat="server" class="btn waves-effect waves-light grey darken-2" Height="34px" OnClick="Button1_Click" Text="Show" ToolTip="cancel booking" Width="124px" />
                </div></div>
                       </td>
                <td>
                    <div class="input-field col s12 body-align:center;">
                    <div class="input-field col s3 white-text">
                    <asp:Button ID="Button2" runat="server" class="btn waves-effect waves-light grey darken-2" Height="34px" OnClick="Button2_Click" Text="Cancel" ToolTip="cancel booking" Width="124px" />
                </div></div>
                        </td>
                
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label2" runat="server" Text="carno:"></asp:Label>
                    </div></div>
                </td>
                <td>
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="row">
                <div class="col s12">
                    <asp:Label ID="Label3" runat="server" Text="startdate:"></asp:Label></div></div>
                </td>
                <td>
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label4" runat="server" Text="enddate:"></asp:Label></div></div>
                </td>
                <td>
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label5" runat="server" Text="rentalamount:"></asp:Label></div></div>
                </td>
                <td>
                    <div class="row">
                <div class="col s12">
        
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>

                <td>
                              
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    
    </div>
    </form>
        </div></div>
</body>
</html>
