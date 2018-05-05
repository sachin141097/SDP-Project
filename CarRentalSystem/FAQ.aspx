<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="CarRentalSystem.FAQ" %>

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
    <div class="row grey darken-2">
         <div class="col s12 center white-text">
            <h3>FAQs</h3>
        </div>    
     </div>
    
    <div class="row ">
    <div class="container">
    <form id="form1" runat="server">
            
							<div class="row" >
                <div class="col s12">
									<h5>(1)How old do I have to be to rent a vehicle?</h5></div>
								Person must have age more than 18 and must have driving license.</div>
						
                            <div class="row">
                <div class="col s12">
								<h5>(2)What can I do without SignIn or SignUp ?</h5></div>
							    You can&#39;t do anything without signing in.</div>
                        <div class="row">
                <div class="col s12">
								<h5>(3)How to book a car?</h5></div>
							First sign in system.after that enter date and time for booking.<br />
                            It will show different available cars. you can also apply search.<br />
                            Select the car you want to book and pay for it.</div>
            
                        <div class="row">
                <div class="col s12">
								<h5>(4)What payment methods are accepted or not accepted by DRIVE, and can I pay in advance?</h5></div>
							DRIVE allows card payment and paytm wallet. All the money is must paid in advance and penalty is paid during returning car.
							</div>
					<div class="row">
                <div class="col s12">
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</p>
						</div>
                        <div class="col s12">
                            <h5>(5)Upto how much duration i can cancel my car?</h5>
                        </div>
                        You can cancel your booking before 24 hours of starting time of your booking.</div>

                        <div class="row">
                <div class="col s12">
                    <h5>
            (6)Is DRIVE cab available 24*7 hours?</h5></div>Yes it is available for 24*7.</div>
				<div class="row">
                <div class="col s12">
                    <h5>
			(7)Can I choose a specific make and model, and can I take my rented car outside of the ahmedabad?</h5></div>yes.</div>
    </form>
        </div>
       </div>
</body>
</html>
