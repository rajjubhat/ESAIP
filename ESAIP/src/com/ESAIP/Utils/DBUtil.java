package com.ESAIP.Utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * DBUtil Class is useful in DB operation.
 */
public class DBUtil {
	private static Logger log = Logger.getLogger(DBUtil.class);
	private Properties prop = null;
	public static final String MySQL_DRIVER = "com.mysql.jdbc.Driver";
	private static String MySQL_URL = null;
	private String HOST = null;
	private String PORT = null;
	private String DATABASE = null;
	private static String DB_USERNAME = null;
	private static String DB_PASSWORD = null;

	static {
		try {
			Class.forName(MySQL_DRIVER);
		} catch (ClassNotFoundException e) {
			log.error("Error in loading Driver jar file in DBUtil class: " + e);
		}
	}

	public DBUtil() {
		prop = new Properties();
		InputStream inStr = this.getClass().getClassLoader().getResourceAsStream("Database.properties");
		try {
			prop.load(inStr);
		} catch (IOException e) {
			log.error("Error fetching the properties file");
		}

		HOST = getPropertyValue("HOST");
		PORT = getPropertyValue("PORT");
		DATABASE = getPropertyValue("DATABASE");
		DB_USERNAME = getPropertyValue("USERNAME");
		DB_PASSWORD = getPropertyValue("PASSWORD");
		MySQL_URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
	}

	private String getPropertyValue(String key) {
		return prop.getProperty(key);
	}

	/*
	 * This getConnection() method return a connection object.
	 */
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(MySQL_URL, DB_USERNAME, DB_PASSWORD);
		} catch (SQLException e) {
			log.error("problem in creating connection in DBUtil class: " + e);
		}
		return con;
	}

	/*
	 * closeResource() method closes all the resources after being used.
	 * 
	 */
	public void closeResource(ResultSet rs, PreparedStatement pstmt, Statement st, Connection con) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			log.error("problem in closing result set object in DBUtil class: " + e);
		}

		try {
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
		} catch (SQLException e) {
			log.error("problem in closing prepared statement object in DBUtil class: " + e);
		} finally {
			try {
				if (st != null) {
					st.close();
					st = null;
				}
			} catch (SQLException e) {
				log.error("problem in closing statement object in DBUtil class: " + e);
			}
			try {
				if (con != null) {
					con.close();
					con = null;
				}
			} catch (SQLException e) {
				log.error("problem in closing connection object in DBUtil class: " + e);
			}
		}
	}
}
