<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timecheck.aspx.cs" Inherits="CarRentalSystem.timecheck" %>
<%@ Register assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>

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
    <%Response.WriteFile("customernav.html"); %>
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>  
    <script type="text/javascript">
        $(document).ready(function () {
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
.required {
	color: Red;
}
</style>
        
        
        <div>
			<h4>Check Availability</h4>
		</div>
      <div class="row">
                <div class="col s12">
                        <asp:Label ID="msg" runat="server" Font-Italic="True" ></asp:Label>
			    </div>
		    </div>
        <div class="row">
			<div class="input-field col s6">
                <h5>StartDate:</h5><asp:TextBox ID="sdate"  runat="server"   pattern="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" title="Enter Starting Date" required></asp:TextBox>
                               <ajax:CalendarExtender ID="sdate_cal" runat="server" TargetControlId="sdate" Enabled="true" Format="dd/MM/yyyy" PopupPosition="BottomLeft" PopupButtonID="sdate"></ajax:CalendarExtender>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="sdate" Operator="GreaterThanEqual"
        Type="Date" runat="server" ErrorMessage="date must be Greater than or equal to today's date" CssClass="required"></asp:CompareValidator>

                        
         </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
                <h5>StartTime:</h5><asp:TextBox ID="stime" runat="server"  title="Enter Starting Time" required OnTextChanged="stime_TextChanged" AutoPostBack="true"  ></asp:TextBox>
              
        </div>
            </div>
        <div class="row">
			<div class="input-field col s6">
                <h5>EndDate:</h5><asp:TextBox ID="edate"   runat="server"  pattern="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" title="Enter Ending Date" required></asp:TextBox>
                              <ajax:CalendarExtender ID="edate_cal" runat="server" TargetControlId="edate" Enabled="true" Format="dd/MM/yyyy"></ajax:CalendarExtender>
                    <asp:CompareValidator ID="cmpVal1" ControlToCompare="sdate" 
         ControlToValidate="edate" Type="Date" Operator="GreaterThanEqual"   
         ErrorMessage="The end date must be greater than or equal to start date" runat="server" CssClass="required"></asp:CompareValidator>
         </div>
        </div>
         <div class="row">
			<div class="input-field col s6">
                <h5>EndTime:</h5><asp:TextBox ID="etime" runat="server" title="Enter Ending Time"  required AutoPostBack="true" OnTextChanged="etime_TextChanged"></asp:TextBox>
              <asp:CompareValidator ID="cmpval2"  ControlToComapre="stime"
          Type="String" Operator="GreaterThan" ControlToValidate="etime"   
         ErrorMessage="Enter a valid end time" runat="server" CssClass="required"></asp:CompareValidator>
         
        </div>
            </div>
         <div class="row">
			<div class="input-field col s6">
                <h5>Duration(In Hours):</h5><asp:TextBox ID="du" runat="server" required></asp:TextBox>
             
            </div></div>
        <div class="input-field col s12 body-align:center;">
                   <div class="input-field col s3 white-text">
                       <asp:Button ID="Button1" runat="server" class="btn waves-effect waves-light grey darken-2" OnClick="Button1_Click" Text="show" />
              
        </div>
            </div>
            

       
</form>
        </div>
                 </div>
    </body>
    </html>