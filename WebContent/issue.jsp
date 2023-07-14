<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ISSUE BOOK</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String bookid=request.getParameter("bid"); 
session.putValue("bid",bookid); 
String bookname=request.getParameter("bname"); 
String bookauthor=request.getParameter("aname"); 
String studname=request.getParameter("sname");  
String studclass=request.getParameter("cname"); 
String rollno=request.getParameter("rno"); 
String idate=request.getParameter("idate"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from library where book_id="+bookid);
if(rs.next()==true)
{
int quantity=rs.getInt(4);
int perquantity=rs.getInt(5);
if(quantity-1<0)
{
	out.println("<h1 style=\"color:red;\">Can't Issue, All books are issued</h1>");	
}
else 
{
	int qty=quantity-1;
	st.executeUpdate("update library set quantity="+qty+" where book_id="+bookid);
	int i=st.executeUpdate("insert into library_issue values ('"+bookid+"','"+bookname+"','"+bookauthor+"','"+studname+"','"+studclass+"','"+rollno+"','"+idate+"')"); 
	out.println("<h1 style=\"color:green;\">Book Issued Successfully<h1><br/>");
	out.println("Book ID: "+bookid);
	out.println("<br/>Book Name: "+bookname);
	out.println("<br/>Book Author: "+bookauthor);
	out.println("<br/>Student Name: "+studname);
	out.println("<br/>Student Class: "+studclass);
	out.println("<br/>Student Roll No: "+rollno);
	out.println("<br/>Issued Date: "+idate);
}
}
else
{
	out.println("<h1>Can't Issue, Book does not exist</h1>");
}
%>
<br/><br/>
<a  href="Library.html">Home</a>
</body>
</html>