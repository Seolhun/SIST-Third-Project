<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#feel').change(function(){
		var feel=$(this).val();
		param="feel="+feel;
		alert("feel="+feel);
		sendMessage("post", "recommandartist.do", param, recommand);
	});
});
function recommand(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#recommandartist').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
	<center>
		<h3>추천영화</h3>
		<table id="table_content" style="width:600px">
			<tr>
				<td>추천 검색 :
					
					   
						<select name="feel" id="feel">
							<c:forEach var="vo" items="${slist }">
							<option>	${vo }</option>
								
							</c:forEach>
						</select>
					
				</td>
			</tr>
			<tr id="recommandartist">
				
			</tr>
			
		</table>
		

	</center>
</body>
</html>