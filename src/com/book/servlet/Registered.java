package com.book.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.DB;
import com.book.util.MD5;

@WebServlet("/registered")
public class Registered extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setHeader("Content-type", "text/html;charset=UTF-8");
		// PrintWriter ob = resp.getWriter();

		resp.getWriter().append("这是注册请求");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			resp.setHeader("Content-type", "text/html;charset=UTF-8");
//			resp.getWriter().append("这是注册请求");
			String userName = req.getParameter("username");
			MD5 md5 = new MD5();
			String password = md5.getMD5ofStr(req.getParameter("password"));
			String sql = "INSERT INTO USER(NAME,PASSWORD) VALUES(?,?)";
			DB db = new DB();
			db.executeUpdate(sql, userName, password);
			String json="{\"success\":true,\"msg\"：\"注册成功\"}";
			req.setAttribute("msg", "注册成功");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.getWriter().append("注册失败！");
		} 

	}
}
