<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">
$(function () {

    $('#econtainer').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Emotion'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '선호도',
            data: <%= request.getAttribute("evalue")%>
        }]
    });
 

    $('#gcontainer').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Genre'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '선호도',
            data: <%= request.getAttribute("gvalue")%>
        }]
    }); 
    $('#feel').change(function(){
		var feel=$(this).val();
		param="feel="+feel;
// 		alert("feel="+feel);
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
<table style="position: relative;
    margin: auto;
    width: 65%;
    height: 600px;">
<tr>
<td style="width: 50%; padding:0;"><div id="econtainer" style="min-width: 200px; height: 400px; margin: 0 auto"></div></td>
<td style="width: 50%; padding:0;"><div id="gcontainer" style="min-width: 200px; height: 400px; margin: 0 auto"></div></td>
</tr>
<tr>
<td colspan="2" style="background: white;">
<div id="rcontainer">
	<select name="feel" id="feel">
		<c:forEach var="vo" items="${slist }">
		<option>	${vo }</option>
		</c:forEach>
	</select>
</div>
<div id="recommandartist"></div>
</td>
</table>




</body>
</html>