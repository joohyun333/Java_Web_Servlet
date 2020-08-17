package upload.service;

import java.util.List;

import upload.model.UploadDao;
import upload.model.UploadException;
import upload.model.UploadRec;



	public class UploadService 
	{

		private static UploadService instance;
		
		public static UploadService	getInstance() throws UploadException
		{
			if( instance == null )
			{
				instance = new UploadService();
			}
			return instance;
		}
		
		private UploadService()
		{
			
		}
		
		public void insert( UploadRec rec ) throws UploadException
		{
			UploadDao.getInstance().insert(rec);			
		}
		
		
		
		public List <UploadRec> selectList() throws UploadException
		{
			return UploadDao.getInstance().selectList();
		}
		
		public UploadRec seleteById( int idx )throws UploadException
		{
			return UploadDao.getInstance().selectById(idx); 
		}
	}