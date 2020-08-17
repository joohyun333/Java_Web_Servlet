
$(document).ready(function(){

	/* form의 validation
		: jquery.validate.js나 jquery.validate.min.js  파일에서 확인한다. 

		- required : 필수입력
		- email : 이메일형식
		- url : 웹주소형식
		- minlength, maxlength : 글자길이
		- equalTo : 동일한지 여부

		- success 콜백함수로 label에 값과 클래스를 지정하여 추가한다.
		(*) label에 valid 클래스는 form.css에 이미 정의되어 있음
		(*) Firebug로 확인
	*/
  $('#signup form').validate({
    rules: {
      name: {
        required: true
      },
      email: {
        required: true,
        email: true
      },
      website: {
        url: true
      },
      password: {
        minlength: 6,
        required: true
      },
      passconf: {
        equalTo: "#password"
      }
    },

    success: function(label) {
      label.addClass('valid');
      // 또는
      label.text('성공');
    }
  });


 /*
	모든 체크박스에 이름을 'agree'로 동일하게 주고, 
	마지막 체크박스의 클래스를 'check-all'이라 지정한다. 
	':checkbox[name='agree']' 조합을 만들어 group 변수에 지정하고 
	그 group의 checked 속성을 'check-all' 체크박스의 checked 속성으로 변경한다.
 */
/* $('.check-all:checkbox').change(function() {
    var group = ':checkbox[name=' + $(this).attr('name') + ']';
    $(group).attr('checked', $(this).attr('checked'));
  });*/
  
  $('.check-all').click(function(){
	  //$('.agree').prop('checked', this.checked); // attr을 하면 한번만 됨
	  $('.agree').prop('checked',  $(this).is(':checked') ); 
	  
	  //----------------------------------------- $(this).checked 는 왜 안될까?
	  /*
	   * this는 자바스크립트이고 $(this)는 jquery 인데,
	   * checked는 자바스크립트 속성으로 this.checked 이고
	   * $(this).is(':checked')로 사용
	   * 
	   * this는 $(this)[0] 이다.
	   */
	  //---------------------------------------
	  //  체크박스에서 checked 속성이 attr() / prop() 리턴값이 다르다
  }); 

  $('.agree').click(function(){
	  if( ! this.checked ) {				
		  $('.check-all').prop('checked', false);
	  }
  });
});


