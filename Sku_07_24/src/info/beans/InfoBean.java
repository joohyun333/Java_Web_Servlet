package info.beans;

public class InfoBean{
	
	private String name;
	private String id;
	
	public void setName( String name ) {
			this.name = name;	
	}
	
	public void setId( String id ){
			this.id = id;	
	}
	
	public String getName(){
			return name;	
	}
	
	public String getId(){
			return id;	
	}
	
	public String getGender(){
		String sex="";
		char sexNum = id.charAt(7);
		if( sexNum == '1' || sexNum == '3' )
				sex = "남자";
		else if( sexNum == '2' || sexNum == '4' )
				sex = "여자";
		else 
				sex = "모름";
			
		return sex;
	}	
			
}