package com.mono.moa.dao;

import java.util.*;
import java.sql.*;
import java.sql.Date;

import com.mono.moa.db.*;
import com.mono.moa.sql.*;
import com.mono.moa.vo.*;
import com.mono.moa.util.*;

public class EventDao {
	private DBCP db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private EventSQL eSQL;
	
	public EventDao() {
		db = new DBCP();
		eSQL = new EventSQL();
	}
	
	
//전시이벤트 조회 전담 처리 함수
	public ArrayList<EventVO> getList(PageUtil page){
		ArrayList<EventVO> list = new ArrayList<EventVO>();
		con = db.getCon();
		String sql = eSQL.getSQL(eSQL.SEL_EVT_LIST);
		pstmt = db.getPSTMT(con,sql);
		try {
			pstmt.setInt(1, page.getStartCont());
			pstmt.setInt(2, page.getEndCont());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EventVO vo = new EventVO();
				vo.setEvtno(rs.getInt("evtno"));
				vo.setEvtexino(rs.getInt("evtexino"));
				vo.setExiprice(rs.getInt("exiprice"));
				vo.setEvtcode(rs.getString("evtcode"));
				vo.setEvtcontent(rs.getString("evtcontent"));
				vo.setExiname(rs.getString("exiname"));
				vo.setExiperson(rs.getString("exiperson"));
				vo.setIdir(rs.getString("idir"));
				vo.setImgname(rs.getString("imgname"));
				vo.setWdate(rs.getDate("sdate"));
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
	
//전시 이벤트 갯수 조회	전담 처리함수
	
		public int getTotal() {
			int cnt = 0;
			con = db.getCon();
			String sql = eSQL.getSQL(eSQL.SEL_TOTAL_CNT);
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
}
