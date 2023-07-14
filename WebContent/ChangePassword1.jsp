<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password</title>
</head>
<link rel="stylesheet" href="style.css">
<style>
     body {
                background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)), url(libloginbg.jfif);
                background-repeat: no-repeat;
                background-size: 102% 900px;
                font-family: Arial, Helvetica, sans-serif;
               }
     .heading {
	      text-align: center;
	      text-decoration: none;
	      font-size: 45px;
	      style-height:100px;
	      height:65px;
	      width:100%;
	}
  
body{
margin:0;
}
.nav{
width:100%;
background-color:#333;
height:60px;
}
ul{
list-style:none;
padding:0;
margin:0;
position:absolute;
}
ul li{
float:left;
margin-top:10px;
}
ul li a{
width:auto;
color:white;
display:block;
text-decoration:none;
font-size:20px;
text-align:center;
padding:10px;
border-radius:10px;
font-family:Century Gothic;
font-weight:bold;
}
a:hover{
background:#669900;
}
ul li ul{
background:#333;
}
ul li ul li{
float:none;
}
ul li ul{
display:none;
}
ul li:hover ul{
display:block;
}

#footer
{
margin-top:32%;
margin-left:-1%;
margin-right:-1%;
margin-bottom:-2%;
background: #f00;
text-align: center;
color: #fff;
padding: 12px;
}
</style>
<body>
<div class="heading">
Change Password</div>
  <div class="nav">
<ul>     <li>  <a  href="Library.html">Home |</a> </li>
<li>  <a  href="search.html">Search Book |</a> </li>
<li>  <a  href="add.html">Add Book |</a> </li>
<li>  <a  href="remove.html">Remove Book |</a> </li>
<li>  <a  href="issue.html">Issue Book |</a> </li>
<li>  <a  href="return.html">Return Book |</a> </li>
<li>  <a  href="ChangePassword1.html">Change Password |</a> </li>
<li>  <a  href="login.html">Logout |</a> </li>
 </ul>
    </div>
<div class="simple-form">
<form action="chgpassword.jsp">
<fieldset id="registration">
                    <font color="#ffffff" font size=4px>
<div class="heading1"><h1>Change Password</h1></div></br></br><br/><br/>
	Old Password : <input type="text" name="old"><br/></br>
                     New Password : <input type="text" name="new1"><br/><br/>
	Repeat new Password : <input type="text" name="repnew"><br/><br/>
	<hr></br></br><a href="#"><input type="submit" name="sub" value="Change Password Librarian" id="butt"></a><br/><br/></font>
	
</fieldset><br/><br/>
</form></div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>

</body>
</html>