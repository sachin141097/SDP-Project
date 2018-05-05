<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="CarRentalSystem.report" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            width: 355px;
        }
        .auto-style3 {
            width: 355px;
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
     <div class="row">
            <div class="col s4 offset-s4">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <div class="row">
                <div class="col s12">
                    <asp:Label ID="Label1" runat="server" Text="Month:"></asp:Label></div></div>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div></div>
                </td>
                <td><div class="row">
                <div class="col s12">
                    <asp:Label ID="Label2" runat="server" Text="Year:"></asp:Label></div></div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></div></div>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <div class="row">
               <div class="input-field col s8 center">
                   <div class="input-field col s3 white-text">   <asp:Button ID="Button1" class="btn waves-effect waves-light grey darken-2" runat="server" OnClick="Button1_Click" Text="Get" /></div></div></div>
                </td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Chart ID="Chart1" runat="server">
                        <series>
                            <asp:Series Name="Series1">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                            
                        </chartareas>
                    </asp:Chart>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <div>
        </div>
    </form>
                </div></div>
</body>
</html>
