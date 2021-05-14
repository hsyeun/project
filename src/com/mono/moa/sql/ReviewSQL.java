package com.mono.moa.sql;

public class ReviewSQL {
	
	public final int SEL_TOTAL_CNT		= 	1001;
	public final int SEL_PAGE_LIST		= 	1002;
	public final int SEL_BNO_INFO		= 	1003;
	public final int SEL_UPNO_INFO		= 	1004;
	
	public final int EDIT_INFO			= 	2001;
	
	public final int DEL_QNA			= 	3001;
	
	public final int ADD_QNA			= 	4001;

	
	/* admin ------------------------------------------------------*/
	
	public final int SEL_ADMIN_TOTAL_CNT		= 	5001;
	public final int SEL_ADMIN_PAGE_LIST		= 	5002;
	public final int SEL_ADMIN_MNO_ID			= 	5003;
	public final int ADD_ADMIN_QNA				= 	5004;
	public final int EDIT_ADMIN_REPLY			= 	5005;
	public final int EDIT_ADMIN_QNA				= 	5006;
	public final int DEL_ADMIN_REPLY			= 	5007;

	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		case SEL_TOTAL_CNT:
			buff.append("SELECT ");
			buff.append("    count(*) cnt ");
			buff.append("FROM ");
			buff.append("    iqboard ");
			buff.append(" 		WHERE ");
			buff.append("  iqmno = (select mno from member where id = ?) ");
			buff.append("  AND iqupno IS NULL ");
			buff.append("  AND isShow = 'Y' ");
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
			buff.append(" 	                   iqupno IS NULL ");
			buff.append(" 	                   AND isShow = 'Y' ");
			buff.append(" 		               START WITH ");
			buff.append(" 		                    iqupno IS NULL ");
			buff.append(" 		                CONNECT BY ");
			buff.append(" 		                    PRIOR iqbno = iqupno ");
			buff.append(" 		                ORDER SIBLINGS BY ");
			buff.append(" 		                    iqwdate DESC ");
			buff.append(" 		            ) ");
			buff.append(" 		    ) ");
			buff.append(" 		WHERE ");
			buff.append("  iqmno = (SELECT mno FROM member WHERE id = ?) ");
			buff.append(" AND rno BETWEEN ? AND ? ");
			break;

		case SEL_BNO_INFO:
			buff.append("SELECT ");
			buff.append("    * ");
			buff.append("FROM ");
			buff.append("    iqboard ");
			buff.append(" 		WHERE ");
			buff.append("  iqbno = ? ");
			break;
			
		case SEL_UPNO_INFO:
			buff.append("SELECT ");
			buff.append("    * ");
			buff.append("FROM ");
			buff.append("    iqboard ");
			buff.append(" 		WHERE ");
			buff.append("  iqupno = ? ");
			break;	
			
		case ADD_QNA:
			buff.append("INSERT INTO ");
			buff.append("iqboard ");
			buff.append("    (iqbno, iqmno , iqtitle, iqbody) ");
			buff.append("VALUES( ");
			buff.append("    (SELECT NVL(MAX(IQbno) + 1, 10001) FROM iqboard), ");
			buff.append("    (SELECT mno FROM member where id = ?), ");
			buff.append("    ?, ? ");
			buff.append(") ");
			break;
			
		case EDIT_INFO:
			buff.append("UPDATE iqboard ");
			buff.append("SET ");
			buff.append("    iqtitle = ?, iqbody = ?, iqwdate = sysdate ");
			buff.append("WHERE ");
			buff.append("    iqbno = ? ");
			break;
			
		case DEL_QNA:
			buff.append("UPDATE iqboard ");
			buff.append("SET ");
			buff.append("	isShow = 'N' ");
			buff.append("WHERE ");
			buff.append("	iqbno = ? ");
			break;
			
			/* admin ------------------------------------------------------*/
			
		case SEL_ADMIN_TOTAL_CNT:
			buff.append("SELECT ");
			buff.append("    count(*) cnt ");
			buff.append("FROM ");
			buff.append("    iqboard ");
			buff.append("    WHERE iqmno != 1013 ");
			buff.append("  AND iqupno IS NULL ");
			buff.append("  AND isShow = 'Y' ");
			break;
			
			
		case SEL_ADMIN_PAGE_LIST:
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
			buff.append(" 	                   WHERE iqmno != 1013");			
			buff.append(" 	                   AND isShow = 'Y' ");			
			buff.append(" 		               START WITH ");
			buff.append(" 		                    iqupno IS NULL ");
			buff.append(" 		                CONNECT BY ");
			buff.append(" 		                    PRIOR iqbno = iqupno ");
			buff.append(" 		                ORDER SIBLINGS BY ");
			buff.append(" 		                    iqwdate DESC ");
			buff.append(" 		            ) ");
			buff.append(" 		    ) ");
			buff.append(" 		WHERE ");
			buff.append(" rno BETWEEN ? AND ? ");
			break;
			
		case SEL_ADMIN_MNO_ID:
			buff.append("SELECT ");
			buff.append("    id ");
			buff.append("FROM ");
			buff.append("    member ");
			buff.append("    WHERE mno = ? ");
			break;
			
		case ADD_ADMIN_QNA:
			buff.append("INSERT INTO ");
			buff.append("iqboard ");
			buff.append("    (iqbno, iqmno , iqupno, iqbody, iqtitle) ");
			buff.append("VALUES( ");
			buff.append("    (SELECT NVL(MAX(IQbno) + 1, 10001) FROM iqboard), ");
			buff.append("    1013, ");
			buff.append("    ?, ?, 'admin' ");
			buff.append(") ");
			break;
			
		case EDIT_ADMIN_REPLY:
			buff.append("UPDATE iqboard ");
			buff.append("SET ");
			buff.append("    reply='Y' ");
			buff.append("WHERE ");
			buff.append("    iqbno = ? ");
			break;

		case EDIT_ADMIN_QNA:
			buff.append("UPDATE iqboard ");
			buff.append("SET ");
			buff.append("    iqbody = ? ");
			buff.append("WHERE ");
			buff.append("    iqupno = ? ");
			break;
			
		case DEL_ADMIN_REPLY:
			buff.append("UPDATE iqboard ");
			buff.append("SET ");
			buff.append("    isShow = 'N' ");
			buff.append("WHERE ");
			buff.append("    iqupno = ? ");
			break;
		}
			return buff.toString();
	}	
}
