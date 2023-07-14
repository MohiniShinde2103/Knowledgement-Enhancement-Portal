<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Import Main Seating Chart</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<style>
#butt1
{
width: 350px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:white;
border: #01010c;
color: red;
font-size: 20px;
}
#file1
{
width: 250px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:white;
border: #01010c;
color: red;
font-size: 13px;
}
.simple-form{
margin:100px 100px
}


</style>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
</br>

	   <a href="ImportMainExaminationTimetable.jsp"><input type="button" value="Import Main Examination Timetable" id="butt"></a>&nbsp&nbsp
	   <a href="ImportMainSeatingChart.jsp"><input type="button" value="Import Main Seating Chart" id="butt"></a>&nbsp&nbsp
	  <a href="MainExamTimetable.jsp"><input type="button" value="Display Main Timetable" id="butt"></a>&nbsp&nbsp
        <a href="MainSeatingChart.jsp"><input type="button" value="Display Main Seating Chart" id="butt"></a>
          
<div class="simple-form" >
<fieldset id="registration">
<font color="white" fontsize=5px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Insert Main Seating Chart" id="butt1"/></td><td></td><td></td>
	<tr><td><b>Import Main Seating Chart CSV/Excel file</b></td></tr>
	<tr><td>Choose Main Seating CSV/Excel File to Upload:  </td>
	<td>
	<form action="insertdatacsv.jsp" method="post">
	<input type="file" name="file" id="abc">
	<input type="submit" value="import" id="button">
	</form></td></tr>
	<tr><td>Delete Main Seating Chart Uploaded CSV/Excel</td>
	<td><a href="deletecsv.jsp"><input type="button" name="del"  id="button" value="Delete"></a></td></tr>
	
</table>	
</font>
<br><hr><br><br>
	<form action="exportmain.jsp">
	<font color="white" font size=4px><b>Export CSV/Excel File<b></font>&emsp;&emsp;&emsp;&emsp;&emsp;
	<input type="text" placeholder="Enter file name you want to export data" name="filename1" id="butt1">
	<input type="submit" name="export" value="Export" id="butt">
	</a></form>
</fieldset>
<br/><br/><br/>
</div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>