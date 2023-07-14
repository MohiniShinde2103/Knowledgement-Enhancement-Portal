<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Format 8</title>
<style>
.abc
{
margin-left:10%;
margin-right:10%;
}
</style>
</head>
<body>

	<div class="abc">
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
String exam1,previ="",new1="",coucode="",mastercode="",yearcode="",subject="",subcode="",ins="";
int i=1,count=0,incount=0,sum=0;
int count1[]=new int[100];
ResultSet rs3=st.executeQuery("select * from examdetails");
if(rs3.next())
{
	out.println("<center><h3>FORMAT NO. 8</h3><h4>Format of receipt for sealed answer book bundles to be given by Officer-in-Charge Distribution center to the Controller of Examination</h4></center>");
	exam1=rs3.getString(3);
	ins=rs3.getString(2);
	out.println("<hr size=\"3px\" color=\"black\"><table style=\"fontsize:15px;line-spacing:10px;\"><tr><td>Name of Institute : </td><td> <b>"+exam1+"</b></td></tr><tr></tr><tr></tr>");
	out.println("<tr><td>Examination :</td> <td><b>"+rs3.getString(4)+"</b></td><td>Institute Code : </td><td><b>"+ins+"</b></td></tr><tr></tr><tr></tr></table>");
	ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"'");
if(rs1.next())
{
	out.println("<table><td><center><h2>RECEIPT</h2></center>Received below mentioned sealed packets of written answer books in good and intact condition, from theOfficer-in-charge, examination center, Institute Code <b>"+ins+"</b></td></table>");
	out.println("<table border=\"1\" width=\"100%\"><tr><td><b><center>Sr. No</b></td><td><b><center>Course,<br/>Semester / Year,<br/> Master </b></td><td><b><center>Subject Title </td><td><b><center>Subject Code</td><td><b><center>Number of Packets <br/>(If sections)</td><td><b><center>Number of <br/>answer books <br/>in bundle</b></td><td width=\"200px\"><center><b>Mark sheets <br/>Number</center></b></td></tr>");
	ResultSet rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"'");
	while(rs.next())
	{
		incount++;
		if(rs.previous())
		{
			previ=rs.getString(8)+rs.getString(9)+rs.getString(10);
		}
		rs.next();
		new1=rs.getString(8)+rs.getString(9)+rs.getString(10);
		coucode=rs.getString(8);
		yearcode=rs.getString(9);
		subject=rs.getString(5);
		subcode=rs.getString(4);
		mastercode=rs.getString(10);
		if(previ.equals(new1))
		{
			continue;
		}
		else
		{
			ResultSet rscou=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"' and (attendance='present' or attendance='copycase')");
			while(rscou.next())
			{
				count++;
			}
			count1[i]=count;
			out.println("<tr>");
			out.println("<td><center>"+i+"</td>");
			i++;
			out.println("<td><center>"+new1+"</td>");
			out.println("<td><center>"+subject+"</td>");
			out.println("<td><center>"+subcode+"</td><td><center>1</td><td><center>"+count+"</td><td></td></center></tr>");
			count=0;
		}
		rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"'");
		rs.absolute(incount);
	}
	for(int j=0;j<count1.length;j++)
	{
		sum+=count1[j];
	}
	out.println("<tr><td colspan=4>Total number of answer book bundles</td><td><center>"+(i-1)+"</td><td><center>"+sum+"</td></center><td></td></tr></table>");
	out.println("<br/><br/><table><tr><td>Name of Controller: </td></tr>");
	out.println("<tr><td>Signature of Controller: </td></tr>");
	out.println("<tr><td>Date: <b>"+date+"</b></td><td> Time: <b>"+time+"</b></td></tr></table></div>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Select Valid data</h1>");
}
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter Exam Data</h1>");
}
%>
</center>
</body>
</html>