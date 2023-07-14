<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Paper Account</title>
<style>
.abc
{
margin-right:18%;
margin-left:18%;
}
</style>
</head>
<body>
<div class="abc">
<center><h2>ACCOUNT OF QUESTION PAPERS</h2><h3>To be submitted by the Officer-in-Charge, Examination Center</h3></center>
<hr size="3px" color="black"/>
Name of Institute(examination center): <b>Government Polytechnic, Karad(0010)</b><br/><br/>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
out.println("Date of Examination: <b>"+date+"</b>");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<br/><br/><table border=\"1\"><tr><td><b>Sr. No.</b></td><td><b>Course,Semester/Year,Master</b></td><td><b>Subject Title</b></td><td><b>Subject Code</b></td><td><b>Total Question Paper Received</b></td><td><b>Number of Student Appeared</b></td><td><b>Question Paper used for RAC</b></td><td><b>Total Question Paper Used</b></td><td><b>Total Question Paper Balance</b></td></tr>");
String name="",code="",num="",previ="",new1="";
String branch[]=new String[200];
int count=0,raccount=0,finalraccount,totalpaper,remqp;
int i=1;
ResultSet rs=st.executeQuery("select * from examqp where date='"+date+"'");
while(rs.next())
{
	out.println("<tr><td>"+rs.getString(1)+"</td>");
	name=rs.getString(4);
	code=rs.getString(3);
	num=rs.getString(5);
	ResultSet rs1=st.executeQuery("select * from examstudent where subcode='"+code+"'");
	out.println("<td>");
	if(rs1.next())
	{
	rs1.previous();
	while(rs1.next())
	{
		if(rs1.previous())
	    {
		  previ=rs1.getString(8)+rs1.getString(9)+rs1.getString(10);
	    }
	    rs1.next();
	    new1=rs1.getString(8)+rs1.getString(9)+rs1.getString(10);
		if(previ.equals(new1))
		{
			continue;
		}
		else
		{
			raccount++;
			out.println(rs1.getString(8)+rs1.getString(9)+rs1.getString(10));
		}
		}
	}
	else
	{
		out.println("<h1 style=\"color:red;\">no student data</h1>");
	}
	out.println("</td><td>"+name+"</td><td>"+code+"</td><td>"+num+"</td>");
	ResultSet rs2=st.executeQuery("select * from examstudent where subcode='"+code+"'");
	while(rs2.next()){
		count++;
	}
	out.println("<td>"+count+"</td>");
	finalraccount=raccount*4;
	out.println("<td>"+finalraccount+"</td>");
	totalpaper=count+finalraccount;
	out.println("<td>"+totalpaper+"</td>");
	remqp=Integer.parseInt(num)-totalpaper;
	out.println("<td>"+remqp+"</td></tr>");
	finalraccount=0;
	raccount=0;
	count=0;
	rs=st.executeQuery("select * from examqp where date='"+date+"'");
	rs.absolute(i);
	i++;
}

out.println("</table>");
%>
</div>
</body>
</html>