<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyoffer.aspx.cs" Inherits="CarRentalSystem.bookcar" %>

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

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style4 {
            width: 216px;
        }

        .auto-style5 {
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 20px;
            width: 299px;
        }

        .auto-style6 {
            width: 236px;
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

    <div class="row grey darken-2">
        <div class="col s12 center white-text">
            <h3>Payment</h3>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <form id="form1" runat="server">
                <div class="row">

                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <div class="row">
                                    <div class="col s12">
                                        <asp:Label ID="Label4" runat="server" Text="amount to pay"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <div class="col s12">
                                        <asp:Label ID="Label1" runat="server" Text="amount"></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <div class="row">
                                    <div class="col s12">
                                        <asp:Label ID="Label5" runat="server" Text="if you have promocode"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td class="auto-style6">
                                <div class="auto-style5">
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="264px"></asp:TextBox>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                    <div class="input-field col s8 right">
                                        <div class="input-field col s3 white-text">
                                            <asp:Button class="btn waves-effect waves-light grey darken-2" ID="Button1" runat="server" OnClick="Button1_Click" Text="apply" />
                                        </div>
                                    </div>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="input-field col s8 right">
                                        <div class="input-field col s3 white-text" style="left: -56px; right: 0px; top: 0px; width: 64%">
                                            <asp:Button class="btn waves-effect waves-light grey darken-2" ID="Button2" runat="server" Text="Pay" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
