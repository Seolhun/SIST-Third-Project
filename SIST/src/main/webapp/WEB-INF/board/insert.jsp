<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/board/insert.css">
<script type="text/javascript" src="js/board/insert.js"></script>

<title>게시판 글쓰기</title>
</head>
<body>
<!-- no,kind,email,subject,content,regdate,hit,depth -->
<section id="contact-form">
<h2>Contact</h2>
	<form id="contact" name="contact" accept-charset="utf-8">
		<label>
			<span>카테고리</span>
			<select id="kind" name="kind">
				<option value="자유">자유게시판</option>
				<option value="노래">노래 추천</option>
				<option value="가수">가수 추천</option>
				<option value="기타">기타</option>
			</select>
		</label>
		<label>
			<span>제목</span> 
			<input id="subject" name="subject" type="text" placeholder="게시판의 제목을 입력해주세요."/>
		</label>
		<label>
			<span>내용</span>
			<textarea id="content" name=content placeholder="게시판의 내용을 입력해주세요."></textarea>
		</label>
		<input id="sendBtn" name="submit" type="submit" value="Send"/>
	</form>
</section>
</body>
</html>