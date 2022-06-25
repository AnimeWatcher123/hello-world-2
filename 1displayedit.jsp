<%@ page import="java.sql.*" %>
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
try
{	
	Class.forName("com.mysql.jdbc.Driver");
	String connectionURL = "jdbc:mysql://localhost:3307/first";
	Connection con = DriverManager.getConnection(connectionURL,"root","");
	Statement st=con.createStatement();
	ResultSet resultSet = null;
	String sql ="select * from details";
	resultSet = st.executeQuery(sql);
%>
    <table border=1>
    <tr>
    	<th>ROLL</th>
    	<th>NAME</th>
    	<th>AGE</th>
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
<%     	
	}
 %>
    </table>	
    <br>
    <form action="2Edit.jsp">
    Roll <input type="number" name="roll_no">
    <input type="submit" value="Edit">
    </form>
<%
con.close();
}
catch(Exception e)
{
 out.println(e);	
}
%>
</body>
</html>