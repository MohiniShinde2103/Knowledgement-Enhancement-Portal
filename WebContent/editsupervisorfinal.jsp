<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Supervisor</title>
</head>
<body>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String block=request.getParameter("block");
String prevstaff=request.getParameter("prevstaff");
String staff=request.getParameter("staff");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
st.executeUpdate("update examstaff set status='free' where staff_name='"+prevstaff+"'");
st.executeUpdate("update examstudent set staffname='"+staff+"' where date='"+date+"' and time='"+time+"' and block='"+block+"'");
st.executeUpdate("update examstaff set status='"+block+"' where staff_name='"+staff+"'");
out.println("<h1 >Staff Updated Successfully");
%>
<br/><a href="home.jsp">Home</a>
</body>
</html>