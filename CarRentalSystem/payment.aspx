<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="CarRentalSystem.payment1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

        .auto-style2 {
            width: 113px;
        }

        .auto-style3 {
            width: 113px;
            height: 23px;
        }

        .auto-style4 {
            height: 23px;
        }

        .auto-style5 {
            left: -1px;
            top: 0px;
        }

        .auto-style6 {
            width: 113px;
            height: 37px;
        }

        .auto-style7 {
            height: 37px;
        }

        .auto-style8 {
            height: 48px;
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
            <h3></h3>
        </div>
    </div>

    <div class="container">
        <div class="row">


            <form id="form1" runat="server">
                <div class="row">

                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <div class="row">
                                    <div class="col s12">


                                        <asp:Label ID="Label7" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label5" runat="server" Text="amount to pay" required></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td class="auto-style4">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label6" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label1" runat="server" Text="Payment mode"></asp:Label>
                                    </div>
                                </div>

                            </td>

                            <td>
                                <div class="row">
                                    <div class="col s6">

                                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>card</asp:ListItem>
                                    <asp:ListItem>paytm</asp:ListItem>
                                </asp:DropDownList></div></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label2" runat="server" Text="Card no." Visible="False"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="auto-style5">
                                    <div class="input-field col s6">

                                        <asp:TextBox ID="cardno" runat="server" OnTextChanged="cardno_TextChanged" Visible="False" required></asp:TextBox>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label3" runat="server" Text="Name on card" Visible="False"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="auto-style5">
                                    <div class="input-field col s6">

                                        <asp:TextBox ID="cardname" runat="server" Visible="False" required></asp:TextBox>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <div class="row">
                                    <div class="col s12">

                                        <asp:Label ID="Label4" runat="server" Text="Phone no" Visible="False"></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="auto-style5">
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="phoneno" runat="server" Visible="False" required></asp:TextBox>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style7">
                                <div class="row">
                                    <div class="input-field col s8 right">
                                        <div class="input-field col s3 white-text">
                                            <asp:Button class="btn waves-effect waves-light grey darken-2" ID="Button1" runat="server" OnClick="Button1_Click" Text="Pay"  />
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style8">
                                <div class  ="auto-style5">
                                    <div class="input-field col s6">
                                        <asp:TextBox ID="otp" runat="server" Width="144px" Visible="False" required></asp:TextBox>
                                    </div>
                                </div>
                            </td>
                            <td class="auto-style8">
                                <div class="row">
                                    <div class="input-field col s8 left">
                                        <div class="input-field col s3 white-text">
                                            <asp:Button ID="Button2" class="btn waves-effect waves-light grey darken-2" runat="server" OnClick="Button2_Click" Text="resend otp" Visible="False" />
                                        </div>
                                    </div>
                                </div>                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"></td>
                            <td>
                                <div class="row">
                                    <div class="input-field col s8 right">
                                        <div class="input-field col s3 white-text">
                                            <asp:Button class="btn waves-effect waves-light grey darken-2" ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" Visible="False"  />
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </div>
            </form>
        </div>
    </div>
</body>
</html>
