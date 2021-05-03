package com.mono.moa.sql;

public class MemberSQL {
	
	public final int SEL_MEMB_LIST 	= 1001;
	
	public final int ADD_MEMB 		= 3001;

	public String getSQL(int code) {
		
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		
		case SEL_MEMB_LIST:
			buff.append("SELECT ");
			buff.append("    * ");
			buff.append("FROM ");
			buff.append("    member ");
			buff.append("WHERE ");
			buff.append("    isshow = 'Y' ");	// 현재 활동중인 회원만 꺼내온다.
			buff.append("ORDER BY ");
			buff.append("    mno DESC ");
			break;
			
		case ADD_MEMB:
			buff.append("INSERT INTO ");
			buff.append("member ");
			buff.append("    (mno, name, id, pw, tel, email, gen, birth) ");
			buff.append("VALUES( ");
			buff.append("    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), ");
			buff.append("    ?, ?, ?, ?, ?, ?, ? ");
			buff.append(") ");
			break;
		}
		return buff.toString();
	}
}
