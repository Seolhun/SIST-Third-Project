<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.day-filter {
  width: 90%;
  position: relative;
  margin: 0 35px 15px 35px;
  padding: 0;
  height: 100%;
}
.day-filter .btn-next,
.day-filter .btn-prev {
  position: absolute;
  top: 0;
  width: 35px;
  text-align: center;
  z-index: 2;
  height: 100%;
}
.day-filter .btn-next {
  right: -36px;
}
.day-filter .btn-prev {
  left: -36px;
}
.day-filter .viewport {
  width: 100%;
  position: relative;
  overflow: hidden;
  height: 35px;
}
.day-filter .filter-list {
  list-style: none;
  width: 100%;
  position: relative;
  margin: 0;
  padding: 0;
  height: 80%;
}
.day-filter .filter-list .list-item {
  float: left;
  display: block;
  margin: 0 4px;
  padding: 0;
  width: 80px;
  height: 100%;
  text-align: center;
}
.day-filter .filter-list .list-item .btn {
  display: block;
  width: 100%;
  height: 100%
}
.box{
margin-top: 20px;
margin-bottom: 20px;
margin-left:5px;
margin-right: 5px; 
}

#scroller li img{
	width: 60px;
	height: 60px;
	padding: 2px;
	background-color:rgba(255,255,255,0.9);
    border: solid 1px rgba(28, 96, 113, 0.30);
	border-radius: 4px;
	transition: 0.3s;
	margin: 4px 0px 0px 0px;
}


</style>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://static.melon.co.kr/static/web/resource/script/w1/9s/n/15h0261uk9.js"></script>
<script type="text/javascript">document.domain='melon.com';</script>

<script type="text/javascript">
$(document).ready(function($) {

	
	emo_click();
	gen_click();
	
	
	$('.btn-success').click(function(){
			var btn=$('.list-item').attr('id');
			if(btn=='emolist')
			{
				  $('ul.filter-list').html("");
				   $('.filter-list').append("<c:forEach var='vo' items='${glist }'><li class='list-item' id='genlist'><button type='button' class='btn btn-sm btn-default day gen' value='${vo.genre}'>${vo.genre}</button></li></c:forEach>")
				   gen_click();
			}
			else if(btn=='genlist')
			{
				$('ul.filter-list').html("");
				   $('.filter-list').append("<c:forEach var='vo' items='${elist }'><li class='list-item' id='emolist'><button type='button' class='btn btn-sm btn-default day emo' id='btn-emo' value='${vo.emotion}'>${vo.emotion}</button></li></c:forEach>")
				   emo_click(); 
			}
	});
	

});
function gen_click(){
   $('.gen').click(function(){
      
      var gen=$(this).attr('value');
      alert(gen);
      
       if(gen=='댄스')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dance }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='발라드')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${balad }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='랩/힙합')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${raphip }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='알앤비/소울')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${rnb }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='락')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${rock }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='일랙트랙')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${elec }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='포크')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${fork }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='팝')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${popp }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      });
   
}
function emo_click(){
   $('.emo').click(function(){
      var emo=$(this).attr('value');
      alert(emo);

      if(emo=='신나는')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${playful }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
         
      }
      else if(emo=='경쾌한')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${light }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      
      }
      else if(emo=='사랑으로')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${love }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='편안한')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${peace }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='몽환적')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dreamy }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='감성적')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${emotional }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='어두운')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dark }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      
      });
   }


</script>
</head>
<body>

	<div style="width:1500px;height:500px; float: inherit;border: 2px solid #eee;">
	
		
<div class="box" style="float: left; width: 100%; height: 15%">
	<div class="day-filter" style="height: 100%">
		<button type="button" class="btn btn-sm btn-success btn-prev"><i class="fa fa-angle-left"></i></button>
		<button type="button" class="btn btn-sm btn-success btn-next"><i class="fa fa-angle-right"></i></button>
		<div class="viewport" style="height: 100%">
			<ul class="filter-list" style="height: 74px">
				<c:forEach var="vo" items="${elist }">
					<li class="list-item" id='emolist'>
						<button type="button" class="btn btn-sm btn-default day emo"  value="${vo.emotion }">${vo.emotion }</button>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
		

		<div style="width: 100%; height: 85%; float: left;  ">
		
			<div id="listtitle" style="width: 20%; height: 100%; float: left; border: 2px solid #eee;">

			</div>
			
		<div id="listadd" style="width: 80%; height: 100%; float: left; border: 2px solid #eee;">
			  <div style="height: 10%"> 
			   	<p style="width: 10%;float: left;text-align: center; border-right: 1px solid black;">NO</p>
			   	<p style="width: 41%;float: left;text-align: center;border-right: 1px solid black;">곡명</p>
			   	<p style="width: 25%;float: left;text-align: center;border-right: 1px solid black;">아티스트</p>
			   	<p style="width: 19%;float: left;text-align: center;">앨범</p>
			  </div>
			  <div style="overflow: scroll; height: 90%">
			   	<ul class="emosongti" style="-webkit-padding-start: 0px;">
			   		<c:forEach var="vo" items="${playful }">
			   			<div style="width: 100%">
			   			<p style="width: 10%;float: left;text-align: center; border-right: 1px solid black;">${vo.no }</p>
			   			<p style="width: 40%;float: left;text-align: center;border-right: 1px solid black;">${vo.title }</p>
			   			<p style="width: 25%;float: left;text-align: center;border-right: 1px solid black;">${vo.artist }</p>
			   			<p style="width: 25%;float: left;text-align: center;">${vo.album }</p>
			   			</div><br/>	
			   		</c:forEach>
			   	</ul>
			  </div>

		</div>
		
	</div>
</div>
</body>
</html>