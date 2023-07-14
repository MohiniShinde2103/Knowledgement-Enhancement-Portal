<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Block</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("blockid"); 
session.putValue("bid",id); 

String name=request.getParameter("blockname");
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
ResultSet rs=st.executeQuery("select * from examblocks where block_id='"+id+"'");
if(rs.next())
{
int i=st.executeUpdate("update examblocks set block_id='"+id+"',block_name='"+name+"',block_size='"+size+"',break1='"+break1+"',break2='"+break2+"',break3='"+break3+"',break4='"+break4+"',allocated='0',staff='none' where block_id='"+id+"'"); 
	out.println("<h1>Block Updated Successfully<h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Block does not exist</h1>");
}
}
else
{
	out.println("<h1 style=\"color:red;\">Please select proper break</h1>");
}
%>
<br/><br/>
<a href="InsertBlockRecord.jsp">Back To Home</a>
</body>
</html>