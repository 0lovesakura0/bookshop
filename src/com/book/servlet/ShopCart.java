package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.DB;

@WebServlet("/ShopCart")
public class ShopCart extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String userid = req.getParameter("userid");
			String bookid = req.getParameter("bookid");
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			DB db =new DB();
			String sql = "select * from book where id in(select BookId from shopcart where userId = ? and BookId = ?)";
			ResultSet rs =  db.executeQuery(sql,userid,bookid);
			if(rs.next()==false){
				req.setAttribute("msg","没有数据!");
				req.getRequestDispatcher("shopcart.jsp").forward(req, resp);
				return;
			}
			ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据    
			int columnCount = md.getColumnCount();   //获得列数 
			
	        while (rs.next()) {  
	            Map<String,Object> rowData = new HashMap<String,Object>();  
	            for (int i = 1; i <= columnCount; i++) {  
	                rowData.put(md.getColumnName(i), rs.getObject(i));  
	            }  
	            list.add(rowData);
	            req.setAttribute("list",list);
	            req.getRequestDispatcher("shopcart.jsp").forward(req, resp);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
