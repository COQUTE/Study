package com.study.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

//코드의 중복 작성과 메모리 효율을 위해 싱글톤 패턴을 활용한 Template을 생성
public class Template {

	// JDBC 활용을 위한 Connection
	public static Connection conn = null;

	// driver.xml / Properties.loadXML() 활용하여 Connection 객체 할당해주는 static 메서드 작성
	public static Connection getConnection() {
		
		try {
			
			if(conn != null && !conn.isClosed()) {
				return conn;
			}
			
			InputStream inputStream = Template.class.getClassLoader().getResourceAsStream("driver.xml");
			
			System.out.println(inputStream);
			
			if (inputStream == null) {
			    throw new FileNotFoundException("driver.xml 파일을 찾을 수 없습니다.");
			}
			
			Properties prop = new Properties();
			prop.loadFromXML(inputStream);
			
			// driver 메모리에 로드
			Class.forName(prop.getProperty("driver"));
			
			// DriverManager를 통해서 Connection 객체를 생성
			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("userName"), prop.getProperty("userPw"));
			
			// 트랜잭션 처리 직접하기 위해 autoCommit 끄기
			conn.setAutoCommit(false);

		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static Properties getQueryProperties() {
		
		Properties prop = null;
		FileInputStream fis = null;
		
		try {
			prop = new Properties();
			fis = new FileInputStream("src/com/hw/resources/query.xml");
			
			prop.loadFromXML(fis);
			
		} catch(Exception e) {
			e.printStackTrace();
		
		} finally {
			
			try {
				fis.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return prop;
	}
	
	public static void commit(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) conn.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) conn.rollback();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		
		try {
			if(stmt != null && !stmt.isClosed()) stmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		
		try {
			if(rs != null && !rs.isClosed()) rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
