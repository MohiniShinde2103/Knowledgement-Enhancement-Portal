<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Attendance</title>
</head>
<body>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String block=request.getParameter("block");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
String num="";
String absent1=new String();
String present1=new String();
while(rs1.next())
{
	num=rs1.getString(1);
	String attend=request.getParameter("check"+num);
	if(attend==null)
	{
		present1+=" "+num;
	}
	else
	{
		absent1+=" "+num;
	}
}
int len=absent1.split(" ").length;
for(int i=1;i<len;i++)
{
String str1=absent1.split(" ")[i];
st.executeUpdate("update examstudent set attendance='absent',specialcode='401' where id='"+str1+"'");
}
len=present1.split(" ").length;
for(int i=1;i<len;i++)
{
String str1=present1.split(" ")[i];
st.executeUpdate("update examstudent set attendance='present' where id='"+str1+"'");
}
out.println("<h1>Attendance Marked Successfully</h1>");
%>
<h2><a href="home.jsp">Home</a> &nbsp &nbsp <a href="MarkAbsent.jsp">Back</a></h2>
</body>
</html>