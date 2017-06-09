package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.dao.DB;

@WebServlet("/AddShopCar")
public class AddShopCar extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		DB db = new DB();
		try {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("LoginUser");
			if (null == id || "".equals(id)) {
				request.setAttribute("msg", "请登录");
				ServletContext application = request.getSession().getServletContext();
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			String bookId = request.getParameter("bookId");

			String sql="";

			ResultSet rs = db.executeQuery("select * from shopcart where userid=? and bookid=?", id, bookId);
			if (rs.next()) {
				sql = "update shopcart set number=? where userId=? and BookId=?";
				int a = db.executeUpdate(sql, rs.getInt("number") + 1, id, bookId);
			} else {
				sql = "INSERT INTO shopcart (userId,BookId,number) VALUES(?,?,?)";
				db.executeUpdate(sql, id, bookId,1);
			}
			response.getWriter().append("{\"success\":true}");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().append("{\"success\":false,\"msg\":\""+e.getMessage()+"\"}");
		} finally {
			db.close();
		}

	}

}
