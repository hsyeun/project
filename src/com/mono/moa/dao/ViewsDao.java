package com.mono.moa.dao;

import java.sql.*;

import com.mono.moa.db.DBCP;
import com.mono.moa.sql.kieun.*;

/**
 * 이 클래스는 모아 프로젝트 데이터베이스 작업 전담 처리 클래스이다.
 * @author	김기은
 * @since	2021.05.12
 * @version	v.1.0
 * @see
 * 			작업 처리 내용
 * 				2021.05.12 - 클래스 작성
 * 							조회수 증가 처리함수 작성
 *
 */

public class ViewsDao {
	private DBCP db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private KESQL kSql;
	
	public ViewsDao() {
		db = new DBCP();
		kSql = new KESQL();
	}
	
	/*
	 조회수 증가 데이터베이스 전담 처리함수
	 */
	public int add_click(int exino) {
		int cnt = 0;
		// 할 일
		// 1. 커넥션 꺼내오기
		con = db.getCon();
		// 2. 질의명령 가져오기
		String sql = kSql.getSQL(kSql.ADD_CLICK);
		// 3. statement 가져오기
		pstmt = db.getPSTMT(con, sql);
		try {
			// 4. 질의명령 완성하기
			pstmt.setInt(1, exino);
			// 5. 질의명령 보내고 결과받기
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
	}

}
