package upload.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

   public class UploadDao {

      // Single Pattern 
      private static UploadDao instance;
      
      // DB �����  ���� ���� 
      private static final String    dbDriver   =   "oracle.jdbc.driver.OracleDriver";
      private static final String      dbUrl      =   "jdbc:oracle:thin:@127.0.0.1:1521:system";
      private static final String      dbUser      =   "system";
      private static final String      dbPass      =   "Manager1";
      
      
      private Connection          con;   
      
      //--------------------------------------------
      //#####    ��ü �����ϴ� �޼ҵ� 
      public static UploadDao   getInstance() throws UploadException
      {
         if( instance == null )
         {
            instance = new UploadDao();
         }
         return instance;
      }
      
      private UploadDao() throws UploadException
      {
      
         try{
            
            /********************************************
               1. ����Ŭ ����̹��� �ε�
                  ( DBCP �����ϸ� ������ �κ� )
            */
            Class.forName( dbDriver );   
         }catch( Exception ex ){
            throw new UploadException("ȭ�� ���ε� ) DB ����� ����  : " + ex.toString() );   
         }
         
      }
      
      /*
       * ����Ÿ�� �Է��ϴ� �Լ�
       */
      public void insert( UploadRec rec ) throws UploadException
      {

         PreparedStatement ps = null;
         try{
            con   = DriverManager.getConnection( dbUrl, dbUser, dbPass );
            
            String sql   = "INSERT INTO uploadtest(file_idx, writer, filename, realpath, explain)  VALUES(seq_fileidx_upload.nextval,?,?,?,?)";  
            ps = con.prepareStatement(sql);
            ps.setString(1, rec.getWriter());
            ps.setString(2, rec.getFilename());
            ps.setString(3, rec.getRealpath());
            ps.setString(4, rec.getExplain());
            ps.executeUpdate();
                  
         }catch( Exception ex ){
            throw new UploadException("ȭ�� ���ε� ) DB�� �Է½� ����  : " + ex.toString() );   
         } finally{
            if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
            if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
         }
      
      }

      /*
       * ���ε� ȭ�� ��� ��ü�� ���� ��
       */
      public List<UploadRec> selectList() throws UploadException
      {
         PreparedStatement ps = null;
         ResultSet rs = null;
         List <UploadRec> mList = new ArrayList <UploadRec>();
         boolean isEmpty = true;
         
         try{
            con   = DriverManager.getConnection( dbUrl, dbUser, dbPass );
            String sql = "SELECT * FROM uploadTest order by file_idx desc";  
            ps = con.prepareStatement( sql );
            rs = ps.executeQuery();
            while( rs.next())
            {
               isEmpty = false;
               UploadRec rec = new UploadRec();
               
               rec.setFileIdx( rs.getInt("file_idx"));
               rec.setWriter(rs.getString("writer"));
               rec.setFilename( rs.getString("filename"));
               rec.setRealpath( rs.getString("realpath"));            
               
               mList.add(rec);
            }
            
            if( isEmpty ) return Collections.emptyList();
            
            return mList;

         }catch( Exception ex ){
            throw new UploadException("ȭ�� ���ε� ) DB�� ��� �˻��� ����  : " + ex.toString() );   
         } finally{
            if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
            if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
            if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
         }      
      }
      
      public UploadRec selectById( int idx ) throws UploadException
      {
         PreparedStatement ps = null;
         ResultSet rs = null;
         UploadRec rec = new UploadRec();         
         try{
            con   = DriverManager.getConnection( dbUrl, dbUser, dbPass );
            String sql      = "SELECT * FROM uploadTest WHERE file_idx=?";  
            ps      = con.prepareStatement( sql );
            ps.setInt(1, idx);
            rs = ps.executeQuery();
            if( rs.next())
            {
               rec.setFileIdx( rs.getInt("file_idx"));
               rec.setWriter(rs.getString("writer"));
               rec.setFilename( rs.getString("filename"));
               rec.setRealpath( rs.getString("realpath"));   
               
            }         
            return rec;
         }catch( Exception ex ){
            throw new UploadException("ȭ�� ������ ) DB�� �ش� idx�� ���� �˻��� ����  : " + ex.toString() );   
         } finally{
            if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
            if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
            if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
         }
      }
}