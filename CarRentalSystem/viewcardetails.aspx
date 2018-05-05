<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewcardetails.aspx.cs" Inherits="CarRentalSystem.CarDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 374px;
        }
        .auto-style2 {
            width: 100%;
            height: 350px;
            margin-left: 0px;
        }
        .auto-style3 {
            width: 338px;
        }

    </style>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
</head>
<body class="grey lighten-3">
    <%
        Response.WriteFile("~/customernav.html"); %>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
        $(document).ready(function () {
            $('select').material_select();
        });
	</script>
     
    
    <form id="form1" runat="server">
        <div class="row" >
                <div class="col s12">
				    <h4>Car Details</h4>
                </div>
		    </div>
    <div>
             
        <asp:DataList ID="DataList1" runat="server" DataKeyField="carno" DataSourceID="SqlDataSource1" OnItemCommand="datalist1_itemcommand" >
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("carimage") %>' Height="400px" Width="500px" />
                        </td>
                        <td>
                            <table class="auto-style2">
                                <tr>
                                    <td>Carno:&nbsp;&nbsp;
                                        
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("carno") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Model:&nbsp;&nbsp;
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("model") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Brand:&nbsp;&nbsp;
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("brand") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Seating Capacity:
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("capacity") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Mileage:&nbsp;
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("mileage") %>' Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                        <td>&nbsp;
                     <asp:Button ID="button1" class="btn waves-effect waves-light grey darken-2" runat="server" Width="200" Text="Book"   CommandName="book" CommandArgument='<%# Eval("vehicleid") %>' />
                    </tr>
                
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT c.carno, c.vehicleid, c.carimage, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (c.carno = @carno)">
            <SelectParameters>
                <asp:QueryStringParameter Name="carno" QueryStringField="carno" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
