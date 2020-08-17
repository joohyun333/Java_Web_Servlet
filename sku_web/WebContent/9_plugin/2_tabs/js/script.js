
$(document).ready(function(){
  $('#info').tabs();
	
//	$('#info').tabs({
//		active : 2,
//		hide : true,
 // 		heightStyle : 'auto'
//	});
});

/** tabs 위젯의 주요 파라메타

active : 열어둔 패널의 인덱스 번호 ( default : 0 )
collapsible : 패널이 접히는 것을 가능하게 할 것인가  ( default :  false )
disabled : 무효화할 탭  ( default :  false )
			( true로 모든 탭을 무효화 또는 [0,1]과 같이 배열로 특정의 탭만을 무효화하는 것도 가능.)
event : 탭을 활성화하기 위한 이벤트  ( default :  click )
heightStyle : 각 패널의 높이 
 			auto - 가장 높은 패널에 맞춘다
 			fill - 부모 요소에 맞춘다
 			content  : 각각의 높이에 맞춘다  ( default )
hide : 패널을 비표시로 할 때의 애니매이션 효과 (true/false)
show : 패널을 표시할 시간의 애니메이션 효과
*/