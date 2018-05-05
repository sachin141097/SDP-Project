<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="CarRentalSystem.book1" %>
<%@ Register assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add Car Datails</title>
</head>
    <body class="grey lighten-3">

    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT c.carno, c.vehicleid,c.carimage AS carimage, c.isfor, c.sellprice, v.color AS color, v.model AS model, v.brand AS brand, v.capacity AS capacity, v.mileage AS mileage, v.quantity FROM cardata AS c INNER JOIN vehicle AS v ON v.vehicleid = c.vehicleid WHERE (v.vehicleid = @vehicleid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="vehicleid" QueryStringField="vehicleid" />
            </SelectParameters>
        </asp:SqlDataSource>

    
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
<div class="row ">
    <div class="container">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        
        <style type="text/css">
.ajax__calendar_container { z-index : 1000 ; }
</style>
        <div>
			<h4>Book Car</h4>
		</div>
        <div class="row">
                <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True"></asp:Label>
			    </div>
		    </div>
        <div class="row">
			<div class="input-field col s6">
                
                <h5>StartDate:</h5><asp:TextBox ID="sdate" runat="server"  CssClass="validate" required></asp:TextBox>
               
                    
				
				</div>
		</div>
          <div class="row">
			<div class="input-field col s6">
                
                <h5>StartTime:</h5><asp:TextBox ID="stime" runat="server"  CssClass="validate" required></asp:TextBox>
               
                    
				
				</div>
		</div>
      
        <div class="row">
			<div class="input-field col s6">
                
                <h5>EndDate:</h5><asp:TextBox ID="edate" runat="server"  CssClass="validate" required  placeholder="end date"></asp:TextBox>
               
                    
				
				</div>
		</div>
          <div class="row">
			<div class="input-field col s6">
                
                <h5>Endtime:</h5><asp:TextBox ID="etime" runat="server"  CssClass="validate" AutoPostBack="true" required></asp:TextBox>
               
                    
				
				</div>
		</div>
      
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Duration(In Hours):</h5><asp:TextBox ID="duration" runat="server"  CssClass="validate" required></asp:TextBox>
               
                    
				
				</div>
		</div>
       
        <!--<div class="row">
			<div class="input-field col s6">
                
                <h5>Quantity:</h5><asp:TextBox ID="qty" runat="server"  CssClass="validate" required  AutoPostBack="true"></asp:TextBox>
               
               
				
				</div>
		</div>-->
        <div class="row">
			<div class="input-field col s6">
                
                <h5>Vehicleid:</h5><asp:TextBox ID="vid" runat="server"  CssClass="validate" required Text='<%# Eval("vehicleid") %>'></asp:TextBox>
               
               
				
				</div>
		</div>
        
        <div class="row">
			<div class="input-field col s6">
                
                <h5>Brand:</h5><asp:TextBox ID="brand1" runat="server"  CssClass="validate" required Text='<%# Eval("brand") %>'></asp:TextBox>
               
               
				
				</div>
		</div>
        <div class="row">
			<div class="input-field col s6">
                
                <h5>Model:</h5><asp:TextBox ID="model1" runat="server"  CssClass="validate" required></asp:TextBox>
               
                            
				
				</div>
		</div>
        <div class="row">
			<div class="input-field col s6">
                
                <h5>Rent Price:</h5><asp:TextBox ID="rprice" runat="server"  CssClass="validate" required></asp:TextBox>
               
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Price to Pay:</h5><asp:TextBox ID="ppay" runat="server"  CssClass="validate" required></asp:TextBox>
               
               
				
				</div>
		</div>
        <div class="row">
                    <div class="input-field col s6">
                        <h5>Address:</h5>
                        <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Height="100px" required></asp:TextBox>
                    </div>
                </div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Month:</h5><asp:TextBox ID="month" runat="server"  CssClass="validate" required></asp:TextBox>
               
               
				
				</div>
		</div>
         <div class="row">
			<div class="input-field col s6">
                
                <h5>Year:</h5><asp:TextBox ID="year" runat="server"  CssClass="validate" required></asp:TextBox>
               
               
				
				</div>
		</div>
        
        

                
                
        <div class="row">
   			<div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
               	       <asp:Button ID="book" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Book" OnClick="book_Click" />
	                 </div>
           </div>
            </div>


       
        
        
        
        
        </form>
        </div>
    </div>
        </body>
        
     
</html>
