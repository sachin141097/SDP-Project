﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryPerson.aspx.cs" Inherits="CarRentalSystem.DeliveryPerson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Customer Page</title>
</head>
<body class="grey lighten-3">
    <%
        Response.WriteFile("~/chauffernav.html"); %>
    </body>
    </html>
