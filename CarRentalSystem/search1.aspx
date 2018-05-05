﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search1.aspx.cs" Inherits="CarRentalSystem.search1" %>


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
          height: 54px;
        }
    </style>
</head>
<body class="grey lighten-3">
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>
   <script>
       $(document).ready(function () {
           $(".button-collapse").sideNav();
       });
</script>
    <%Response.WriteFile("~/customernav.html"); %>
    

    <form id="form1" runat="server">
    <div></div>
    
          <div class="row">
            
                <div class="input-field col s6">
        &nbsp;Search By&nbsp; :&nbsp;
        
         <asp:DropDownList ID="DropDownList1" runat="server" CssClass="validate" AutoPostBack="true" >
                       <asp:ListItem>price</asp:ListItem>
            <asp:ListItem>model</asp:ListItem>
            <asp:ListItem>mileage</asp:ListItem>
            <asp:ListItem>capacity</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
                    </div>
            </div>
     <div class="row">
			<div class="input-field col s6">
        <asp:TextBox ID="type" runat="server"  
            ToolTip="Enter Type Value(E.g-model,capacity,price,mileage)"></asp:TextBox>
        <br />
        <br />
    </div></div>
         <div class="row">
			<div class="input-field col s6">
                  <asp:Button ID="Button1" runat="server" class="btn waves-effect waves-light grey darken-2" OnClick="Button1_Click" 
            Text="Show Car" />
         
    </div>
             </div>
        <div class="row">
		 <div class="row">
                    <div class="col s6">
                        
        <asp:DataList ID="DataList1" runat="server" DataKeyField="carno" GridLines="Both" RepeatColumns="3" 
            RepeatDirection="Horizontal" Width="100%" OnItemCommand="datalist1_itemcommand"  EmptyDataText="No Cars Found"  >
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Text='<%# Eval("model") %>'></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Image ID="Image1" runat="server" Height="300px" Width="400px" ImageUrl='<%# Eval("carimage") %>'    />
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="button1" class="btn waves-effect waves-light grey darken-2" runat="server" Width="200" Text="View Detail"  CommandName="viewdetail" CommandArgument='<%# Eval("carno") %>'  />
                    </tr>
                </table>
                <br />
            </ItemTemplate>
            <FooterTemplate>
    <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' 
               runat="server" ID="lblNoRecord" Text="No Cars Found!"></asp:Label>
</FooterTemplate>
             
        </asp:DataList>
                        </div>
         </div>
        <asp:SqlDataSource ID="priceds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.carno, c.vehicleid, c.carimage, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (c.carno IN (SELECT carno FROM cardata AS cd WHERE (startdate &lt;= @sdate) AND (enddate &gt;= @edate) AND (carno NOT IN (SELECT carno FROM carstatus AS cs WHERE (@sdate &gt;= startdate) AND (@sdate &lt;= enddate) OR (@edate &gt;= startdate) AND (@edate &lt;= enddate))))) AND (sellprice &lt;= @type)">
            <SelectParameters>
                <asp:SessionParameter Name="sdate" SessionField="startdate" />
                <asp:SessionParameter Name="edate" SessionField="enddate" />
                <asp:ControlParameter ControlID="type" Name="type" PropertyName="Text" />
            </SelectParameters>
          </asp:SqlDataSource>

          <asp:SqlDataSource ID="modelds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.carno, c.vehicleid, c.carimage, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (c.carno IN (SELECT carno FROM cardata AS cd WHERE (startdate &lt;= @sdate) AND (enddate &gt;= @edate) AND (carno NOT IN (SELECT carno FROM carstatus AS cs WHERE (@sdate &gt;= startdate) AND (@sdate &lt;= enddate) OR (@edate &gt;= startdate) AND (@edate &lt;= enddate))))) AND (v.model = @model)">
              <SelectParameters>
                  <asp:SessionParameter Name="sdate" SessionField="startdate" />
                  <asp:SessionParameter Name="edate" SessionField="enddate" />
                  <asp:ControlParameter ControlID="type" Name="model" PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>

    </div>
        <asp:SqlDataSource ID="mileageds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.carno, c.vehicleid, c.carimage, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (c.carno IN (SELECT carno FROM cardata AS cd WHERE (startdate &lt;= @sdate) AND (enddate &gt;= @edate) AND (carno NOT IN (SELECT carno FROM carstatus AS cs WHERE (@sdate &gt;= startdate) AND (@sdate &lt;= enddate) OR (@edate &gt;= startdate) AND (@edate &lt;= enddate))))) AND (v.mileage &gt;= @mileage)">
            <SelectParameters>
                <asp:SessionParameter Name="sdate" SessionField="startdate" />
                <asp:SessionParameter Name="edate" SessionField="enddate" />
                <asp:ControlParameter ControlID="type" Name="mileage" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="capacityds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.carno, c.vehicleid, c.carimage, v.color, v.model, v.brand, v.capacity, v.mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE c.carno  IN
(SELECT carno FROM cardata AS cd WHERE (cd.startdate&lt;=@sdate)   AND (cd.enddate&gt;=@edate) AND carno NOT IN(SELECT cs.carno FROM carstatus AS cs WHERE((@sdate&gt;=cs.startdate) AND (@sdate&lt;=cs.enddate)) OR ((@edate&gt;=cs.startdate) AND (@edate&lt;=cs.enddate)) ))
AND ([capacity] = @capacity)">
            <SelectParameters>
                <asp:SessionParameter Name="sdate" SessionField="startdate" />
                <asp:SessionParameter Name="edate" SessionField="enddate" />
                <asp:ControlParameter ControlID="type" Name="capacity" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        </form>
        </body>
    </html>