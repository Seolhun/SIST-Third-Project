<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>추천영화</h3>
		<table id="table_content" style="width:600px">
			<tr>
				<td>추천 검색 :
					
					   
						<select name="feel" id="feel">
							<c:forEach var="vo" items="${list }">
								${vo.feel }
								
							</c:forEach>
						</select>
					
				</td>
			</tr>
		</table>
		

	</center>
</body>
</html>