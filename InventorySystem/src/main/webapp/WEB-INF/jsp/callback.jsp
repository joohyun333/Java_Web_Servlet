
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="org.json.*" %>

<html>
<head>
<title>네이버로그인</title>
</head>
<body>
	<%
	String clientId = "1iFSt9oeBx7ezbHyZO4Z";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "dJZ0fSuMee";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost/InventorySystem/callback", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
 	String access_token = "";
	String refresh_token = ""; 
	
	System.out.println("apiURL=" + apiURL);
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.print("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		JSONObject jsonObject = null;
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			out.println(res.toString());
			jsonObject = new JSONObject(res.toString());
			access_token = jsonObject.getString("access_token");
			refresh_token = jsonObject.getString("refresh_token");
			out.println(access_token instanceof String);
			out.println("API요청 성공!</br>");	
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	</br>
	<%="접근 토큰" + access_token%> </br>
	<%="갱신 토큰" + refresh_token%>
</body>
</html>