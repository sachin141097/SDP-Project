<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewpayslip.aspx.cs" Inherits="CarRentalSystem.viewpayslip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
</head>
<body class="grey lighten-3">
    <%Response.WriteFile("customernav.html"); %>
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

                <div class="row grey darken-2">
                    <div class="col s12 center white-text">
                        <h3>Pay Slip</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s8 right">
                        <div class="input-field col s3 white-text">
                            <asp:Button class="btn waves-effect waves-light grey darken-2" ID="view" runat="server" Text="Generate" OnClick="view_Click" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
