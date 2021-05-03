package com.mono.moa.db;

import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

/**
 * @author moa
 * @since 2021.05.03
 * @version v.1.0	
 */
public class DBCP {

	public DataSource ds;
	
	public DBCP() {
		try {
			InitialContext context = new InitialContext();

			ds = (DataSource) context.lookup("java:/comp/env/jdbc/TestDB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		Connection con = null;
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return con;
	}
	
	public Statement getSTMT(Connection con) {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	public PreparedStatement getPSTMT(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public void close(Object o) {
		try {
			if(o instanceof Connection) {
				((Connection)o).close();
			} else if (o instanceof Statement) {
				((Statement)o).close();
			} else if (o instanceof PreparedStatement) {
				((PreparedStatement)o).close();
			} else if (o instanceof ResultSet) {
				((ResultSet)o).close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
