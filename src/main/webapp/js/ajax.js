var httpRequest=null;
function createHttpRequest(){
	if(window.ActiveXObject){ // IE
		return new ActiveXObject("Msxml2.XMLHTTP"); // IE 8이상
		// new ActiveXObject("Microsoft.XMLHTTP"); IE 8이하
	}else if(window.XMLHttpRequest){ // 크롬 ,FF
		return new XMLHttpRequest();
		// responseText(파일) , responseXML(Object) {} []
	}
}
function sendMessage(method,url,param,callback){
	// 연결
	httpRequest=createHttpRequest(); // 객체생성
	var httpParam=param;
	var httpUrl=url;
	if(method=='GET'||method==null){
		httpUrl=httpUrl+"?"+httpParam;
	}
	
	httpRequest.open(method,httpUrl,true);
	/*
	 *  true : 비동기적
	 *  false : 동기적
	 */
	httpRequest.onreadystatechange=callback;
	httpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded"); // 한글 변환
	httpRequest.send(method==null||method=="GET"?null:param); // post방식이면 param이 들어감
}