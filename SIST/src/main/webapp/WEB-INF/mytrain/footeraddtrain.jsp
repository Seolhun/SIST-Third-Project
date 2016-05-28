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
$(".songlist_li").on("click",function(){
	var t_num=$(this).find('.footertrain_no').attr("value");
	
	var id=$('#headerid').text();
	$.ajax({
         url:'songlist_load.do',
         type:'post',
         contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
         dataType:"json",
         data:{"no":t_num,"id":id},
         success:function(data){
        songlist=[];
      	 for (var i = 0;i<=data.length;i++) {
       		if(data[i]!=null){
       			songlist[i]=data[i];
       			youtube_load(); 

       		}
       	 }
         },
 	    error:function(request,status,error){
	        alert(error);
	    }
	 });
});
</script>
</head>
<body>
	<ul>
		<c:forEach var="vo" items="${list }">
			<li class="songlist_li">${vo.nick}<br>${vo.train_name }
			<input type="hidden" value="${vo.train_no }" class="footertrain_no"></li>
		</c:forEach>
	</ul>
</body>
</html>