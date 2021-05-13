package com.mono.moa.dao;

	import java.util.*;
	import java.sql.*;
	import java.sql.Date;

	import com.mono.moa.db.*;
	import com.mono.moa.sql.*;
	import com.mono.moa.vo.*;
	import com.mono.moa.util.*;
	
	public class BoardDao {
		private DBCP db;
		private Connection con;
		private Statement stmt;
		private PreparedStatement pstmt;
		private ResultSet rs;
		private BoardSQL bSQL;
		
	public BoardDao() {
		db = new DBCP();
		bSQL = new BoardSQL();
	}
	
	
	//게시글 리스트조회 전담 처리함수
	public ArrayList<BoardVO> getList(PageUtil page){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.SEL_BOARD_LIST);
		pstmt = db.getPSTMT(con,sql);
		try {
			pstmt.setInt(1, page.getStartCont());
			pstmt.setInt(2, page.getEndCont());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt("rno"));
				vo.setNno(rs.getInt("nno"));
				vo.setNtitle(rs.getString("ntitle"));
				vo.setNbody(rs.getString("nbody"));
				vo.setCode(rs.getString("code"));
				vo.setWdate(rs.getDate("ndate"));
				vo.setSdate(vo.getWdate());
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return list;
	}
	
	//게시글 총 갯수 조회 전담 처리함수
	public int getTotal() {
		int cnt = 0;
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.SEL_TOTAL_CNT);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt("cnt");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		
		return cnt;
	}
	
	//게시판 분류 작업 처리 전담 처리 함수
	public ArrayList<BoardVO> getBoardList(String code){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.SEL_BOARD_CLASS);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setString(1,code);
			
			rs = pstmt.executeQuery();
			BoardVO vo = new BoardVO();
			vo.setNno(rs.getInt("rno"));
			vo.setNtitle(rs.getString("ntitle"));
			vo.setNbody(rs.getString("nbody"));
			vo.setCode(rs.getString("code"));
			vo.setWdate(rs.getDate("ndate"));
			vo.setSdate(vo.getWdate());
			list.add(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}

		return list;
	}
	
}
