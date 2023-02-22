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
			<h1>Shopping Cart For Book Store </h1>

			<h2>Welcome Page</h2>
			
			<table border="3">
			<tr>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
			</tr>
			
			
			<%
			
			try{
				
				ResultSet rs=(ResultSet)session.getAttribute("rs1");
			
				while(rs.next())
				{	
					%>
			
						<tr>
							<td><a href="Book.jsp?BkID=<%=rs.getString("book_id")%>"><%=rs.getString("books_name")%></a></td>
							<td><%=rs.getString("author")%></td>
							<td><%=rs.getInt("price")%></td>
						</tr>
					<% 	
			
				}
			
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
			}
			
			%>
			
			
		
			
			</table>		
		
		</center>
</body>
</html>