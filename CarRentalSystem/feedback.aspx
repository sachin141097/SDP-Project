<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="CarRentalSystem.feedback1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
    </script>
    <div class="row grey darken-2">
        <div class="col s12 center white-text">
            <h3>FeedBack</h3>
        </div>
    </div>

    <div class="container">
        <div class="row">

            <form id="form1" runat="server">
                  <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        
                <div class="row">
                    <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <h5>Customerid:</h5>
                        <asp:TextBox ID="cid" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <h5>Carno:</h5>
                        <asp:TextBox ID="cno" runat="server" required></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <h5>Ratings:</h5>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem>execellent</asp:ListItem>
                            <asp:ListItem>average</asp:ListItem>
                            <asp:ListItem>poor</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <h5>Description:</h5>
                        <asp:TextBox ID="review" runat="server" TextMode="MultiLine" Height="200px" required></asp:TextBox>
                    </div>
                </div>
                 <asp:HtmlEditorExtender ID="ex1" TargetControlID="review" runat="server">
            <Toolbar>
                <asp:Bold />
                <asp:Italic />
                <asp:UnderLine />
                <asp:Undo />
                <asp:Redo />
                <asp:Cut />
                <asp:Copy />
                <asp:Paste />
                <asp:ForeColorSelector />
                <asp:FontNameSelector />
             
            </Toolbar>
          </asp:HtmlEditorExtender>
       
                
                <div class="row">
                    <div class="input-field col s12">
                        <div class="input-field col s3 white-text">
                            <asp:Button ID="submit" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Post" OnClick="submit_Click" />
                        </div>
                    </div>
                </div>


            </form>
        </div>
    </div>
</body>
</html>
