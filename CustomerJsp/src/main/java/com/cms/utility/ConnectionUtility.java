package com.cms.utility;

	import java.io.FileInputStream;
	import java.io.FileNotFoundException;
	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.Properties;

	public class ConnectionUtility {
		public static Connection con;

		public static Connection getConnection() throws FileNotFoundException, IOException, SQLException {
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
			FileInputStream fi = new FileInputStream("C:\\servlets\\CustomerJsp\\src\\main\\resources\\customer.properties");
			Properties pro = new Properties();
			pro.load(fi);

			con = DriverManager.getConnection(pro.getProperty("url"), pro.getProperty("username"),
					pro.getProperty("password"));
			
			
			return con;
		}

		public static void closeConnection(Connection con, PreparedStatement pst) throws SQLException {
			if (pst != null) {

				pst.close();
			}
			if (con != null) {

				con.close();
			}
		}

		public static void closeConnection(Connection con, PreparedStatement pst, ResultSet rs) throws SQLException {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {

				con.close();
			}
		}
	}
