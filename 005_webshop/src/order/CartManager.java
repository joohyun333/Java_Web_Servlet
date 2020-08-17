package order;

import java.util.Hashtable;

public class CartManager {
	//Hashtable : key, value 형식으로 데이터를 처리
	private Hashtable<String,OrderBean> hCart = new Hashtable<String,OrderBean>();
	
	//카트에 추가
	public void addCart(OrderBean obean){
		
		//key값 : product_no, value값 : OrderBean
		String product_no = obean.getProduct_no();
		int quantity = Integer.parseInt(obean.getQuantity());
		
		//주문수량이 0보다 크면
		if(quantity >0){ 
			
			//카트에 동일상품이 있으면
			if(hCart.containsKey(product_no)){
				
				//카트의 기존 상품번호의 orderbean을 가져옴
				OrderBean tempBean = (OrderBean)hCart.get(product_no);
				
				//현재 갯수 + 기존 상품의 갯수
				quantity += Integer.parseInt(tempBean.getQuantity());
				
				//기존상품 갯수 = 현재갯수 + 기존상품 갯수
				tempBean.setQuantity(Integer.toString(quantity));
				
				//카트에 추가
				hCart.put(product_no, tempBean);
				

			//카트에 동일상품이 없으면
			} else {
				hCart.put(product_no, obean);
			}
		}
	}
	
	//카트 목록 출력
	public Hashtable<String,OrderBean> getCartList() {
		return hCart;
	}
	
	//카트 내용 수정
	public void updateCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.put(product_no, obean);
	}
	
	//카트 내용 삭제
	public void deleteCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.remove(product_no);
	}
}
