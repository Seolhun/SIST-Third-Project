<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/board/list.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Archivo+Narrow' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/board/list.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<main id="main" class="main">
<<<<<<< HEAD
	<form action="peticiones" method="post" class="form Inventario">
		<div id="boardListDiv">
			<input id="tab1" type="radio" name="tabs" checked> <label id="asign-hist" for="tab1">자유 게시판</label> 
			<input id="tab2" type="radio" name="tabs"> <label id="asign-hist" for="tab2">음악 게시판</label> <input id="tab3" type="radio" name="tabs">
			<label id="asign-hist" for="tab3">Q & A</label>
			<section id="content6">
			<table class="boardTable">
				<thead>
					<tr>
						<input name="no_imp" id="no_imp" type="text" style="display: none;">
						<th class="headth">번호</th>
						<th class="headth">종류</th>
						<th class="headth">제목</th>
						<th class="headth">작성자</th>
						<th class="headth">작성일</th>
						<th class="headth">조회수</th>
						<th class="headth" style="display: block;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list }">
						<%-- <c:forEach var="vo" items="{$list}"> --%>
						<tr>
							<td style="width: 5%">${dto.no }</td>
							<td style="width: 5%">${dto.kind }</td>
							<td style="width: 55%">${dto.subject }</td>
							<td style="width: 20%">${dto.email }</td>
							<td style="width: 10%">${dto.regdate }</td>
							<td style="width: 5%">${dto.hit }</td>
							<td class='modeli' style="width: 100%">
								<form action="peticiones" method="post" class="form Inventario">
									<input class='eliminar' name='bot_man_prev' type="button"
										id='bot_man_prev' value='내용보기' onclick='mod(this)'>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</section>
			<div class="listFooter">
				<div class="pageMoveDiv">
					<label class="pageMoveBtn"><</label>
					<button class="pageNumber">1</button>
					<button class="pageNumber">2</button>
					<button class="pageNumber">3</button>
					<button class="pageNumber">4</button>
					<button class="pageNumber">5</button>
					<label class="pageMoveBtn">></label>
				</div>
				<div class="writeBtnDiv">
					<a href="#" id=writeBtn" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#largeModal">글 쓰기</a>
				</div>
			</div>
			
			<!--글쓰기 모달  -->
			<div class="container">
				<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">게시판 글 쓰기</h4>
							</div>
							<form id="writeModal" name="writeModal" accept-charset="utf-8" action="insertBoard.do">
								<div class="modal-body">					
									<div id="kindDiv">
										<h4 id="kindLa">카테고리</h4>
										<select id="kind" name="kind">
											<option value="자유">자유</option>
											<option value="노래">노래 추천</option>
											<option value="가수">가수 추천</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<div id="subjectDiv">
										<h4 id="subjectLa">제목</h4> 
										<input id="subject" name="subject" type="text" placeholder="게시판의 제목을 입력해주세요."/>
									</div>
									<div id="contentDiv">
										<h4 id="contentLa">내용</h4>
										<textarea id="content" name=content placeholder="게시판의 내용을 입력해주세요."/>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="sendBtn" name="submit" type="submit" value="Send">저장</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 글쓰기 모달 끝  -->
=======
	<form action="peticiones" method="post" class="form Inventario">
		<div id="boardListDiv">
			<input id="tab1" type="radio" name="tabs" checked> <label id="asign-hist" for="tab1">자유 게시판</label> 
			<input id="tab2" type="radio" name="tabs"> <label id="asign-hist" for="tab2">음악 게시판</label> <input id="tab3" type="radio" name="tabs">
			<label id="asign-hist" for="tab3">Q & A</label>
			<section id="content6">
			<table class="boardTable">
				<thead>
					<tr>
						<input name="no_imp" id="no_imp" type="text" style="display: none;">
						<th class="headth">번호</th>
						<th class="headth">종류</th>
						<th class="headth">제목</th>
						<th class="headth">작성자</th>
						<th class="headth">작성일</th>
						<th class="headth">조회수</th>
						<th class="headth" style="display: block;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list }">
						<%-- <c:forEach var="vo" items="{$list}"> --%>
						<tr>
							<td style="width: 5%">${dto.no }</td>
							<td style="width: 5%">${dto.kind }</td>
							<td style="width: 55%">${dto.subject }</td>
							<td style="width: 20%">${dto.email }</td>
							<td style="width: 10%">${dto.regdate }</td>
							<td style="width: 5%">${dto.hit }</td>
							<td class='modeli' style="width: 100%">
								<form action="peticiones" method="post" class="form Inventario">
									<input class='eliminar' name='bot_man_prev' type="button"
										id='bot_man_prev' value='내용보기' onclick='mod(this)'>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</section>
			<div class="listFooter">
				<div class="pageMoveDiv">
					<label class="pageMoveBtn"><</label>
					<button class="pageNumber">1</button>
					<button class="pageNumber">2</button>
					<button class="pageNumber">3</button>
					<button class="pageNumber">4</button>
					<button class="pageNumber">5</button>
					<label class="pageMoveBtn">></label>
				</div>
				<div class="writeBtnDiv">
					<a href="#" id=writeBtn" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#largeModal">글 쓰기</a>
				</div>
			</div>
			
			<!--글쓰기 모달  -->
			<div class="container">
				<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">게시판 글 쓰기</h4>
							</div>
							<form id="writeModal" name="writeModal" accept-charset="utf-8" action="insertBoard.do">
								<div class="modal-body">					
									<div id="kindDiv">
										<h4 id="kindLa">카테고리</h4>
										<select id="kind" name="kind">
											<option value="자유">자유</option>
											<option value="노래">노래 추천</option>
											<option value="가수">가수 추천</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<div id="subjectDiv">
										<h4 id="subjectLa">제목</h4> 
										<input id="subject" name="subject" type="text" placeholder="게시판의 제목을 입력해주세요."/>
									</div>
									<div id="contentDiv">
										<h4 id="contentLa">내용</h4>
										<textarea id="content" name=content placeholder="게시판의 내용을 입력해주세요."/>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="sendBtn" name="submit" type="submit" value="Send">저장</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 글쓰기 모달 끝  -->
>>>>>>> refs/heads/km
		</div>
	</form>
	</main>
</body>
</html>