<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewfeedback.aspx.cs" Inherits="CarRentalSystem.viewfeedback" %>

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
    <div></div>
    <div></div>
        <div class="row">
            <div class="col s7">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView></div></div>
        <br />
        <div class="row">
            <div class="col s12">
        <h4><asp:Label ID="Label1" runat="server" Text="Description:"></asp:Label></h4>
            </div>
        </div>
&nbsp;<div class="row">
			<div class="input-field col s6">
        <asp:TextBox ID="TextBox1" runat="server" Height="90px" TextMode="MultiLine" Width="168px"></asp:TextBox></div></div>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
