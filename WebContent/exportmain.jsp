<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Export</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
String file1=request.getParameter("filename1");
if(file1.length()>1)
{
try
{
    PrintWriter pw=new PrintWriter(new File("C:\\Users\\HP PC\\Desktop\\aaa\\"+file1.toString()));
    out.println("<h1>File Path= C:\\Users\\HP PC\\Desktop\\aaa\\"+file1.toString()+"</h1>");
    StringBuilder sb=new StringBuilder();
    Class.forName("com.mysql.jdbc.Driver"); 
    java.sql.Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
    Statement st= connection.createStatement();
    ResultSet rs=null;
    String query="select * from examstudent";
    PreparedStatement ps=connection.prepareStatement(query);
    rs=ps.executeQuery();
	while(rs.next())
	{
     sb.append(rs.getString(1));
     sb.append(",");
     sb.append(rs.getString(2));
     sb.append(",");
     sb.append(rs.getString(3));
     sb.append(",");
     sb.append(rs.getString(4));
     sb.append(",");
     sb.append(rs.getString(5));
     sb.append(",");
     sb.append(rs.getString(6));
     sb.append(",");
     sb.append(rs.getString(7));
     sb.append(",");
     sb.append(rs.getString(8));
     sb.append(",");
     sb.append(rs.getString(9));
     sb.append(",");
     sb.append(rs.getString(10));
     sb.append("\r\n");
	}
	pw.write(sb.toString());
    pw.close();
    out.println("<h1>File Exported Succesfully </h1>");
}
catch(Exception e){
out.println(e);
}
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter the File Name</h1>");
}
%>
<h1><a href="ImportMainSeatingChart.jsp">Back To Home</a></h1>
</body>
</html>