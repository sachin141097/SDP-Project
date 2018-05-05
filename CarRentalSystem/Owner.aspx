<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Owner.aspx.cs" Inherits="CarRentalSystem.Owner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Owner Page</title>
</head>
<body class="grey lighten-3">
    <%
        Response.WriteFile("~/ownernav.html"); %>
    </body>
    </html>
