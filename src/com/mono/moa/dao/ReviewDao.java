package com.mono.moa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mono.moa.db.DBCP;
import com.mono.moa.sql.ReviewSQL;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.ReviewVO;

	public class ReviewDao {
		DBCP db;
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		ReviewSQL rSQL;
		
		public ReviewDao() {
			db = new DBCP();
			rSQL = new ReviewSQL();
		}
		
		public int getTotalCnt() {
			int cnt = 0;
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_TOTAL_CNT);
			stmt = db.getSTMT(con);
			
			try {
				rs = stmt.executeQuery(sql);
				rs.next();
				cnt = rs.getInt("cnt");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					db.close(rs);
					db.close(stmt);
					db.close(con);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return cnt;		
		}
		
		public ArrayList<ReviewVO> getPageList(PageUtil page) {
			ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
			
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_PAGE_LIST);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setInt(1, page.getStartCont());
				pstmt.setInt(2, page.getEndCont());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					
					ReviewVO rVO = new ReviewVO();
					
					rVO.setBno(rs.getInt("iqbno"));
					rVO.setMno(rs.getInt("iqmno"));
					rVO.setUpno(rs.getInt("iqupno"));
					rVO.setTitle(rs.getString("iqtitle"));
					rVO.setBody(rs.getString("iqbody"));
					rVO.setWdate(rs.getDate("iqwdate"));
					list.add(rVO);
				} 
			}	catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					db.close(rs);
					db.close(pstmt);
					db.close(con);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 	return list;	
		}
}