import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerRegister")
public class CustomerRegister extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nm=req.getParameter("name");
		String pn=req.getParameter("phn");
		String ad=req.getParameter("add");

		HttpSession session=req.getSession();
		String qty=(String)session.getAttribute("qty");
		int q=Integer.parseInt(qty);
		
		String bkid=(String)session.getAttribute("BKID");
				
		String da=req.getParameter("dtd");
		
		Date d=Date.valueOf(da);
		
		System.out.println(nm+" "+pn+" "+ad+" "+q+" "+bkid+" "+d);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded Customer Register Page");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book_shop","root", "root");
			System.out.println("Connection success Customer Register Page");
			
			PreparedStatement pstm=con.prepareStatement("insert into customer1(cust_name,phone,address,qty,Book_ID,order_date) values(?,?,?,?,?,?)");
			pstm.setString(1, nm);
			pstm.setString(2, pn);
			pstm.setString(3, ad);
			pstm.setInt(4, q);
			pstm.setString(5, bkid);
			pstm.setDate(6, d);
			
			int i=pstm.executeUpdate();
			
			if(i!=0)
			{
				System.out.println("Record inserted");
				resp.sendRedirect("ThankYou.jsp");
			}
			else
			{
				System.out.println("Error");
			}
			con.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
