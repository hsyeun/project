package com.mono.moa.sql;

public class BoardSQL {
	public final int SEL_BOARD_LIST		=	1001;
	public final int SEL_TOTAL_CNT		=	1002;
	public final int SEL_BOARD_CLASS	=	1003;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_BOARD_LIST:
			buff.append("SELECT ");
			buff.append("  		 rno, nno, ntitle, nbody, ndate, code ");
			buff.append("FROM ");
			buff.append(	"( ");
			buff.append("		SELECT ");
			buff.append("  			ROWNUM rno, nno, ntitle, nbody, ndate, code ");
			buff.append("		FROM ");
			buff.append("			( ");
			buff.append("				SELECT ");
			buff.append("					nno, ntitle, nbody, ndate, code ");
			buff.append("				FROM ");
			buff.append("					nboard");
			buff.append("				WHERE ");
			buff.append("    				isShow = 'Y' ");
			buff.append("				ORDER BY ");
			buff.append("					ndate desc");
			buff.append("		) ");
			buff.append("	) ");
			buff.append("WHERE ");
			buff.append("	rno BETWEEN ? AND ? ");
		break;	
		case SEL_TOTAL_CNT:
			buff.append("SELECT ");
			buff.append("    COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("    nboard ");
			buff.append("WHERE ");
			buff.append("    isShow= 'Y' ");
		break;
		case SEL_BOARD_CLASS:
			buff.append("SELECT ");
			buff.append("    nno, ntitle, nbody,ndate,code ");
			buff.append("FROM ");
			buff.append("    nboard ");
			buff.append("WHERE ");
			buff.append("    isShow= 'Y' ");
			buff.append("    AND code= ? ");
		}
		return buff.toString();
	}
}
