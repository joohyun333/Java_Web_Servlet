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
		// ���� ��ū �� ���
		/* alert(naver_id_login.oauthParams.access_token); */
		// ���̹� ����� ������ ��ȸ
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
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
		�̸��� : <input type="text" name="email" value="" style="border: none"></input></br>
		�г��� : <input type="text" name="nickname" value="" style="border: none"></input></br>
		�̸� : <input type="text" name="name" value="" style="border: none"></input></br>
		�α����� �Ͻðڽ��ϱ�?
		<input type="submit" value = "Yes"/>
		<input type="button" value = "No" onClick="location.href='Main/main'">
	</form>
</body>
</html>