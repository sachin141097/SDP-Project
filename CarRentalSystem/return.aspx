<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return.aspx.cs" Inherits="CarRentalSystem._return" %>

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
    
        <asp:Label ID="Label1" runat="server" Text="Booking ID:"></asp:Label></div></div>

&nbsp;<div class="row">
			<div class="input-field col s6"><asp:TextBox ID="bookingid" runat="server" required ></asp:TextBox></div></div>
        <br />
        <br />
        <br />
        <div class="input-field col s3 black-text">
            <div class="input-field col s3 white-text">
        <asp:Button ID="Button1" runat="server" class="btn waves-effect waves-light grey darken-2" Text="show" OnClick="Button1_Click" /></div></div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="input-field col s3 black-text">   
         <div class="input-field col s3 white-text">           
        <asp:Button ID="Button3" runat="server" class="btn waves-effect waves-light grey darken-2" OnClick="Button2_Click" Text="return" /></div>
            </div>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;<br />
        <br />
        <br />
        <br />
        <br />
    
    <div class="row">
                <div class="col s12">
     <asp:Label ID="Label8" runat="server">carno:</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server"></asp:Label></div></div>
&nbsp;<br />
                    <div class="row">
                <div class="col s12">
        <asp:Label ID="Label9" runat="server">startdate:</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server"></asp:Label></div></div>
        <br />
                    <div class="row">
                <div class="col s12">
        <asp:Label ID="Label10" runat="server">enddate:</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server"></asp:Label></div></div>
        <br />
                    <div class="row">
                <div class="col s12">
        <asp:Label ID="Label11" runat="server">rentalamount:</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server"></asp:Label></div></div>
        <br />
                    <div class="row">
                <div class="col s12">
        <asp:Label ID="Label7" runat="server"></asp:Label></div></div>
        <br />
        <br />
        <br />
        <br />
    </form>
        </div></div>
</body>
</html>
