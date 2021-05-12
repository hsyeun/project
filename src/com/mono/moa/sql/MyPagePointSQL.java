package com.mono.moa.sql;

public class MyPagePointSQL {
	
	public final int ADD_POINT 	= 1001;
	
	public String getPointSQL(int code) {
		
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		
		case ADD_POINT:
		buff.append("insert into ");
		buff.append("    point(pcode,pmno, spoint, repoint) ");
		buff.append("values( ");
		buff.append("        (select nvl(max(pcode) +1, 100001) from point), ");
		buff.append("        (select mno from member where id =  ? ), 10000, 10000) ");
		break;
		}

		return buff.toString();
	}
}