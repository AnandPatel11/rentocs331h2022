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
<?php 
	if (isset($_POST['submit'])) {
	$cnx = new mysqli('localhost', 'root', '', 'carrentals');
	$query = 'SELECT COUNT(*) AS cred FROM users WHERE Username="' . $_POST['username'] . '" AND Password="' . $_POST['password'] . '"';
	$cursor = $cnx->query($query);
	while ($row = $cursor->fetch_assoc()) {
		$valid = $row['cred'];
	}
	if ($valid == 1) {
		echo '   <li class="nav-item">
                                 <a class="nav-link" href="page1.php">Query 1</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="page2.php">Query 2</a>
                              </li>';
	}
	
	$cnx->close();
	}
?>
                           </ul>
                           <div class="sign_btn"><a href="signin.php">Sign in</a></div>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
	  <section style="background-color:pink">
<table align="center" >
<tr> <td align="center">
	<h1 style="color:purple"> Login Please </h1>
<form method="POST">
	<label for="username"> Username: </label> <br>
	<input type="text" id="username" name="username"> <br>
	<label for="password"> Password: </label> <br>
	<input type="password" id="password" name="password"> <br>
	<input type="submit" name="submit">
</form>
<form method="POST" action="signup.php">
	<input type="submit" name="signup" value="New user? Register Here.">
</form>
</section>



<?php 
	if (isset($_POST['submit'])) {
	$cnx = new mysqli('localhost', 'root', '', 'carrentals');
	$query = 'SELECT COUNT(*) AS cred FROM users WHERE Username="' . $_POST['username'] . '" AND Password="' . $_POST['password'] . '"';
	$cursor = $cnx->query($query);
	while ($row = $cursor->fetch_assoc()) {
		$valid = $row['cred'];
	}
	if ($valid == 1) {
	echo '<h4 style="color:red"> You have logged in! </h4>';
	echo '<h4 style="color:red"> The navigation bar has been updated with the queries you can access! </h4> <br>';
	}
	else 
	echo '<h4 style="color:red"> Invalid login credentials. Please try again! </h4>';
	$cnx->close();
	}
?>

</td> </tr> </table>
</body>
</title>
</html>
