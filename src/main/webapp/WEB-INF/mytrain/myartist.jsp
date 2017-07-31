<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
$('.artist_del_btn').click(function(){
    var id=$('#headerid').text();
   var my_artist=$(this).attr("alt");
   
    param="id="+id+"&my_artist="+my_artist;
   sendMessage("post", "artistdelete.do", param, artistdelete);  
}); 
</script>
</head>
<body>
	my artist<br>
   <c:forEach var="avo" items="${alist }">
      ${avo.my_artist } <input type="button" class="artist_del_btn" value="X" alt="${avo.my_artist }"><br> 
   </c:forEach>
</body>
</html>