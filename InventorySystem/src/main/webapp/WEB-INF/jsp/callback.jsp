<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<body>
	<script type="text/javascript">
	<!-- NAVER API -->
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "1iFSt9oeBx7ezbHyZO4Z",
			callbackUrl : "http://localhost/InventorySystem/callback",
			isPopup : false
		/* 팝업을 통한 연동처리 여부 */
		});

		naverLogin.init();

		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status) {
				if (status) {
					var id = naverLogin.user.getId();
					var nm = naverLogin.user.getName();
					var email = naverLogin.user.getEmail();

					var isRequire = true;
					if (nm == 'undefined' || nm == null || nm == '') {
						alert('이름은 필수 정보입니다. 정보제공을 동의해주세요.');
						isRequire = false;
					} else if (email == 'undefined' || email == null
							|| email == '') {
						alert('이메일은 필수 정보입니다. 정보제공을 동의해주세요.');
						isRequire = false;
					}

					if (isRequire == false) {
						naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
						return;
					}

					/* window.opener.document.loginForm.method = "get"; */
					/* window.opener.document.loginForm.action = "/Main/main"
					window.opener.document.loginForm.submit();
					window.close(); */
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
	
</body>
</html>