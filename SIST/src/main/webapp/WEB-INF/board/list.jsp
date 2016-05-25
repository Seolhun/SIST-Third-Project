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

<title>Insert title here</title>
</head>
<body>
	<main id="main" class="main">
	<form action="peticiones" method="post" class="form Inventario">
	<div id="boardListDiv">
		<input id="tab1" type="radio" name="tabs" checked>		<label id="asign-hist" for="tab1">자유 게시판</label>
		<input id="tab2" type="radio" name="tabs"> 				<label id="asign-hist" for="tab2">음악 게시판</label> 
		<input id="tab3" type="radio" name="tabs"> 				<label id="asign-hist" for="tab3">Q & A</label>
		<div id="writeBtnDiv">
			<div ></div>
		</div>
		<section id="content6">
		<table class="boardTable">
			<thead>
				<tr>
					<input name="no_imp" id="no_imp" type="text" style="display: none;">
					<th class="headth">번호</th>
					<th class="headth">종류</th>
					<th class="headth">제목</th>
					<th class="headth">작성일</th>
					<th class="headth">조회수</th>
					<th class="headth" style="display: block;"></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="1" begin="1" end="10">
			<%-- <c:forEach var="vo" items="{$list}"> --%>
				<tr>
					<td style="width: 5%">ALM1</td>
					<td style="width: 5%">prueba 2</td>
					<td style="width: 70%">159</td>
					<td style="width: 10%">18/11/2016</td>
					<td style="width: 5%">10</td>
					<td class='modeli' style="width: 100%">
						<form action="peticiones" method="post" class="form Inventario">
							<input class='eliminar' name='bot_man_prev' type="button" id='bot_man_prev' value='내용보기' onclick='mod(this)'>
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
					<button class="writeBtn">글 쓰기</button>
				</div>
			</div>
		</div>
	</form>
	</main>
</body>
</html>