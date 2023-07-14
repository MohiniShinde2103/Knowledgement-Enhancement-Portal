<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<style>
     body {
                background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)), url(coverimg.png);
                background-repeat: no-repeat;
                background-size: 102% 100%;
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
.in
{
	margin-left:70%;
	margin-top:8%;
}
.intxt
{
	margin-left:2%;
	margin-top:2%;
	font-size:25px;
}
.inlib
{
	margin-left:5%;
	margin-top:-24%;
}
.inexam
{
	margin-left:38%;
	margin-top:-23%;
}
.nav{
width:100%;
background-color:#722;
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
width:150px;
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
.simple-form
{
margin:100px 400px;
}
#footer
{
margin-top:2%;
margin-left:-1%;
margin-right:-1%;
margin-bottom:-2%;
background: #338;
text-align: center;
color: #fff;
padding: 12px;
}
#butt
{
width: 400px;
height: 200px;
padding: 40px;
border-radius: 5px;
border: #01010c;
}
</style>
<body>
<div class="heading">
<font color="#00ff00">Knowledge Enhancement Portal</font>
</div>
  <div class="nav">
<ul>    <li>  <a  href="index.jsp">Home |</a> </li>
<li>  <a  href="login.html">Login |</a> </li>
 </ul>
    </div>
<form name="contact" action="login.html">
<div class="in">
<div class="intxt"><font color="#ffffff">Student Management System</font></div>
<input type="image" name="img1" value="1" src="stud1.jpg" width="400" height="300">
</div>

<div class="inlib">
<div class="intxt"><font color="#ffffff">Library Management System</font></div>
<input type="image" name="img1" value="2" src="lib1.jpg" width="400" height="300">
</div>

<div class="inexam">
<div class="intxt">
<font color="#ffffff">Exam Seating Arrangement</font></div>
<input type="image" name="img1" value="3" src="exam1.jpg" width="400" height="300">
</div>

</form></br></br></br>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>