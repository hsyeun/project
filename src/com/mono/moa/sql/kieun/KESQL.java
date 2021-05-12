package com.mono.moa.sql.kieun;

public class KESQL {
	public final int ADD_CLICK 	=	2001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case ADD_CLICK:
			buff.append("UPDATE ");
			buff.append("    exinfo ");
			buff.append("SET ");
			buff.append("    exiclick = exiclick + 1 ");
			buff.append("WHERE ");
			buff.append("    exino = ? ");
			break;
		}
		return buff.toString();
	}
}
;