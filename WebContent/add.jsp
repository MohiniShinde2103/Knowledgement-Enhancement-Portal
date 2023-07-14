<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD BOOK</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String bookid=request.getParameter("bid"); 
session.putValue("bid",bookid); 
String bookname=request.getParameter("bname"); 
String bookauthor=request.getParameter("aname");
String quantity=request.getParameter("qty");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
int i=st.executeUpdate("insert into library values ('"+bookid+"','"+bookname+"','"+bookauthor+"','"+quantity+"','"+quantity+"')"); 
	out.println("<h1 style=\"color:green;\">Book Added Successfully<h1><br/>");
	out.println("Book ID: "+bookid);
	out.println("<br/>Book Name: "+bookname);
	out.println("<br/>Book Author: "+bookauthor);
	out.println("<br/>Quantity: "+quantity);
%>
<br/><br/>
<a  href="Library.html">Home</a>
</body>
</html>