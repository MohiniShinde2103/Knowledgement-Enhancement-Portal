<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REMOVE BOOK</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String bookid=request.getParameter("bid"); 
String bookname=request.getParameter("bname"); 
session.putValue("bid",bookid); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from library where book_id='"+bookid+"'");
if(rs.next())
{
int i=st.executeUpdate("delete from library where book_id="+bookid); 
	out.println("<h1 style=\"color:green;\">Book Deleted Successfully</h1><br/>");
	out.println("Book ID: "+bookid);
	out.println("<br/>Book Name: "+bookname);
}
else
{
	out.println("<h1 style=\"color:red;\">Book does not exist</h1><br/>");
}
%>
<br/><br/>
<a  href="Library.html">Home</a>
</body>
</html>