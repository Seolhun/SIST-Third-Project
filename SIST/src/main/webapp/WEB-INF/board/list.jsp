<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/board/list.css">
<script type="text/javascript" src="js/board/list.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<title>Insert title here</title>
</head>
<body>
	<main id="main" class="main">
	<form action="peticiones" method="post" class="form Inventario">
	<div id="boardListDiv">
		<input id="tab6" type="radio" name="tabs" checked> 
		<label id="tabmp" for="tab6">Mant. Preventivo</label>
		<input id="tab7" type="radio" name="tabs"> <label id="asign-hist" for="tab7">Mant.Correctivo</label> 
		<input class="eliminar" id="tab8" type="submit" value="Guardar" class="eliminar" name="cpu" style="display: none;" />
		<label id="tab61" for="tab8" style="display: none;">Guardar</label>
		<section id="content6">
		<table>
			<thead>
				<tr>
					<input name="no_imp" id="no_imp" type="text" style="display: none;">
					<th class="headth">번호</th>
					<th class="headth">종류</th>
					<th class="headth">제목</th>
					<th class="headth">작성일</th>
					<th class="headth">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="1" begin="1" end="10">
			<%-- <c:forEach var="vo" items="{$list}"> --%>
				<tr>
					<td style="width: 5%">ALM1</td>
					<td style="width: 10%">prueba 2</td>
					<td style="width: 70%">159</td>
					<td style="width: 10%">18/11/2016</td>
					<td style="width: 5%">10</td>
					<td class='modeli'>
						<form action="peticiones" method="post" class="form Inventario">
						<input name='man_prev' id='man_prev' type='text' value='ALM1' style='display: none;'>
						<input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display: none;'>
						<input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev' value='Realizado' style='height: 30px; width: auto;' onclick='mod(this)'>
						</form>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</section>
		</div>
	</form>
	</main>
</body>
</html>