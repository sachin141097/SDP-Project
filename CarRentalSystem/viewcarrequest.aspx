﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewcarrequest.aspx.cs" Inherits="CarRentalSystem.viewcarrequest" %>
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
    <%Response.WriteFile("chauffernav.html"); %>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>

    <form id="form1" runat="server">
    <div></div>
        <div class="row">
            <div class="col s7">
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No requests found" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    </asp:GridView>
                
                </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
               
                    <h5>Name:</h5><asp:TextBox ID="name" runat="server"></asp:TextBox>
                
        </div>
            </div>
         <div class="row">
			<div class="input-field col s6">
               
                    <h5>Email:</h5><asp:TextBox ID="email" runat="server"></asp:TextBox>
             
        </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
               
                    <h5>Mobileno:</h5><asp:TextBox ID="phone" runat="server"></asp:TextBox>
             
        </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
               
                    <h5>Address:</h5><asp:TextBox ID="address" runat="server" TextMode="MultiLine" Height="100px" ></asp:TextBox>
               
        </div>
            </div>
       
       
       
        </form>
    </body>
    </html>