package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.dao.DB;
@WebServlet("/SearchShopCart")
public class SearchShopCart extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DB db = new DB();
		try {
			HttpSession session = req.getSession();
			String sql = "SELECT * FROM shopcart sc,book bk WHERE bk.id=sc.BookId AND sc.userId=?";
			ResultSet rs = db.executeQuery(sql, session.getAttribute("LoginUser"));
			String json = "{\"success\":true,\"data\":[";
			while (rs.next()) {
				int a = new Random().nextInt(4);
				String message = "<h4>" + rs.getString("name") + "</h4>" + "作者：" + rs.getString("author") + "<br/>"
						+ "价格：" + rs.getString("price");
				json += "{\"id\":\"" + rs.getLong("id") + "\"," + "\"name\":\"" + rs.getString("name") + "\","
						+ "\"price\":\"" + rs.getString("price") + "\",\"content\":\"" + rs.getString("content") + "\","
						+ "\"number\":\"" + rs.getInt("number") + "\"," + "\"name\":\"" + rs.getString("name") + "\","
						+ "\"author\":\"" + rs.getString("author") + "\"," + "\"type\":\"" + rs.getString("type")
						+ "\",\"img\":\"img/book/" + (a + 1)
						+ ".jpg\",\"message\":\"" + message + "\"},";
			}
			json = json.substring(0, json.length() - 1) + "]}";
			resp.setHeader("Content-type", "text/html;charset=UTF-8");
			// TODO Auto-generated method stub
			resp.getWriter().append(json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.setHeader("Content-type", "text/html;charset=UTF-8");
			resp.getWriter().append("{\"success\":false,\"msg\":\""+e.getMessage()+"\"");
		} finally {
			db.close();
		}

	}
}
