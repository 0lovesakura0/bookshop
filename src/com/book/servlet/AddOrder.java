package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import com.book.dao.DB;

@WebServlet("/addOrder")
public class AddOrder extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data = req.getParameter("data");
		String[] datas = data.split(";");
		String userId = (String) req.getSession().getAttribute("LoginUser");
		String sql = "insert into BookOrder (time,userId,zong) values(?,?,?)";
		resp.setHeader("Content-type", "text/html;charset=UTF-8");
		DB db = new DB();
		try {
			int a = 0;
			a = db.executeUpdate(sql, new Date(), userId, req.getParameter("zong"));
			sql = "select max(id) as id from BookOrder where userId=?";
			ResultSet rs = db.executeQuery(sql, userId);
			if (rs.next()) {
				Long id= rs.getLong("id");
				for (int i = 0; i < datas.length; i++) {
					sql = "update shopcart set orderId=? where id=?";
					db.executeUpdate(sql, id, datas[i]);
				}
				resp.getWriter().append("{\"success\":true,\"msg\":\"提交成功\"}");
			}else{
				throw new SQLException("查无数据");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.getWriter().append("{\"success\":false,\"msg\":\"" + e.getMessage() + "\"}");
		}
	}
}
