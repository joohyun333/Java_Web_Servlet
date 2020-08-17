<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="upload.model.*, upload.service.*" %>
<%
	int idx = Integer.parseInt( request.getParameter("idx") );
	
	try{
		UploadRec rec = UploadService.getInstance().seleteById(idx); //***
		
		response.reset();
		

		String fileName = new String(rec.getFilename().getBytes("euc-kr"), "iso-8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
				
		FileDownHelper.download( rec.getRealpath(), response.getOutputStream());
		response.getOutputStream().close();

	} catch( Exception ex )
	{
		response.setStatus( HttpServletResponse.SC_NOT_FOUND);
	}
%>