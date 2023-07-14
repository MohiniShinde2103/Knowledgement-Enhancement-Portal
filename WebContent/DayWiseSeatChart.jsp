<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Day Wise Seat Chart</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<style>
#butt1
{
width: 360px;
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
width: 290px;
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
<div class="simple-form" >
<form action="insertdatacsvday.jsp" method="post">
<fieldset id="registration">
<font color="white" font size=4px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Insert Day-Wise Seating Chart" id="butt1"/></a></td>
	<tr><td>Choose Day-Wise Seating Chart CSV/Excel File to Upload:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<form action="insertdatacsvday.jsp" method="post">
	<td><input type="file" name="file"></td>
	<td><input type="submit" value="import" id="button"></td>
	</form></tr>
	<tr><td>Delete Main Seating Chart Uploaded CSV/Excel</td>
	<td><a href="deletecsvday.jsp"><input type="button" name="del"  id="button" value="Delete"></a></td></tr>
</table></font><br><hr><br><br>
	<form action="export.jsp">
	<font color="white" font size=4px><b>Export CSV/Excel File<b></font>&emsp;&emsp;&emsp;&emsp;&emsp;
	<input type="text" placeholder="Enter file name you want to export data" name="filename" id="butt1">
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