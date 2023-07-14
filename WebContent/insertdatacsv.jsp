<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<body>
<% 
try{
String file=request.getParameter("file");
   String fName1 ="D:\\demo\\ExamSeattingArrangement\\"+file;
   File f=new File(fName1);
   String fName=f.getPath();
   String thisLine; 
FileInputStream fis = new FileInputStream(fName);
DataInputStream myInput = new DataInputStream(fis);
int i=0;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examstudent");
if(rs.next())
{
	out.println("<h1 style=\"color:red;\">Please delete the previous data</h1>");
}
else
{
while ((thisLine = myInput.readLine()) != null)
{
String strar[] = thisLine.split(",");
int p=st.executeUpdate("insert into examstudent values('"+strar[0]+"','"+strar[1]+"','"+strar[2]+"','"+strar[3]+"','"+strar[4]+"','"+strar[5]+"','"+strar[6]+"','"+strar[7]+"','"+strar[8]+"','"+strar[9]+"','none','present','none','none')"); 
i++;
}
out.println("<h1>File Uploaded Successfully</h1>");
}
}
catch(FileNotFoundException fe)
{
	out.println("<h1>Enter Valid File Location</h1>");
}
catch(ArrayIndexOutOfBoundsException fe)
{
	out.println("<h1>File Uploaded Successfully</h1>");
}
%>
<h1><a href="ImportMainSeatingChart.jsp">Back To Home</a></h1>
<br/><br/>
</body>
</html>
</table>
</body>
</html>
