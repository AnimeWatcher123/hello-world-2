<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int roll=Integer.parseInt(request.getParameter("a"));
String name=request.getParameter("b");
int age=Integer.parseInt(request.getParameter("c"));
try
{	
	Class.forName("com.mysql.jdbc.Driver");
	String connectionURL = "jdbc:mysql://localhost:3307/first";
	Connection con = DriverManager.getConnection(connectionURL,"root","");
	if(!con.isClosed())
	{
		out.println("sucessfully connected to "+"MYSQL serverr using TCP/IP...<BR>");
	}
	
	Statement st=con.createStatement();
	
    String str="insert into details(roll_no,name,age)values("+roll+",'"+name+"',"+age+")";
	int i=st.executeUpdate(str);

	ResultSet resultSet = null;
	String sql ="select * from details";
	resultSet = st.executeQuery(sql);
%>
	<table border=1>
    <tr>
    	<th>roll_no</th>
    	<th>name</th>
    	<th>age</th>
    </tr>
<%
    while(resultSet.next())
	{
%>
	<tr>
    	<td><%=resultSet.getString("roll_no") %></td>
    	<td><%=resultSet.getString("name") %></td>
    	<td><%=resultSet.getString("age") %></td>
    </tr>
	<%}%>
    </table>
	<%	
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
	
</body>
</html>