<html>
<head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>rento</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   </head>
<title> Car Rentals </title>
<body class="main-layout">

      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="index.html"><img src="images/logo.png" alt="#" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item">
                                 <a class="nav-link" href="index.html"> Home  </a>
                              </li>
				<li class="nav-item">
                                 <a class="nav-link" href="page1.php">Query 1</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="page2.php">Query 2</a>
                              </li>'
                           </ul>
                           <div class="sign_btn"><a href="signin.php">Sign in</a></div>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
<body>

<table align="center">
<tr> <td align="center">
	<h1 style="color:red"> Find the customer id and names of customers who have rented at least two cars (i.e. have at least 2 rental agreements). </h1> <br>
	<p align="center">SELECT Customer_Id, First_Name, Last_Name, Customercount(*) as Number_Of_Rentals <br>
From RENTAL_AGREEMENT c JOIN RESERVATION r ON Contract_Reservation_Id=Reservation_Id JOIN CUSTOMER p ON Reserving_Customer_Id=Customer_Id JOIN CAR_CLASS cc ON Vehicle_Class_Id=Class_ID <br>
GROUP BY Customer_ID <br>
HAVING COUNT(*)>=2; <br>
</p> 
<form method="POST">
	<input type="submit" name="query2" value="Execute">
</form>
</td> </tr> </table>
<?php 
	if (isset($_POST['query2'])) {
	$cnx = new mysqli('localhost', 'root', '', 'carrentals');
	$query = 'SELECT Customer_Id, First_Name, Last_Name, count(*) as Number_Of_Rentals
From RENTAL_AGREEMENT c JOIN RESERVATION r ON Contract_Reservation_Id=Reservation_Id JOIN CUSTOMER p ON Reserving_Customer_Id=Customer_Id JOIN CAR_CLASS cc ON Vehicle_Class_Id=Class_ID
GROUP BY Customer_ID
HAVING COUNT(*)>=2';
	$cursor = $cnx->query($query);
	echo '<table border="2" align="center"><tr> <td> Customer_Id </td> <td> First_Name </td><td> Last_Name </td>
	<td> Number_Of_Rentals </td></tr>';
	while ($row = $cursor->fetch_assoc()) {
		echo '<tr>';
		echo '<td>' . $row['Customer_Id'] . '</td>';
		echo '<td> ' . $row['First_Name'] . '</td>';
		echo '<td> ' . $row['Last_Name'] . '</td>';
		echo '<td> ' . $row['Number_Of_Rentals'] . '</td>';
		echo '</tr>';
	}
	echo '</table>';
	$cnx->close();
	}
?>
</body>
</title>
</html>