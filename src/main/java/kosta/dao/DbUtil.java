package kosta.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
	 * db연동을 위한 로드연결 닫기
	 * 	:dbcp기술적용 (context.xml)ㅇ
	 * */
public class DbUtil {
	private static DataSource ds; //ds는 커넥션 관리하는 객체 
	//db로드
	static {
		try {
		/*Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		 ds = (DataSource)envContext.lookup("jdbc/myoracle");*/
			
			//짧게 해보기
			Context initContext = new InitialContext();
			ds=(DataSource )initContext.lookup("java:/comp/env/jdbc/myoracle");//내가 바꿀수 있음 context에 있는것과 연결
		}catch (Exception e) {
			e.printStackTrace();
		}
	}//static끝
	
	/**
	 * 연결
	 * */
	public static Connection getConnection() throws SQLException{
		Connection conn = ds.getConnection();
		return conn;
		
	}
	/**
	 * 닫기- 사용된 객체 닫기 - select인 경우
	 * */
	public static void dbClose(Connection con, Statement st, ResultSet rs){
		try{
	         if(rs != null) rs.close();
	         dbClose(con, st);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }
	      
	   }
	   /**
	    *  닫기 - 사용된 객체 닫기 - DML or DDL 인 경우
	    * */
	   public static void dbClose(Connection con, Statement st) {
	      try {
	         if(st != null) st.close();
	         if(con != null) con.close();
	   
	   }catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }

}//class 끝
