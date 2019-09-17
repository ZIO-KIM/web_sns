package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	/*	public static Connection getConnection() {
		try {
			String dbURL="jdbc:mysql://localhost/sseunghun99?serverTimezone=UTC";
			String dbID="sseunghun99";
			String dbPassword="song12@caf";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}*/
	public static Connection getConnection() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/SnS?serverTimezone=UTC";
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

