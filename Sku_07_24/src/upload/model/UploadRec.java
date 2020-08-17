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
		
		// �ø�ȭ���̸����� ȭ���̸��� �ʿ��ѵ� ��α��� ���ԵǱ⿡ ȭ���̸��� ¥��
		// [��] D:\WebWork\First\loadFileTest\a.txt
		//	  �� �̸��� ������ '\'�� ã�� �� �ε����� ���Ѵ�.
		//	  '\' �̰��� ã�� �� �������� ���ڸ� ������ �װ��� ȭ�ϸ��̴�.
		
		int idx = filename.lastIndexOf('\\'); // ( �׷��� ���������� \\ �ΰ��� �����ؾ� \�� �ν� )
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
