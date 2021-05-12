package com.mono.moa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mono.moa.db.DBCP;
import com.mono.moa.sql.*;
import com.mono.moa.vo.*;

public class PointDao {
	DBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	MyPagePointSQL pSQL;
	
	public PointDao() {
	db = new DBCP();
	pSQL = new MyPagePointSQL();
}
	
	public int getPoint(String id) {
		int cnt = 0;
		con = db.getCon();
		String sql = pSQL.getPointSQL(pSQL.ADD_POINT);
		pstmt= db.getPSTMT(con, sql);
		
		try {
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(stmt);
			db.close(con);
		}
		return cnt;
	}
	
}
