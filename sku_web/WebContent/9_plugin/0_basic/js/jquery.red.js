/**
 * 	jquery.red.js
 */

$.fn.red = function(){
	/*
	 *   this : javascript 에서 사용
	 *   $(this) :  jquery 에서 사용
	 */
	// 수업하면 더 복잡해질 수도
//	this.each( function(){
//			// each 내의 여기 this는 검색 대상 태그임으로 제이쿼리 $()안에 있어야 함
//		$(this).css("background","red");
//	});
	
	// this가 자체적으로 반복으로 수행하지만 헷갈리므로 위의 코드가 더 좋은가?
	//$(this).css("background","red"); - 둘다 수행하는데...
	this.css("background","red");
	
	return this;
}


