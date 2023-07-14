<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Special Code</title>
</head>
<body>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String seatno=request.getParameter("seatno");
String code=request.getParameter("code");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
if(code.equals("none"))
{
st.executeUpdate("update examstudent set specialcode='"+code+"',attendance='present' where date='"+date+"' and time='"+time+"' and seatno='"+seatno+"'");
out.println("<h1>Special Code Assigned Successfully");
}
else if(code.equals("401"))
{	
	st.executeUpdate("update examstudent set specialcode='"+code+"',attendance='absent' where date='"+date+"' and time='"+time+"' and seatno='"+seatno+"'");	
	out.println("<h1>Special Code Assigned Successfully");
}
else if(code.equals("403"))
{	
	st.executeUpdate("update examstudent set specialcode='"+code+"',attendance='copycase' where date='"+date+"' and time='"+time+"' and seatno='"+seatno+"'");	
	out.println("<h1>Special Code Assigned Successfully");
}
else
{
	out.println("<h1 style=\"color:red;\">Enter a Valid Code</h1>");
}
%>
<br/><a href="home.jsp">Home</a>
</body>
</html>