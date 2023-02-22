<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<center>
			<form action="./CustomerServlet">
			
			<h1>Shopping Cart For Book Store </h1>
			
			<b>Selected Book Details are Displayed :	</b>	<br><br>
				
			<%
			try{
				
				ResultSet rs=(ResultSet) session.getAttribute("rs2");
				
				while(rs.next())
				{
			%>
		
         		Book Name :	<%=rs.getString("books_name") %>				<br><br>
				Author	  :	<%=rs.getString("author") %>					<br><br>
				Price     :	<%=rs.getInt("price") %>			            <br><br>
			
			<%
				}
			}		
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
			Quantity  :<input type="text" name="QTY">        			<br><br>
			
			<input type="submit" value="Purchase">
			<br><br>
			</form>
			
			<form action="Index.jsp">
			<input type="submit" value="Cancel">
			
			</form>
			</center>
			
</body>
</html>