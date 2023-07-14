<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Student</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("id");
String date=request.getParameter("date"); 
String time=request.getParameter("time"); 
String subcode=request.getParameter("subcode"); 
String subname=request.getParameter("subname"); 
String seatno=request.getParameter("seatno"); 
String center=request.getParameter("center");
String coucode=request.getParameter("coucode");
String yearcode=request.getParameter("yearcode");
String mastcode=request.getParameter("mastcode");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examstudent where id='"+id+"'");
if(rs.next())
{
	String block=rs.getString(11);
	String attendance=rs.getString(12);
	String staff=rs.getString(13);
	String spcode=rs.getString(14);
int i=st.executeUpdate("update examstudent set id='"+id+"',date='"+date+"',time='"+time+"',subcode='"+subcode+"',subname='"+subname+"',seatno='"+seatno+"',center='"+center+"',coucode='"+coucode+"',yearcode='"+yearcode+"',mastercode='"+mastcode+"',block='"+block+"',attendance='"+attendance+"',staffname='"+staff+"',specialcode='"+spcode+"' where id='"+id+"'"); 
	out.println("<h1>Student Updated Successfully<h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Student does not exist</h1>");
}
%>
<br/><br/>
<a href="MainSeatingChart.jsp">Back To Home</a>
</body>
</html>