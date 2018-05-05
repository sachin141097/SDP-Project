<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrequests.aspx.cs" Inherits="CarRentalSystem.carrequests" %>

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
    <%Response.WriteFile("adminnav.html"); %>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
		$(document).ready(function(){
			$('select').material_select();
		});
	</script>

    <form id="form1" runat="server">
    <div></div>
         <div class="row">
            <div class="col s7">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="carrequestid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="5">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="carno" HeaderText="carno" SortExpression="carno" />
                <asp:BoundField DataField="carrequestid" HeaderText="carrequestid" InsertVisible="False" ReadOnly="True" SortExpression="carrequestid" Visible="False" />
                <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                <asp:BoundField DataField="capacity" HeaderText="capacity" SortExpression="capacity" />
                <asp:BoundField DataField="mileage" HeaderText="mileage" SortExpression="mileage" />
                <asp:BoundField DataField="rentprice" HeaderText="rentprice" SortExpression="rentprice" />
                <asp:BoundField DataField="carimage" HeaderText="carimage" SortExpression="carimage" />
                
                <asp:TemplateField HeaderText="requeststatus" SortExpression="requeststatus">
                    <EditItemTemplate>
                        
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("requeststatus") %>'>
                            <asp:ListItem>pending</asp:ListItem>
                            <asp:ListItem>Approved</asp:ListItem>
                            <asp:ListItem>Canceled</asp:ListItem>
                        </asp:DropDownList>
                                
                    </EditItemTemplate>
                    <ItemTemplate>
                       
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("requeststatus") %>'></asp:Label>
                            </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate"/>
                <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate"/>
                <asp:BoundField DataField="oid" HeaderText="oid" SortExpression="oid"/>

            </Columns>
        </asp:GridView>
        <br />
                </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [carrequests] WHERE [carrequestid] = @carrequestid" InsertCommand="INSERT INTO [carrequests] ([carno], [brand], [model], [color], [capacity], [mileage],  [rentprice], [carimage], [requeststatus], [startdate], [enddate],[oid]) VALUES (@carno, @brand, @model, @color, @capacity, @mileage,  @rentprice, @carimage, @requeststatus, @startdate, @enddate,@oid)" SelectCommand="SELECT * FROM [carrequests]" UpdateCommand="UPDATE [carrequests] SET [carno] = @carno, [brand] = @brand, [model] = @model, [color] = @color, [capacity] = @capacity, [mileage] = @mileage,  [rentprice] = @rentprice, [carimage] = @carimage, [requeststatus] = @requeststatus, [startdate] = @startdate, [enddate] = @enddate WHERE [carrequestid] = @carrequestid">
            <DeleteParameters>
                <asp:Parameter Name="carrequestid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                 <asp:Parameter Name="carno" Type="String" />
                <asp:Parameter Name="brand" Type="String" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="color" Type="String" />
                <asp:Parameter Name="capacity" Type="Int32" />
                <asp:Parameter Name="mileage" Type="Double" />
                <asp:Parameter Name="rentprice" Type="Int32" />
                <asp:Parameter Name="carimage" Type="String" />
                <asp:Parameter Name="requeststatus" Type="String" />
                <asp:Parameter Name="startdate" Type="DateTime" />
                <asp:Parameter Name="enddate" Type="DateTime" />
                <asp:Parameter Name="carrequestid" Type="Int32" />
                <asp:Parameter Name="oid" Type="Int32" />

</InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="carno" Type="String" />
                <asp:Parameter Name="brand" Type="String" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="color" Type="String" />
                <asp:Parameter Name="capacity" Type="Int32" />
                <asp:Parameter Name="mileage" Type="Double" />
                <asp:Parameter Name="rentprice" Type="Int32" />
                <asp:Parameter Name="carimage" Type="String" />
                <asp:Parameter Name="requeststatus" Type="String" />
                <asp:Parameter Name="startdate" Type="DateTime" />
                <asp:Parameter Name="enddate" Type="DateTime" />
                <asp:Parameter Name="carrequestid" Type="Int32" />
                <asp:Parameter Name="oid" Type="Int32" />


            </UpdateParameters>
        </asp:SqlDataSource>
                </div>
        <div class="row">
			<div class="input-field col s6">
             <h5>Car No:</h5><asp:TextBox ID="carno" runat="server"  CssClass="validate" required></asp:TextBox>
               </div>
            </div>
             
        <div class="row">
			<div class="input-field col s6">
             <h5>Color</h5><asp:TextBox ID="color" runat="server"  CssClass="validate" required></asp:TextBox>
                </div>
            </div>
              
        <div class="row">
			<div class="input-field col s6">
              <h5>Model:</h5><asp:TextBox ID="model" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
            </div>
               
        <div class="row">
			<div class="input-field col s6">
             <h5>Brand:</h5><asp:TextBox ID="brand" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
            </div>
               
        <div class="row">
			<div class="input-field col s6">
             <h5>Capacity:</h5><asp:TextBox ID="capacity" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
            </div>
               <div class="row">
			<div class="input-field col s6">
              <h5>Mileage:</h5><asp:TextBox ID="mileage" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
                   </div>
               
        <div class="row">
			<div class="input-field col s6">
              <h5><asp:Label ID="rprice" Text="RentPrice:" runat="server"/></h5><asp:TextBox ID="rentprice" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
            </div>
               
        <div class="row">
			<div class="input-field col s6">
             <h5>Image:</h5><asp:TextBox ID="carimage" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
              <h5>StartDate:</h5><asp:TextBox ID="sdate" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
                   </div>
        <div class="row">
			<div class="input-field col s6">
              <h5>EndDate:</h5><asp:TextBox ID="edate" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
                   </div>
         <div class="row">
			<div class="input-field col s6">
              <h5>Ownerid:</h5><asp:TextBox ID="ownid" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
                   </div>
        <div class="row">
			<div class="input-field col s6">
              <h5>Price Per Hour:</h5><asp:TextBox ID="pph" runat="server" CssClass="validate" required></asp:TextBox>
                </div>
                   </div>
       
       
        
               
        <br />
        <br />
        <br />
        
         <div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
        <asp:Button ID="add" class="btn waves-effect waves-light grey darken-2" runat="server" Text="Add" OnClick="add_Click" />
                       </div>
             </div>
	                 
               
    
    </form>
</body>
</html>
