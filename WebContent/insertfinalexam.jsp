<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert final exam</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String examcenter=request.getParameter("examcenter"); 
String centername=request.getParameter("centername"); 
String sem=request.getParameter("sem");
String year=request.getParameter("year");
String finalyear=sem+" "+year;
String durstart=request.getParameter("examcenterdatefrom");
String durend=request.getParameter("examcenterdateto");
String duration=durstart+" "+durend;
String session1=request.getParameter("session1");
String sesstart=request.getParameter("examcentersessdatefrom");
String sesend=request.getParameter("examcentersessdateto");
String sessiondur=sesstart+" "+sesend;
String chiefofficer=request.getParameter("chiefofficer"); 
String officer=request.getParameter("officer"); 
String controller=request.getParameter("controller");
String supervisor=request.getParameter("sealsuper");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examdetails");
if(rs.next())
{
	ResultSet rs1=st.executeQuery("select * from examdetails");
	rs1.last();
	int j=Integer.parseInt(rs1.getString(1));
	j=j+1;
	int i=st.executeUpdate("insert into examdetails values('"+j+"','"+examcenter+"','"+centername+"','"+finalyear+"','"+duration+"','"+session1+"','"+sessiondur+"','"+chiefofficer+"','"+officer+"','"+controller+"','"+supervisor+"')"); 
	out.println("<h1>Exam Record Added Successfully</h1><br/>");
}
else
{
	int i=st.executeUpdate("insert into examdetails values('1','"+examcenter+"','"+centername+"','"+finalyear+"','"+duration+"','"+session1+"','"+sessiondur+"','"+chiefofficer+"','"+officer+"','"+controller+"','"+supervisor+"')"); 
	out.println("<h1>Exam Record Added Successfully</h1><br/>");
}
%>
<h1><a href="InsertExamRecord.jsp">Back</a></h1>
</body>
</html>