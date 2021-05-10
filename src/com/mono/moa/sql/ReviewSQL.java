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
			break;
			
			
		case SEL_PAGE_LIST:
			buff.append(" SELECT ");
			buff.append("  rnum, iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, step");
			buff.append("    FROM ");
			buff.append("       ( ");
			buff.append("  SELECT ");
			buff.append("  ROWNUM rnum, iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, step ");
			buff.append(" 	        FROM ");
			buff.append(" 	            ( ");
			buff.append(" 	                SELECT ");
			buff.append(" 	                    iqbno, iqtitle, iqbody, iqmno, iqupno, iqwdate, level - 1 as step ");
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
			buff.append(" rnum BETWEEN ? AND ? ");
			break;
		}
			return buff.toString();
	}	
}
