package upload.model;

public class UploadRec {
	private int fileIdx;

	private String writer;
	private String explain;
	private String filename;
	private String realpath;

	
	// getter & setter
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		
		// 올린화일이름에서 화일이름만 필요한데 경로까지 포함되기에 화일이름만 짜름
		// [예] D:\WebWork\First\loadFileTest\a.txt
		//	  이 이름의 마지막 '\'를 찾아 그 인덱스를 구한다.
		//	  '\' 이것이 찾아 그 다음부터 글자를 얻으면 그것이 화일명이다.
		
		int idx = filename.lastIndexOf('\\'); // ( 그러나 실제적으로 \\ 두개를 지정해야 \로 인식 )
		String onlyFileName = filename.substring(idx+1);
		
		this.filename = onlyFileName;
	}
	public String getRealpath() {
		return realpath;
	}
	public void setRealpath(String realpath) {
		this.realpath = realpath;
	}

	public int getFileIdx() {
		return fileIdx;
	}
	
	public void setFileIdx(int file_idx) {
		this.fileIdx = file_idx;
	}

	
}
