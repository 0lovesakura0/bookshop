package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.DB;
import com.book.mobel.Book;
@WebServlet("/bookInfo")
public class BookInfo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DB db=new DB();
		try {
			String bookId=req.getParameter("bookId");
			String sql="SELECT * FROM book WHERE id=?";
			ResultSet rs=db.executeQuery(sql, bookId);
			Book book=new Book();
			if (rs.next()) {
				book.setAuthor(rs.getString("author"));
				book.setContent(rs.getString("content"));
				book.setId(rs.getLong("id"));
				book.setName(rs.getString("name"));
				book.setNumber(rs.getLong("number"));
				book.setPrice(rs.getFloat("price"));
				book.setType(rs.getString("type"));
				req.setAttribute("rs", book);	
			}else{
				req.setAttribute("rs", null);
			}
			req.getRequestDispatcher("info.jsp").forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.close();
		}
	}
}
