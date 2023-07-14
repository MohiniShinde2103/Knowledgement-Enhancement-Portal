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
ResultSet rs=st.executeQuery("select * from examtimetable");
if(rs.next())
{
	out.println("Please delete the previous data");
}
else
{
while ((thisLine = myInput.readLine()) != null)
{
String strar[] = thisLine.split(",");
int p=st.executeUpdate("insert into examtimetable values ('"+strar[0]+"','"+strar[1]+"','"+strar[2]+"','"+strar[3]+"','"+strar[4]+"','"+strar[5]+"','"+strar[5]+"','yes')"); 
st.executeUpdate("insert into examqp values ('"+strar[0]+"','"+strar[1]+"','"+strar[3]+"','"+strar[4]+"','0')"); 
i++;
}
out.println("<h1>File Uploaded Successfully</h1>");
}
}
catch(FileNotFoundException fe)
{
	out.println("<h1 style=\"color:red;\">Enter Valid File Location</h1>");
}
%>
<h1><a href="ImportMainExaminationTimetable.jsp">Back To Home</a></h1>
<br/><br/>
</body>
</html>
</table>
</body>
</html>
