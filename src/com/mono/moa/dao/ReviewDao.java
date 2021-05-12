package com.mono.moa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.mono.moa.db.DBCP;
import com.mono.moa.sql.ReviewSQL;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.MemberVO;
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
		
		public int getTotalCnt(String id) {
			int cnt = 0;
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_TOTAL_CNT);
			pstmt = db.getPSTMT(con,sql);
			
			try {
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
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
		
		public ArrayList<ReviewVO> getPageList(String id, PageUtil page) {
			ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
			
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_PAGE_LIST);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setString(1, id);
				pstmt.setInt(2, page.getStartCont());
				pstmt.setInt(3, page.getEndCont());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					
					ReviewVO rVO = new ReviewVO();
					
					rVO.setRno(rs.getInt("rno"));
					rVO.setBno(rs.getInt("iqbno"));
					rVO.setMno(rs.getInt("iqmno"));
					rVO.setUpno(rs.getInt("iqupno"));
					rVO.setTitle(rs.getString("iqtitle"));
					rVO.setBody(rs.getString("iqbody"));
					rVO.setReply(rs.getString("reply"));
					rVO.setSdate(rs.getDate("iqwdate"));
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
		
		
		public ReviewVO getBnoInfo(int bno) {
			ReviewVO rVO = new ReviewVO();
			
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_BNO_INFO);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();
				while(rs.next()) {
										
					rVO.setBno(rs.getInt("iqbno"));
					rVO.setMno(rs.getInt("iqmno"));
					rVO.setUpno(rs.getInt("iqupno"));
					rVO.setTitle(rs.getString("iqtitle"));
					rVO.setBody(rs.getString("iqbody"));
					rVO.setReply(rs.getString("reply"));
					rVO.setSdate(rs.getDate("iqwdate"));

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
			} 	return rVO;	
		}
		
		public ReviewVO getUpnoInfo(int bno) {
			ReviewVO rVO = new ReviewVO();
			
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.SEL_UPNO_INFO);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();
				rs.next();
										
					rVO.setBno(rs.getInt("iqbno"));
					rVO.setMno(rs.getInt("iqmno"));
					rVO.setUpno(rs.getInt("iqupno"));
					rVO.setTitle(rs.getString("iqtitle"));
					rVO.setBody(rs.getString("iqbody"));
					rVO.setReply(rs.getString("reply"));
					rVO.setSdate(rs.getDate("iqwdate"));

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
			} 	return rVO;	
		}
		
		public int addQna(String id, String title, String body) {
			
			int cnt = 0 ;
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.ADD_QNA);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setString(1, id);
				pstmt.setString(2, title);
				pstmt.setString(3, body);				
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(pstmt);
				db.close(con);
			}
			return cnt;
		}
		
		
		public int editInfo(String title, String body ,int bno) {
			
			int cnt = 0 ;
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.EDIT_INFO);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setString(1, title);
				pstmt.setString(2, body);
				pstmt.setInt(3, bno);
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(pstmt);
				db.close(con);
			}
			return cnt;
		}
		public int delQna(int bno) {
			
			int cnt = 0 ;
			con = db.getCon();
			String sql = rSQL.getSQL(rSQL.DEL_QNA);
			pstmt = db.getPSTMT(con, sql);
			
			try {
				pstmt.setInt(1, bno);
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(pstmt);
				db.close(con);
			}
			return cnt;
		}
		
}