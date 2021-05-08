package com.mono.moa.dao;

import java.util.*;
import java.sql.*;
import java.sql.Date;
import javax.sql.DataSource;
import javax.swing.DebugGraphics;

import com.mono.moa.db.*;
import com.mono.moa.sql.*;
import com.mono.moa.vo.*;

/**
 * @author	moa
 * @since	2021.05.04
 * @version	v.1.0
 *
 */
public class MemberDao {
	DBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	MemberSQL mSQL;
	
	public MemberDao() {
		db = new DBCP();
		mSQL = new MemberSQL();
	}
	
	public int getIdCnt(String id) {
		int cnt = 0;
		
		con = db.getCon();
		String sql = mSQL.getSQL(mSQL.SEL_ID_CHECK);
		pstmt = db.getPSTMT(con, sql);
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
				db.close(pstmt);
				db.close(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int addMember(MemberVO mVO) {
		
		int cnt = 0 ;
		con = db.getCon();
		String sql = mSQL.getSQL(mSQL.ADD_MEMB);
		pstmt = db.getPSTMT(con, sql);
		
		try {
			pstmt.setString(1, mVO.getName());
			pstmt.setString(2, mVO.getId());
			pstmt.setString(3, mVO.getPw());
			pstmt.setString(4, mVO.getTel());
			pstmt.setString(5, mVO.getEmail());
			pstmt.setString(6, mVO.getGen());
			pstmt.setString(7, mVO.getBirth());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
	}
	
	
	public ArrayList<MemberVO> getMembList(){		
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		con = db.getCon();
		String sql = mSQL.getSQL(mSQL.SEL_MEMB_LIST);
		stmt = db.getSTMT(con);
		
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVO mVO = new MemberVO();
				mVO.setMno(rs.getInt("mno"));
				mVO.setName(rs.getString("name"));
				mVO.setId(rs.getString("id"));
				mVO.setPw(rs.getString("pw"));
				mVO.setTel(rs.getString("tel"));
				mVO.setEmail(rs.getString("email"));
				mVO.setGen(rs.getString("gen").equals("M") ? "남자" : "여자");
				mVO.setBirth(rs.getString("birth"));
				mVO.setjDate(rs.getDate("joindate"));
				mVO.setjTime(rs.getTime("joindate"));
				list.add(mVO);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
}
