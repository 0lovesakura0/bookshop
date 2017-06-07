package com.book.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.dao.DB;
import com.book.util.MD5;

/**
 * 登录方法
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setHeader("Content-type","text/html;charset=UTF-8");
			String username = request.getParameter("username");
			MD5 dm5 =new MD5();
			String password = dm5.getMD5ofStr(request.getParameter("password"));
			
			String sql = "select * from user where name = ?";
			DB db =new DB();
			ResultSet rs = db.executeQuery(sql, username);
			if(rs.next()==false){
				response.getWriter().append("沒有该用戶，請註冊！");
				return ;
			}else{
				String sql1 = "select * from user where name = ? and password = ?";
				DB dbq =new DB();
				ResultSet rs1 = db.executeQuery(sql1,username,password);
				if(rs1.next()==false){
					response.getWriter().append("密码输入错误，请重新输入！");
					return ;
				}
				
				HttpSession sess=request.getSession();
				sess.setAttribute("LoginUser", username);
				request.setAttribute("msg", "登录成功");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "登录失败"+e.getMessage());
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
