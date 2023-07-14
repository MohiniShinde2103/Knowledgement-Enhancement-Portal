<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Student Profile</title>
<style>
     body {
                background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)), url(libloginbg.jfif);
                background-repeat: no-repeat;
                background-size: 102% 110%;
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
margin-top:4%;
margin-left:-1%;
margin-right:-1%;
margin-bottom:-2%;
background: #f00;
text-align: center;
color: #fff;
padding: 12px;
}
.abc
{
margin-left:10%;
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
#butt1
{
width: 360px;
padding: 10px;
border-radius: 5px;
outline: 0px;
border: #01010c;
color: red;
font-size: 20px;
margin-left:15%;
}
</style>
</head>
<body>
<form action="studentmain.jsp" name="libraryform">
<div class="heading">
<font color="#ffffff">Welcome Student</font>
</div>
  <div class="nav">
<ul>

          <li><input type="submit" name="sub" value="Home |" id="abc1"></li>
      <li> <a href="#">View Profile |</a></li>
      <li><a href="login.html">Log Out |</a></li>
</ul>

    </div>
    <font color="#fff">
    <div class="abc">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String enroll=request.getParameter("name1");
out.println("<input type=\"text\" name=\"name2\" hidden=\"hidden\" value=\""+enroll+"\">");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from student where enrollment='"+enroll+"'");
if(rs.next())
{
	out.println("<h1><table><tr><td>Enrollment Number: </td><td>"+rs.getString(1)+"</td></tr>");
	out.println("<tr><td>Roll Number: </td><td>"+rs.getString(2)+"</td></tr>");
	out.println("<tr><td>Name: </td><td>"+rs.getString(3)+"</td></tr>");
	out.println("<tr><td>Date of Birth: </td><td>"+rs.getString(4)+"</td></tr>");
	out.println("<tr><td>Gender: </td><td>"+rs.getString(5)+"</td></tr>");
	out.println("<tr><td>Email </td><td>"+rs.getString(6)+"</td></tr>");
	out.println("<tr><td>Mobile: </td><td>"+rs.getString(7)+"</td></tr>");
	out.println("<tr><td>Address: </td><td>"+rs.getString(8)+"</td></tr>");
	out.println("<tr><td>Branch: </td><td>"+rs.getString(9)+"</td></tr>");
	out.println("<tr><td>Year: </td><td>"+rs.getString(10)+"</td></tr>");
	out.println("<tr><td>Password: </td><td>"+rs.getString(11)+"</h1>"+"</td></tr></table>");
}
else
{
	out.println("<h1 style=\"color:red;\">Student does not exist</h1>");
}
%>
</div>
</form>
<form action="UpdateStudentProfile.jsp">
<%
String enrollment=request.getParameter("name1");
out.println("<input type=\"text\" name=\"name1\" hidden=\"hidden\" value=\""+enroll+"\">");
out.println("<input type=\"submit\" name=\"name\" value=\"Edit My Profile\" id=\"butt1\">");
%>
</form>
</font>
</div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>