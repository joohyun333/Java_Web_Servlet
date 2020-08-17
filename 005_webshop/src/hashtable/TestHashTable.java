package hashtable;

import java.util.Enumeration;
import java.util.Hashtable;


public class TestHashTable {

	public static void main(String[] args){
		Hashtable<String, Integer> htable = new Hashtable<String,Integer>();
		
		//테이블에 데이터 삽입
		System.out.println("put : 데이터 삽입");
		htable.put("ten", 10);
		htable.put("twenty", 20);
		htable.put("thirty", 30);
		System.out.println(htable);
		System.out.println();

		//데이터 제거
		System.out.println("remove : 데이터 제거");
		htable.remove("thirty");
		System.out.println(htable);
		System.out.println();
		
		//출력
		System.out.println("전체출력 : "+htable);
		System.out.println("해당 키값 출력 : "+htable.get("ten"));
		System.out.println();
		
		//중복키 일 경우 덮어쓰기(default)
		System.out.println("중복키는 덮어쓰기");
		htable.put("ten", 11);
		System.out.println(htable);
		System.out.println();

		//중복 키,값 확인
		System.out.println("중복 키,값이 있는지 확인");
		System.out.println(htable.containsKey("twenty"));
		System.out.println(htable.containsValue(20));
		System.out.println(htable.contains(20));
		System.out.println();
		
		//테이블 복사
		System.out.println("테이블 복사");
		Object cloneTable = htable.clone();
		System.out.println(cloneTable);
		System.out.println();
		
		//테이블이 동일한지 확인
		System.out.println("테이블이 동일한지 확인");
		System.out.println(htable.equals(cloneTable));
		System.out.println();
		
		//테이블이 비어있는지 확인
		System.out.println("테이블이 비어있는지 확인");
		System.out.println(htable.isEmpty());
		System.out.println();
		
		//key값들만 모음
		System.out.println("htable.keys() : key값들만 모음");
		Enumeration<String> keyEnu = htable.keys();
		String k = "";
		while(keyEnu.hasMoreElements()){
			k = k + " "+keyEnu.nextElement();
		}
		System.out.println(k);
		System.out.println();
		
		//value값들만 모음
		System.out.println("htable.elements() : value값들만 모음");
		Enumeration<Integer> valueEnu = htable.elements();
		String v = "";
		while(valueEnu.hasMoreElements()){
			v = v + " "+valueEnu.nextElement();
		}
		System.out.println(v);
		System.out.println();
		
		
		System.out.println("htable 출력");
		System.out.println(htable);
	}
}
