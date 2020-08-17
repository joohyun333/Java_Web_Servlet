<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"><a id="naverIdLogin_loginButton" role="button"></a></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "1iFSt9oeBx7ezbHyZO4Z",
			callbackUrl: "http://localhost/InventorySystem/Main/main",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */

		/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	
	$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				setLoginStatus();
				}
		});
	});
	function setLoginStatus() {
		var nickName = naverLogin.user.getNickName();
		var email = naverLogin.user.getEmail();
		$("#naverIdLogin_loginButton").html('<br><p>' + email + '<br>' + nickName + '님 반갑습니다.</p>');
		/* $("#gnbLogin").html("Logout");*/
		$("#gnbLogin").attr("href", "Main/main"); 
		/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
		$("#gnbLogin").click(function () {
			naverLogin.logout();
			location.reload();
		}); 
	}
</script>
</body>

</html>
