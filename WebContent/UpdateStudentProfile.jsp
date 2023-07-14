<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Student</title>
<style>
     body {
                background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)), url(libloginbg.jfif);
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
margin-top:0%;
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
#butt1
{
width: 360px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:white;
border: #01010c;
color: red;
font-size: 20px;
margin-left:15%;
}
#butt
{
width: 200px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:#b53;
border: #01010c;
color: aliceblue;
font-size: 18px;
}
#button
{
padding:10px;
border-radius: 5px;
width: 290px;
outline: 0px;
}
#button1
{
padding:10px;
border-radius: 4px;
width: 100px;
outline: 0px;
}

.column{
float:left;
width:50%;
}


.row:after{
content:" ";
display:table;
clear:both;
}
.title h1{
color: #b53;
font-size: 40px;
font-family:Century Gothic;
}
#but1
{
color: white;
font-size: 23px;
}
#but
{
color: white;
font-size: 17px;
margin-left:-9%;
}
.simple-form
{
text-align:center;
margin:10px 200px;
}
#registration
{
width: 100%;
background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)), url(logback1.jpg);
background-repeat: no-repeat;
background-size: 102% 1000px;

opacity: 0.8;
padding:50px 0px;
}
</style>
</head>
<body>
<form name="libraryform" action="studentmain.jsp">
<div class="heading">
<font color="#ffffff">Welcome Student</font>
</div>
  <div class="nav">
<ul>
          <li> <input type="submit" name="sub" value="Home |" id="abc1"> </li>
      <li><a href="login.html">Log Out |</a></li>
</ul>
<%
String enrollment=request.getParameter("name1");
out.println("<input type=\"text\" name=\"name2\" hidden=\"hidden\" value=\""+enrollment+"\">");
%>
    </div></form>
    <br><br>
<div class="simple-form">
<form  name="contact" action="updatestudentprofile1.jsp">
<fieldset id="registration">
<div class="row">
<div class="column">
   	<div class="title">
<h1>Update Profile</h1>
</div>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
 <% 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from student where enrollment='"+enrollment+"'");
if(rs.next())
{
	out.println("<input type=\"number\" name=\"enroll\" id=\"button\" readonly=\"readonly\" value=\""+rs.getString(1)+"\" placeholder=\"Enter Student Enrollment No.\" required><br/><br/>");
	out.println("<input type=\"number\" name=\"roll\" id=\"button\" readonly=\"readonly\" value=\""+rs.getString(2)+"\" placeholder=\"Enter Student Roll No\" required><br/><br/>");
	out.println("<input type=\"text\" name=\"name\" id=\"button\" value=\""+rs.getString(3)+"\" placeholder=\"Enter Student Name\" required><br/><br/>");
	out.println("<span id=\"but\">DOB</span>&nbsp;&nbsp;<input type=\"date\" value=\""+rs.getString(4)+"\" name=\"dob\" id=\"button\" placeholder=\"Enter Student DOB\" required><br/><br/>");
	out.println("<span id=\"but\">Gender</span>&nbsp;&nbsp;<select id=\"button\" name=\"gender\"><option>Male</option><option>Female</option><option>Other</option></select><br><br>");
	out.println("<input type=\"email\" name=\"email\" id=\"button\" value=\""+rs.getString(6)+"\" placeholder=\"Enter Student Email ID\" required><br/><br/>");
	out.println("<input type=\"number\" name=\"mbno\" id=\"button\" value=\""+rs.getString(7)+"\" placeholder=\"Enter Student Mobile No\" required><br/><br/>");		
	out.println("<input type=\"text\" name=\"add\" id=\"button\" value=\""+rs.getString(8)+"\" placeholder=\"Enter Student Address\" required><br/><br/>");
	out.println("<select id=\"button\" name=\"branch\"><option>Computer Engineering</option><option>Mechanical Engineering</option><option>Electrical Engineering</option><option>E&Tc Engineering</option><option>Civil Engineering</option><option>Instrumentation Engineering</option></select><br><br>");
	out.println("<span id=\"but\">Year</span>&nbsp;&nbsp;<select id=\"button\" name=\"year\"><option>First Year</option><option>Second Year</option><option>Third Year</option></select><br><br>");
	out.println("<input type=\"password\" name=\"pass\" id=\"button\" value=\""+rs.getString(11)+"\" placeholder=\"Enter Password\" required><br/><br/>");
	out.println("<input type=\"submit\" value=\"Update My Profile\" id=\"butt\" >");	
}
else
{
	out.println("<h1 style=\"color:red;\">Student Does not exist</h1>");
}
   %>
    
    </div>
<div class="column"><br><br><br><br>
	 <img src="a.png" width=90% height=90%>
</div>
</div>

</fieldset><br/><br/><br/>
</form>
</div>
    <!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>