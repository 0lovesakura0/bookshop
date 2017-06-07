package com.book.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		// TODO Auto-generated method stub
		response.getWriter()
				.append("{\"total\":24,\"maxAge\":37,\"avgAge\":26.2500,\"minAge\":0,\"data\":[{\"city\":\"\",\"age\":27,\"gender\":2,\"dept_id\":\"sc\",\"email\":\"wjm@qq.com\",\"position_name\":\"销售员\",\"salary\":\"3681\",\"createtime\":\"2012-01-31T10:53:40\",\"school\":\"河北科技大学\",\"name\":\"王佳美\",\"educational_name\":\"本科\",\"married\":1,\"educational\":\"2\",\"id\":\"12dfbe12-8a80-4bd6-9d88-f36b505408f8\",\"birthday\":\"1985-07-25T00:00:00\",\"country\":\"\",\"position\":\"sc3\",\"loginname\":\"wjm@qq.com\",\"remarks\":\"\",\"dept_name\":\"财务部\"},{\"city\":\"\",\"age\":25,\"gender\":1,\"dept_id\":\"js\",\"email\":\"wq@163.com\",\"position_name\":\"后台工程师\",\"salary\":\"3201\",\"createtime\":\"2012-01-31T10:53:39\",\"school\":\"天津商业大学\",\"name\":\"王强\",\"educational_name\":\"本科\",\"married\":0,\"educational\":\"2\",\"id\":\"92c2a9fb-5da1-4de5-a516-0c4c96d82ffd\",\"birthday\":\"1987-12-11T00:00:00\",\"country\":\"\",\"position\":\"js2\",\"loginname\":\"wq@163.com\",\"remarks\":\"\",\"dept_name\":\"技术部\"},{\"city\":\"\",\"age\":25,\"gender\":1,\"dept_id\":\"sc\",\"email\":\"sww@163.com\",\"position_name\":\"销售员\",\"salary\":\"3681\",\"createtime\":\"2012-01-31T10:53:35\",\"school\":\"天津科技大学\",\"name\":\"宋蔚伟\",\"educational_name\":\"本科\",\"married\":0,\"educational\":\"2\",\"id\":\"b3d3d2b2-460a-470e-a33c-aff1c8d8a652\",\"birthday\":\"1987-01-21T00:00:00\",\"country\":\"\",\"position\":\"sc3\",\"loginname\":\"sww@163.com\",\"remarks\":\"爱好篮球\",\"dept_name\":\"财务部\"},{\"city\":\"\",\"age\":27,\"gender\":1,\"dept_id\":\"cw\",\"email\":\"zm@163.com\",\"position_name\":\"会计\",\"salary\":\"3839\",\"createtime\":\"2012-01-31T10:50:12\",\"school\":\"贵州财经大学\",\"name\":\"张明\",\"educational_name\":\"本科\",\"married\":0,\"educational\":\"2\",\"id\":\"8197fb45-2b60-4309-820c-e70824fc9b33\",\"birthday\":\"1983-01-13T00:00:00\",\"country\":\"\",\"position\":\"cw2\",\"loginname\":\"zm@163.com\",\"remarks\":\"爱好足球\",\"dept_name\":\"财务部\"}]}")
				.append(request.getContextPath());
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
