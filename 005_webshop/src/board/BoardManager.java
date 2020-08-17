package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardManager {
	
	//데이터베이스 객체변수
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	//paging 처리용 변수
	private int tot; // 전체 레코드수
	private int pList = 10; //페이지당 레코드 수
	private int pageSu; //전체 페이지 수
	
	//생성자에서 데이터베이스 연결
	public BoardManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("db connection err:" + e);
		}
	}
	
	//가장 최근 게시글 번호 구하기
	public int getCurrentNum() {
		String sql = "select max(num) from webshop_board";
		int cnt = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCurrentNum err : + " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return cnt;
	}
	
	
	//게시글 작성
	public void insertData(BoardBean bean){
		String sql = "insert into webshop_board values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getWrite_ip());
			pstmt.setString(8, bean.getWrite_date());
			pstmt.setInt(9, 0);	// readcnt
			pstmt.setInt(10, bean.getGroup_num()); //게시물의 그룹(메인글+답변글을 그룹화)
			pstmt.setInt(11, 0);	// num_in_group(같은 그룹 내에서의 글 순서)
			pstmt.setInt(12, 0);	// nested(답변 글의 계층)
			
			pstmt.executeUpdate();
		} catch (Exception e) {	
			System.out.println("insertData err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	//가장 최근 게시글 번호 구하기
	public int getTot(String searchType, String searchWord) {
		try {	
			conn = ds.getConnection();
			
			if(searchWord==""||searchWord.equals("")||searchWord==null){
				String sql = "select count(*) from webshop_board";
				pstmt = conn.prepareStatement(sql);
			}else{
				String sql = "select count(*) from webshop_board"
						+" where " + searchType + " like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTot err : + " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return tot;
	}
	
	//페이지 처리를 위한 전체 페이지 수 구하기
	public int getPageSu(){
		pageSu = (tot%pList==0)?(tot/pList):((tot/pList)+1);
		return pageSu;
	}
	
	//전체목록출력 - 페이지 처리, 검색어 처리
	public ArrayList<BoardDto> getDataAll(int currentPage, String searchType, String searchWord){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		try {			
			conn = ds.getConnection();
			
			//일반 출력
			//String sql = "select * from webshop_board";
			
			//댓글처리를 위한 정렬 후 출력
			//String sql = "select * from webshop_board order by group_num desc, nested asc, num_in_group desc";

			//댓글처리, 검색어 처리
			if(searchWord==""||searchWord.equals("")||searchWord==null){
				String sql = "select * from webshop_board order by group_num desc, nested asc, num_in_group desc";
				pstmt = conn.prepareStatement(sql);
			}else{
				String sql = "select * from webshop_board where " + searchType + " like ? "
						+ "order by group_num desc, nested asc, num_in_group desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
			}
			
			rs = pstmt.executeQuery();
			
			int startRow = (currentPage-1) * pList;
			for(int i = 0; i< startRow;i++){
				rs.next();

			}
			int k=0;
			while(rs.next()&&k<pList){
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getString("write_date"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getDataAll err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	//전체 목록 출력 - 페이지 처리 page
	/*
	public ArrayList<BoardDto> getDataAll(int currentPage){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		try {			
			conn = ds.getConnection();
			
			//일반 출력
			//String sql = "select * from webshop_board";
			
			//댓글처리를 위한 정렬 후 출력
			String sql = "select * from webshop_board order by group_num desc, nested asc, num_in_group desc";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int startRow = (currentPage-1) * pList;
			for(int i = 0; i< startRow;i++){
				rs.next();

			}
			int k=0;
			while(rs.next()&&k<pList){
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getString("write_date"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
				k++;
			}
		} catch (Exception e) {
			System.out.println("getDataAll err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	*/
	//전체 목록 출력
	/*
	public ArrayList<BoardDto> getDataAll(){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from webshop_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getString("write_date"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getDataAll err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	*/
	
	public BoardDto getData(int num){
		BoardDto dto = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from webshop_board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setMail(rs.getString("mail"));
				dto.setTitle(rs.getString("title"));
				dto.setCont(rs.getString("content"));
				dto.setWrite_ip(rs.getString("write_ip"));
				dto.setWrite_date(rs.getString("write_date"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setGroup_num(rs.getInt("group_num"));
				dto.setNum_in_group(rs.getInt("num_in_group"));
				dto.setNested(rs.getInt("nested"));
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	public void updateData(BoardBean bean){
		try {
			String sql = "update webshop_board set pass=?, mail=?, title=?, content=? where num=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPass());
			pstmt.setString(2, bean.getMail());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getCont());
			pstmt.setInt(5, bean.getNum());
			
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("updateData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public void deleteData(int num){
		try {
			String sql = "delete from webshop_board where num=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public void updateReadCnt(int num){
		try {
			String sql = "update webshop_board set readcnt=readcnt+1 where num=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("updateReadCnt err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
/** 댓글 처리  **/
	//해당 메인글 그룹의 그룹 내 순서 구하기
	public int getCurrent_num_in_group(int groupNum) {
		String sql = "select max(num_in_group) from webshop_board where group_num=?";
		int num_in_group = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, groupNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num_in_group = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCurrent_group_in_Num err : + " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return num_in_group;
	}
	
	//댓글 작성
	public void insertReply(BoardBean bean){
		String sql = "insert into webshop_board values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getWrite_ip());
			pstmt.setString(8, bean.getWrite_date());
			pstmt.setInt(9, 0);	// readcnt
			pstmt.setInt(10, bean.getGroup_num()); //게시물의 그룹(메인글+답변글을 그룹화)
			pstmt.setInt(11, bean.getNum_in_group());	// num_in_group(같은 그룹 내에서의 글 순서)
			pstmt.setInt(12, bean.getNested());	// nested(답변 글의 계층)
			
			pstmt.executeUpdate();
		} catch (Exception e) {	
			System.out.println("insertReply err:" + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
