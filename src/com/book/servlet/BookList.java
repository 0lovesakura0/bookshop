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

/**
 * Servlet implementation class BookList
 */
@WebServlet("/BookList")
public class BookList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String name=request.getParameter("key");
			String sql = "select * from book";
			DB db = new DB();
			ResultSet rs = null;
			if ("".equals(name) || null==name) {
				rs = db.executeQuery(sql, new Object[0]);
			}else{
				sql+="where name=? ";
				rs = db.executeQuery(sql, name);
			}
			
			String json = "{\"success\":true,\"data\":[";
			while (rs.next()) {
				json += "{\"id\":\"" + rs.getLong("id") + "\"," + "\"name\":\"" + rs.getString("name") + "\","
						+ "\"price\":\"" + rs.getString("price") + "\",\"content\":\"" + rs.getString("content") + "\","
						+ "\"number\":\"" + rs.getInt("number") + "\"," + "\"name\":\"" + rs.getString("name") + "\","
						+ "\"author\":\"" + rs.getString("author") + "\"," + "\"type\":\"" + rs.getString("type")
						+ "\"},";
			}
			json = json.substring(0, json.length() - 1) + "]}";
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			// TODO Auto-generated method stub
			response.getWriter().append(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			response.getWriter().append("{\"success\":false,\"msg\":\""+e.getMessage()+"\"");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
