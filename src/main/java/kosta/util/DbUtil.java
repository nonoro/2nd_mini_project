package kosta.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * DB������ ���� �ε� ���� �ݱ�
 *  : DBCP��� ���� (context.xml ����)
 * */
public class DbUtil {
    private static DataSource ds;
    
	/**
	 * �ε�
	 * */
	static {
		try {
			/*Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			 ds = (DataSource)envContext.lookup("jdbc/myoracle");*/
			
			Context initContext = new InitialContext();
			ds=(DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//static ��
	

	
	/**
	 * ����
	 * */
	public static Connection getConnection() throws SQLException {
		Connection conn = ds.getConnection();
		return conn;
	}
	
	/**
	 * �ݱ�  - ���� ��ü �ݱ�- select�ΰ�� 
	 * */
    public static void dbClose(Connection con , Statement st , ResultSet rs) {
    	try {
		  if(rs!=null)rs.close();
	      dbClose(con, st);
    	}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * �ݱ�  - ���� ��ü �ݱ�- DML or DDL �ΰ�� 
	 * */
	public static void dbClose(Connection con , Statement st) {
		try {
			if(st != null)st.close();
			if(con!=null)con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}//classEnd










