<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RETURN BOOK</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
int bookid=Integer.parseInt(request.getParameter("bid")); 
session.putValue("bid",bookid); 
String bookname=request.getParameter("bname"); 
String bookauthor=request.getParameter("aname"); 
String studname=request.getParameter("sname");  
String studclass=request.getParameter("cname"); 
String rollno=request.getParameter("rno"); 
String rdate=request.getParameter("rdate"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from library where book_id="+bookid);
if(rs.next())
{
	int qty=rs.getInt(4);
	int perqty=rs.getInt(5);
	if(qty<perqty && qty>=0)
	{
	st.executeUpdate("update library set quantity='"+(qty+1)+"' where book_id='"+bookid+"'");
	int i=st.executeUpdate("insert into library_return values('"+bookid+"','"+bookname+"','"+bookauthor+"','"+studname+"','"+studclass+"','"+rollno+"','"+rdate+"')"); 
	out.println("<h1 style=\"color:green;\">Book Received Successfully<h1><br/>");
	out.println("Book ID: "+bookid);
	out.println("<br/>Book Name: "+bookname);
	out.println("<br/>Book Author: "+bookauthor);
	out.println("<br/>Student Name: "+studname);
	out.println("<br/>Student Class: "+studclass);
	out.println("<br/>Student Roll No: "+rollno);
	out.println("<br/>Received Date: "+rdate);
	}
	else
	{
		out.println("<h1 style=\"color:red;\">Invalid Operation Performed<h1>");
		out.println("<h4>This book isn't issued by library<h4>");
	}
}
else
{
	out.println("Book does not exist");
}
%>
<br/><br/>
<a  href="Library.html">Home</a>
</body>
</html>