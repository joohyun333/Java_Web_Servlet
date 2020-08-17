package upload.model;


public class UploadException extends Exception
{
  public UploadException(){
  		super();
  	}
  	
  public UploadException(String error){
  		super( error );
  	}
 		
}