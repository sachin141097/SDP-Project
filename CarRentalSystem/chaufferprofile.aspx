<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chaufferprofile.aspx.cs" Inherits="CarRentalSystem.chaufferprofile" %>

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
     <%
        Response.WriteFile("~/chauffernav.html"); %>
   
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>  
     <script>
        $(document).ready(function () {
            $(".button-collapse").sideNav();
        });
</script>
    
   
        <form id="form1" runat="server">
        <div>
        </div>
           <div class="col s9">
                <asp:FormView ID="details" runat="server" CellPadding="4"  DataKeyNames="did" DataSourceID="customerprofile" ForeColor="#333333"  >
                    <EditItemTemplate>
                       
                        User ID :
                        <asp:Label ID="uuidLabel1" runat="server" Text='<%# Eval("did") %>' Font-Bold="True" Font-Size="X-Large" />
                        <br />
                         <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("firstname") %>' />&nbsp;<label>Firstname</label>
                	        </div>
            	        </div> 
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lastname") %>' />&nbsp;<label>Lastname</label>
                	        </div>
            	        </div> 
                       
                       
                        <div class="row">
                	            <div class="input-field col s3  body-align:center;">
                    	            <i class="material-icons prefix ">contact_phone</i>
                                    <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("phone") %>' />&nbsp;<label >Mobile</label>
                	            </div>
                        </div>
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <i class="material-icons prefix ">email</i>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />&nbsp;<label>Email</label>
                	        </div>
            	        </div> 
                        <div class="row">
                	      
                            <div class="input-field col s1">
                    	
                               <asp:TextBox ID="salaryTextBox" runat="server" Text='<%# Bind("salary") %>' />&nbsp;<label>Licence No</label>
                	        </div>
            	        </div>
                       
                        <div class="row">
                	      
                            <div class="input-field col s1">
                    	
                               <asp:TextBox ID="rollnoTextBox" runat="server" Text='<%# Bind("licenseno") %>' />&nbsp;<label>Licence No</label>
                	        </div>
            	        </div>
                       
                        <div class="row">
                	        <div class="input-field col s5 body-align:center;">
                    	        <i class="material-icons prefix ">Address</i>
                               <asp:TextBox ID="addressTextBox" runat="server" TextMode="MultiLine" Text='<%# Bind("address") %>' Rows="3" />&nbsp;<label>Address</label>
                	        </div>
            	        </div> 
                        <div class="row">
           		               <div class="input-field col s12 body-align:center;">
                                    <div class="input-field col s3 white-text">
                                    <asp:LinkButton ID="UpdateButton" runat="server" class="btn waves-effect waves-light grey darken-2" CausesValidation="True" CommandName="Update" Text="Update" />
                                    </div>
                                    <div class="input-field col s3 white-text">
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" class="btn waves-effect waves-light grey darken-2" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </div>
                                </div>
                        </div>
                        <br />
                        
       
                    </EditItemTemplate>
                   
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    
                    <ItemTemplate>
                                    <!--start-->
                    <div class="row">
                    <div class="col s12">
                    <div class="card white">
                        <div class="card-content ">
                            <table class="bordered">
                                <tr>
                                    <td><b>Chaufferid :</b></td>
                                    <td><asp:Label ID="uuidLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("did") %>' /></td>
                                </tr>
                                <br />
                                <tr>
                                    <td><b>Firstname:</b></td>
                                    <td><asp:Label ID="firstnamelabel" runat="server" Text='<%# Bind("firstname") %>' /></td>
                                </tr>
                                 <tr>
                                    <td><b>Lastname :</b></td>
                                    <td><asp:Label ID="lastnamelabel" runat="server" Text='<%# Bind("lastname") %>' /></td>
                                </tr>
                               
                                
                                <tr>
                                    <td><b>Mobile no :</b></td>
                                    <td><asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("phone") %>' /></td>
                                </tr>
                                <tr>    
                                    <td><b>Email :</b></td>
                                    <td> <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td><b>Address :</b></td>
                                    <td><asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></td>
                                </tr> 
                                <tr>
                                    <td><b>Salary :</b></td>
                                    <td><asp:Label ID="salaryLabel" runat="server" Text='<%# Bind("salary") %>' /></td>
                                </tr>                
                                               
                                             
                                <tr>
                                    <td><b>Licenceno:</b></td>
                                    <td><asp:Label ID="licenceno" runat="server" Text='<%# Bind("licenseno") %>' /></td>
                                </tr>                
                            </table>
                            <div class="card-action">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Visible="true" CssClass="btn waves-effect waves-light grey darken-2" Text="Edit" />
                            </div>
                               
                        </div>
                        </div>
                    </div>
                </div>
                                <!--end-->
                    
                        
                        
                        
                    </ItemTemplate>
                    
                    
                    
                </asp:FormView>
                <asp:SqlDataSource ID="customerprofile" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [chauffer] WHERE [did] = @did" InsertCommand="INSERT INTO [chauffer] ([did], [firstname], [lastname], [email], [phone], [salary], [licenseno], [address]) VALUES (@did, @firstname, @lastname, @email, @phone, @salary, @licenseno, @address)" SelectCommand="SELECT * FROM [chauffer] WHERE ([email] = @email)" UpdateCommand="UPDATE [chauffer] SET [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [phone] = @phone, [salary] = @salary, [licenseno] = @licenseno, [address] = @address WHERE [did] = @did">
                    <DeleteParameters>
                        <asp:Parameter Name="did" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="did" Type="Int32" />
                        <asp:Parameter Name="firstname" Type="String" />
                        <asp:Parameter Name="lastname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="salary" Type="Int32" />
                        <asp:Parameter Name="licenseno" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="email" SessionField="loginid" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="firstname" Type="String" />
                        <asp:Parameter Name="lastname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="salary" Type="Int32" />
                        <asp:Parameter Name="licenseno" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="did" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
               </div>
                 </form>
    </body>
    </html>

