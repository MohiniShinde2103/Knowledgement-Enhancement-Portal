<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Question Paper</title>
<link rel="stylesheet" href="style.css">
<style>
#butt
{
width: 210px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:#1234332;
border: #01010c;
color:#800000;
font-size: 18px;
font-weight: bold;
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
    <div class="simple-form">
<form>
<div class="heading1"><h1>Manage Question Paper Account</h1></div>
<table><tr><td><a href="EditQP.jsp"><input type="button" name="edit" value="Edit Question Paper" id="butt" /></a></td><td><a href="DeleteQP.jsp"><input type="button" name="delete" value="Delete Question Paper" id="butt" /></a></td></tr></table>
<br/><br/>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
String name="",code="",num="";
String branch[]=new String[200];
int i=1;
out.println("<table border=\"1\" width=\"100%\"><tr><td>Sr. No.</td><td>Date</td><td>Course,Year/Sem,Master</td><td>Subject Name</td><td>Subject Code</td><td>Number of Packets</td></tr>");
ResultSet rs=st.executeQuery("select * from examqp where date='"+date+"'");
while(rs.next())
{
	out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td>");
	name=rs.getString(4);
	code=rs.getString(3);
	num=rs.getString(5);
	ResultSet rs1=st.executeQuery("select * from examstudent where subcode='"+code+"'");
	if(rs1.next())
	{
		out.println("<td>"+rs1.getString(8)+" "+rs1.getString(9)+" "+rs1.getString(10)+"</td>");
	}
	else
	{
		out.println("<td>no student  data</td>");
	}
	out.println("<td>"+name+"</td><td>"+code+"</td><td>"+num+"</td></tr>");
	rs=st.executeQuery("select * from examqp where date='"+date+"'");
	rs.absolute(i);
	i++;
}
out.println("</table>");
%>
<br/><br/><br/>
</form></div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>