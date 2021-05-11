package com.mono.moa.dao;

import java.sql.*;
import java.util.ArrayList;

import com.mono.moa.sql.*;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.*;
import com.mono.moa.db.*;

public class ExinfoDao {
	DBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	ExhibitSQL eSQL;
	
	public ExinfoDao() {
		db = new DBCP();
		eSQL = new ExhibitSQL();
	}
	
	// 총게시물 갯수 조회 전담 처리함수
	public int getTotal() {
		int cnt = 0;
		con = db.getCon();
		String sql = eSQL.getSQL(eSQL.SEL_TOTAL);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt("cnt");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return cnt;
	}
	
	
	// 전시 정보조회 db 작업전담 처리함수
	public ExinfoVO getExInfo(int exino) {
		ExinfoVO eVO = new ExinfoVO();
		
		con = db.getCon();
		String sql = eSQL.getSQL(eSQL.SEL_EXI_INFO);
		
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, exino);
			rs = pstmt.executeQuery();
			rs.next();
			eVO.setExino(rs.getInt("exino"));
			eVO.setExiecno(rs.getInt("exiecno"));
			eVO.setExiperson(rs.getString("exiperson"));
			eVO.setExiname(rs.getString("exiname"));
			eVO.setExisdate(rs.getDate("exisdate"));
			eVO.setExiedate(rs.getDate("exiedate"));
			eVO.setExiprice(rs.getInt("exiprice"));
			eVO.setExiage(rs.getString("exiage"));
			eVO.setExiexpno(rs.getInt("exiexpno"));
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		
		return eVO;
	}
		
		
		/*
		// 메인페이지용 최근 전시정보 조회 전담처리함수
		public ExinfoVO getLatest(int exino) {
			ArrayList<ExinfoVO> list = new ArrayList<ExinfoVO>();
			
			con = db.getCon();
			String sql = eSQL.getSQL(eSQL.SEL_LATEST_INFO);
			
			pstmt = db.getPSTMT(con, sql);
			try {
				pstmt.setInt(1, page.getStartCont());
				pstmt.setInt(2, page.getEndCont());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ExinfoVO vo = new ExinfoVO();
					
					vo.setExino(rs.getInt("exino"));
					vo.setExiecno(rs.getInt("exiecno"));
					vo.setExiperson(rs.getString("exiperson"));
					vo.setExiname(rs.getString("exiname"));
					vo.setExisdate(rs.getDate("exisdate"));
					vo.setExiedate(rs.getDate("exiedate"));
					vo.setExiprice(rs.getInt("exiprice"));
					vo.setExiage(rs.getString("exiage"));
					vo.setExiexpno(rs.getInt("exiexpno"));
					
					list.add(vo);
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(rs);
				db.close(pstmt);
				db.close(con);
			}
			
			return list;
		}
		*/
		// 메인페이지용 최근 전시정보 조회 전담처리함수
		public ArrayList<ExinfoVO> getLatest(PageUtil page) {
			ArrayList<ExinfoVO> list = new ArrayList<ExinfoVO>();
			
			con = db.getCon();
			String sql = eSQL.getSQL(eSQL.SEL_LATEST_INFO);
			
			pstmt = db.getPSTMT(con, sql);
			try {
				pstmt.setInt(1, page.getStartCont());
				pstmt.setInt(2, page.getEndCont());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ExinfoVO vo = new ExinfoVO();
					
					vo.setExino(rs.getInt("exino"));
					vo.setExiecno(rs.getInt("exiecno"));
					vo.setExiperson(rs.getString("exiperson"));
					vo.setExiname(rs.getString("exiname"));
					vo.setExisdate(rs.getDate("exisdate"));
					vo.setExiedate(rs.getDate("exiedate"));
					vo.setExiprice(rs.getInt("exiprice"));
					vo.setExiage(rs.getString("exiage"));
					vo.setExiexpno(rs.getInt("exiexpno"));
					vo.setStartdate(vo.setSdate(vo.getExisdate()));
					vo.setEnddate(vo.setSdate(vo.getExiedate()));
					
					list.add(vo);
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(rs);
				db.close(pstmt);
				db.close(con);
			}
			
			return list;
		}
		
}
