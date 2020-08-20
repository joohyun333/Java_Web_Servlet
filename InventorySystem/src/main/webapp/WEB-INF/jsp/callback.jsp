<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>callback</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("1iFSt9oeBx7ezbHyZO4Z","http://localhost/InventorySystem/callback");
		// 접근 토큰 값 출력
		/* alert(naver_id_login.oauthParams.access_token); */
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			var email = naver_id_login.getProfileData('email');
			var nickname = naver_id_login.getProfileData('nickname');
			var name = naver_id_login.getProfileData('name');
			document.form1.email.value = email;
			document.form1.nickname.value = nickname;
			document.form1.name.value = name;
			 window.opener.location.reload(); 
		}
	</script>
	<form action="mainCallback" name="form1" method="get" style="padding: 0; margin: 0; font-size: 13px;">
		이메일 : <input type="text" name="email" value="" style="border: none"></input></br>
		닉네임 : <input type="text" name="nickname" value="" style="border: none"></input></br>
		이름 : <input type="text" name="name" value="" style="border: none"></input></br>
		로그인을 하시겠습니까?
		<input type="submit" value = "Yes"/>
		<input type="button" value = "No" onClick="location.href='Main/main'">
	</form>
</body>
</html>