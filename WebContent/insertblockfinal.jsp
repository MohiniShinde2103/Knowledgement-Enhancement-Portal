<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Block</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("blockid"); 
session.putValue("bid",id); 
String bname=request.getParameter("blockname"); 
int size=Integer.parseInt(request.getParameter("blocksize"));
int break1=Integer.parseInt(request.getParameter("break1"));
int break2=Integer.parseInt(request.getParameter("break2"));
break2=break2+break1;
int break3=Integer.parseInt(request.getParameter("break3"));
break3=break2+break3;
int break4=Integer.parseInt(request.getParameter("break4"));
break4=break3+break4;
if(break4==size)
{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examblocks where block_name='"+bname+"'");
if(rs.next())
{
	out.println("<h1 style=\"color:red;\">Block Already Exists</h1>");
}
else
{
	int i=st.executeUpdate("insert into examblocks values('"+id+"','"+bname+"','"+size+"','"+break1+"','"+break2+"','"+break3+"','"+break4+"','0')"); 
	out.println("<h1>Block Added Successfully</h1><br/>");
}
}
else
{
	out.println("<h1 style=\"color:red;\">Enter Proper break</h1>");
}
%>
<h1><a href="InsertBlockRecord.jsp">Back</a></h1>
</body>
</html>