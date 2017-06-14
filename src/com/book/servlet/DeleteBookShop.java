package com.book.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.DB;
@WebServlet("/deleteBookShop")
public class DeleteBookShop extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DB db=new DB();
		try {
			Long id=Long.valueOf(req.getParameter("id"));
			String sql="delete from shopcart where id=?";
			int a=db.executeUpdate(sql, id);
			resp.sendRedirect("shopcart1.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendRedirect("shopcart1.jsp");
		}finally {
			db.close();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
}
