<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Blocks</title>
<style>
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
width:250px;
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
.heading {
	      background: #DB7093;
	      text-align: center;
	      text-decoration: none;
	      color: #000080;
	      font-size: 45px;
	      font-weight: bold;
	      style-height:100px;
	      height:65px;
	      width:100%;
}
#butt
{
width: 250px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:#8FBC8F;
border: #01010c;
color:#800000;
font-size: 18px;
font-weight: bold;
}
#footer
{
margin-top:15%;
margin-left:-1%;
margin-right:-1%;
margin-bottom:-2%;
background: #DB7093;
text-align: center;
color: #000080;
font-size: 18px;
font-weight: bold;
padding: 18px;
}
</style>
</head>
<body>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
    <form action="assignfinal.jsp" method="post">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date"); 
String time=request.getParameter("time"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<table border=2 align=\"center\"><h4><tr><td>Sr. No.</td><td>Date</td><td>Time</td><td>Subject Code</td><td>Subject Name</td><td>Count<td>Remaining Count</td></td><td>Edit</td></tr></h4>");
ResultSet rs=st.executeQuery("select * from examtimetable where date='"+date+"' and time='"+time+"' and remcount>0");
int count=0;
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(7)+"</td>");
	out.println("<td><input type=\"radio\" value=\""+rs.getString(1)+"\" name=\"radio1\"></td>");
	count++;
}
out.println("</table>");
%>
<br/>
&nbsp &nbsp &nbsp &nbsp<input type="submit" id="butt"> &nbsp &nbsp &nbsp<a href="AssignBlocks.jsp"><input type="button" value="back" id="butt"></a>
<h2><a href="home.jsp">Home</a></h2>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>