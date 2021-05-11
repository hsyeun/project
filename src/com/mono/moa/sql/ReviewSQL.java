package com.mono.moa.sql;

public class ReviewSQL {
	
	public final int SEL_TOTAL_CNT		= 	1001;
	public final int SEL_PAGE_LIST		= 	1002;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		case SEL_TOTAL_CNT:
			buff.append("SELECT ");
			buff.append("    count(*) cnt ");
			buff.append("FROM ");
			buff.append("    iqboard ");
			buff.append(" 		WHERE ");
			buff.append("  mno = (select mno from member where id = ?) ");
			break;
			
			
		case SEL_PAGE_LIST:
			buff.append(" SELECT ");
			buff.append("  rno, iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, reply, step");
			buff.append("    FROM ");
			buff.append("       ( ");
			buff.append("  SELECT ");
			buff.append("  ROWNUM rno, iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, reply, step ");
			buff.append(" 	        FROM ");
			buff.append(" 	            ( ");
			buff.append(" 	                SELECT ");
			buff.append(" 	                    iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, reply, level - 1 as step ");
			buff.append(" 	                FROM ");
			buff.append(" 	                    iqboard");
			buff.append(" 	                WHERE ");
			buff.append(" 	                   isShow = 'Y' ");
			buff.append(" 		               START WITH ");
			buff.append(" 		                    iqupno IS NULL ");
			buff.append(" 		                CONNECT BY ");
			buff.append(" 		                    PRIOR iqbno = iqupno ");
			buff.append(" 		                ORDER SIBLINGS BY ");
			buff.append(" 		                    iqwdate DESC ");
			buff.append(" 		            ) ");
			buff.append(" 		    ) ");
			buff.append(" 		WHERE ");
			buff.append("  iqmno = (SELECT mno FROM member WHERE id = ?) AND ");
			buff.append(" rno BETWEEN ? AND ? ");
			break;
		}
			return buff.toString();
	}	
}
