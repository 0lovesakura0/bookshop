package com.book.dao;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DB {
	private static final String configFileName = "/db.properties";
	private static String className = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&characterEncoding=UTF-8";
	private static String uid = "root";
	private static String pwd = "root";
	private static boolean hasLoadConfig = false;

	private Connection conn;
	private PreparedStatement pstt;

	private void loadConfig() {
		if (hasLoadConfig)
			return;
		hasLoadConfig = true;
		String path = DB.class.getResource("/").getFile() + configFileName;
		File f = new File(path);
		if (!f.exists()) {
			return;
		}
		Properties prop = new Properties();
		try {
			prop.load(DB.class.getResourceAsStream(configFileName));
			className = prop.getProperty("ClassName");
			url = prop.getProperty("Url");
			uid = prop.getProperty("Uid");
			pwd = prop.getProperty("Pwd");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public DB() {
		try {
			loadConfig();
			Class.forName(className);
			conn = DriverManager.getConnection(url, uid, pwd);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("连接数据库失败!!");
		}
	}

	private void makePreparedStatement(String sql, Object... paras)
			throws SQLException {
		if (pstt != null) {
			try {
				pstt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		System.out.println(sql);
		pstt = conn.prepareStatement(sql);
		for (int i = 0; i < paras.length; i++) {
			pstt.setObject(i + 1, paras[i]);
		}
	}

	public ResultSet executeQuery(String sql, Object... paras)
			throws SQLException {
		makePreparedStatement(sql, paras);
		return pstt.executeQuery();
	}

	public int executeUpdate(String sql, Object... paras) throws SQLException {
		makePreparedStatement(sql, paras);
		return pstt.executeUpdate();
	}

	public Object executeScalar(String sql, Object... paras) {
		Object obj = null;
		ResultSet rs = null;
		try {
			rs = executeQuery(sql, paras);
			if (rs.next())
				obj = rs.getObject(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		return obj;
	}

	private void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		this.close();
	}

	public void close() {
		if (pstt != null) {
			try {
				pstt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
