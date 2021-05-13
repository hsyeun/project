package com.mono.moa.sql;

public class ExhibitSQL {
	public final int SEL_EXI_INFO		= 1001;
	public final int SEL_EXIE_INFO		= 1002;
	public final int SEL_LATEST_INFO	= 1003;
	public final int SEL_LATESTONE_INFO	= 1004;
	public final int SEL_TOTAL			= 1005;
	public final int SEL_EXI_INFO_CAL	= 1006;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		
		case SEL_EXI_INFO:
			buff.append("SELECT ");
			buff.append("	exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno ");
			buff.append("FROM ");
			buff.append("	exinfo ");
			buff.append("WHERE ");
			buff.append("	exino = ? ");
			buff.append("	AND isshow = 'Y' ");
			break;
		case SEL_EXI_INFO_CAL:
			buff.append("SELECT ");
			buff.append("	exino, exiecno, exiperson, exiname, exisdate ");
			buff.append("FROM ");
			buff.append("	exinfo ");
			buff.append("WHERE ");
			buff.append("	isshow = 'Y' ");
			break;
		case SEL_EXIE_INFO:
			buff.append("SELECT ");
			buff.append("	exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno ");
			buff.append("FROM ");
			buff.append("	exinfo ");
			buff.append("WHERE ");
			buff.append("	exiecno = ? ");
			buff.append("	AND isshow = 'Y' ");
			break;
		case SEL_TOTAL:
			buff.append("SELECT ");
			buff.append("	COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("	exinfo ");
			buff.append("WHERE ");
			buff.append("	isshow = 'Y' ");
			break;
		case SEL_LATESTONE_INFO:
			buff.append("SELECT ");
			buff.append("	exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno ");
			buff.append("FROM ");
			buff.append("	exinfo ");
			buff.append("			WHERE ");
			buff.append("				isshow = 'Y' ");
			buff.append("			ORDER BY ");
			buff.append("				exisdate DESC ");
			buff.append("			) ");
			buff.append("		) ");
			break;
		case SEL_LATEST_INFO:
			buff.append("SELECT ");
			buff.append("	exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno, idir, imgname ");
			buff.append("FROM ");
			buff.append("	( ");
			buff.append("		SELECT ");
			buff.append("    		ROWNUM rno, exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno, idir, imgname ");
			buff.append("		FROM ");
			buff.append("    		( ");
			buff.append("				SELECT ");
			buff.append("		    	    exino, exiecno, exiperson, exiname, exisdate, exiedate, exiprice, exiage, exiexpno, idir, imgname ");
			buff.append("		    	FROM ");
			buff.append("					exinfo, image ");
			buff.append("				WHERE ");
			buff.append("					imgno = exino ");
			buff.append("					AND exinfo.isshow = 'Y' ");
			buff.append("					AND image.isshow = 'Y' ");
			buff.append("				ORDER BY ");
			buff.append("					exisdate DESC ");
			buff.append("			) ");
			buff.append("	) ");
			buff.append("WHERE ");
			buff.append("	rno BETWEEN ? AND ? ");
			break;
		}
		
		return buff.toString();
	}
}
