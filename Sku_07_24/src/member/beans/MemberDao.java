package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	
	// DB �뿰寃곗떆  愿��븳 蹂��닔 

	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:system";
	private static final String		dbUser		=	"system";
	private static final String		dbPass		=	"Manager1";

		
	private static MemberDao memberDao;
	
	public static MemberDao getInstance() throws MemberException
	{
		if( memberDao == null )
		{
			memberDao =  new MemberDao();
		}
		return memberDao;
	}
	

	private MemberDao() throws MemberException
	{
			
		try{
			
			/********************************************
				1. �뱶�씪�씠踰꾨�� 濡쒕뵫
							
			*/
		
		}catch( Exception ex ){
			throw new MemberException("DB �뿰寃곗떆 �삤瑜�  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * * �쉶�썝愿�由ы뀒�씠釉� MEMBERTEST �뿉  �쉶�썝�젙蹂대�� �엯�젰�븯�뒗 �븿�닔
	 * @param rec
	 * @throws MemberException
	 */
	public void insertMember( Member rec ) throws MemberException
	{
		try {
			 // 0. �뿰寃� 媛앹껜 �뼸�뼱�삤湲�	
			 // 1. sql 臾몄옣 留뚮뱾湲� ( insert臾� )
			 // 2. sql �쟾�넚 媛앹껜 留뚮뱾湲�
			 // 3. sql �쟾�넚
			 // 4. 媛앹껜 �떕湲� ( �뿰寃곌컼泥� �떕�쑝硫� �븞�맖 )
			 
		} catch ( Exception ex ){
			throw new MemberException("硫ㅻ쾭 �엯�젰�떆 �삤瑜�  : " + ex.toString() );			
		}			
	}
	
	/**********************************************************
	 * * �쉶�썝愿�由ы뀒�씠釉� MEMBERTEST�뿉�꽌 湲곗〈�쓽 id媛믨낵 以묐났�릺�뒗吏� �솗�씤�븯�뒗 �븿�닔
	 */
	public boolean isDuplicatedId( String id ) throws MemberException
	{
		boolean flag = false;
		
		try{

			
		}catch( Exception ex ){
			throw new MemberException("以묐났�븘�씠�뵒 寃��궗�떆 �삤瑜�  : " + ex.toString() );			
		}
			
		return flag;
	}
}
