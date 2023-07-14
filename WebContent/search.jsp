<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
int bookid=Integer.parseInt(request.getParameter("bid")); 
session.putValue("bid",bookid); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from library where book_id="+bookid);
if(rs.next())
{
	out.println("<h1 style=\"color:green;\">Book Details<h1><br/>");
	out.println("<h2>Book ID: "+bookid);
	out.println("<br/>Book Name: "+rs.getString(2));
	out.println("<br/>Book Author: "+rs.getString(3));
	out.println("<br/>Remaining Quantity: "+rs.getInt(4));
	out.println("<br/>Permanent Quantity: "+rs.getInt(5));
	out.println("<br/>Issued Quantity: "+(rs.getInt(5)-rs.getInt(4)));
}
else
{
	out.println("<h1 style=\"color:red;\">Book does not exist</h1>");
}

%>
<br/><br/>
<a  href="Library.html">Home</a>
</body>
</html>