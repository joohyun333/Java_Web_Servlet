    $(function(){

      // 첫번째 <a>태그에서 실행
      //$("a[rel^='prettyPopin']:eq(0)").prettyPopin(    // ^ : 시작하는
    	$("a[rel='prettyPopin']:eq(0)").prettyPopin(
        { 
          width: 550
        //  ,      followScroll:false
        }
      );

      // 두번째 <a>태그에서 실행
     // $("a[rel^='prettyPopin']:eq(1)").prettyPopin(
    	$("a[rel='prettyPopin']:eq(1)").prettyPopin(
        {
          width: 550,
          callback : function(){
            alert('팝업이 닫혔습니다.');
          }
        }
      ); 

    });