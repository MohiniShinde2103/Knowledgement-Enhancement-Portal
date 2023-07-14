<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Main</title>
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
#abc1
{
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
background-color:#333;
}
#abc1:hover{
background:#669900;
}
</style>
</head>
<body>
<form name="libraryform" action="viewstudentprofile.jsp">
<div class="heading">
<font color="#ffffff">Welcome Student</font>
</div>
  <div class="nav">
<ul>
          <li>  <a  href="#">Home |</a> </li>
      <li><input type="submit" name="sub" value="View Profile |" id="abc1"></li>
      <li><a href="login.html">Log Out |</a></li>
</ul>

    </div>
<%
String name=request.getParameter("name2");
out.println("<input type=\"text\" name=\"name1\" value=\""+name+"\" hidden=\"hidden\">");
%>
</form>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>