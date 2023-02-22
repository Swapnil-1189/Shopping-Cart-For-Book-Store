import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerServlet")
public class Customer extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String q=req.getParameter("QTY");
		
		System.out.println("Book Quantity is="+q);
		
		HttpSession session=req.getSession();
		String bkid=(String) session.getAttribute("BKID");
		
		System.out.println("Book Id in purchase page="+bkid);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded in Customer  Page ");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book_shop", "root", "root");
			System.out.println("connection success in Customer Page");
			
			PreparedStatement pstm=con.prepareStatement("select * from books where book_id=?");
			pstm.setString(1, bkid);
			
			ResultSet rs=pstm.executeQuery();
			session.setAttribute("rs3", rs);
			session.setAttribute("qty", q);

//			while(rs.next())
//			{
//				
//				System.out.println(rs.getString("books_name"));
//				System.out.println(rs.getString("author"));
//				System.out.println(rs.getInt("price"));
//			}
			
			resp.sendRedirect("CustomerPage.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
	}
}
