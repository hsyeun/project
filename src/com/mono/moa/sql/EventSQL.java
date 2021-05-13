package com.mono.moa.sql;

public class EventSQL {
	public final int SEL_EVT_LIST	=	1001;
	public final int SEL_TOTAL_CNT	=	1002;
	
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		
		case SEL_EVT_LIST:
			buff.append("SELECT ");
			buff.append("    evtno, evtexino, evtcode, evtcontent,sdate, edate, exiname, exiprice, exiperson, idir, imgname ");
			buff.append("FROM ");
			buff.append("   ( ");
			buff.append("    SELECT "); 
			buff.append("        ROWNUM rno, evtno, evtexino,evtcontent,evtcode, sdate, edate, exiname, exiprice, exiperson, idir, imgname ");
			buff.append("    FROM ");
			buff.append("        ( ");
			buff.append("            SELECT ");
			buff.append("                evtno, evtexino, evtcode, evtcontent, sdate, edate, exiname,exiprice, exiperson, idir, imgname ");
			buff.append("            FROM "); 
			buff.append("               event, exinfo, image ");
			buff.append("            WHERE ");
			buff.append("               evtexino(+) = exino ");
			buff.append("                AND imgno = exino ");
			buff.append("                AND event.isShow = 'Y' ");
			buff.append("                AND exinfo.isShow = 'Y' ");
			buff.append("                AND image.isShow = 'Y' ");
			buff.append("          ) ");
			buff.append("    ) ");
			buff.append("WHERE ");
			buff.append("    rno BETWEEN ? AND ? ");     
			buff.append("ORDER BY ");
			buff.append("	evtno DESC ");
		break; 
		
		case SEL_TOTAL_CNT:
			buff.append("SELECT ");
			buff.append("    COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("    event ");
			buff.append("WHERE ");
			buff.append("    isShow= 'Y' ");
		break;
		}
		return buff.toString();
		
	}
			
}
