/**
 * author : mingli
 * date   ：20170321
 * 
 */

$(document).ready(function(){
	$("#btnPostMessage").on("click",fn_click_PostMessage);
	
});

function fn_click_PostMessage(){
	console.log("fn_click_PostMessage:"+gObject.url);
	var data = {};
	data.businessClass = "PostBusiness";
	data.methodName = "addPost";
	data.parameters = {};
	formData = {};
	formData.postid = 0;
	formData.userid = $("#txtuserid").val();
	formData.post = $("#txtpost").val();
	formData.posttype = 1;
	//console.log("formData:"+JSON.stringify(formData));
	data.parameters = JSON.stringify(formData);
	$.ajax({
	  type		: 'POST',
	  url		: gObject.url+"/Profile",
	  data		: data,
	  success	: fn_click_PostMessage_success,
	  dataType	: "json"
	});
}

function fn_click_PostMessage_success(data, textStatus, jqXHR){
	console.log("fn_click_PostMessage_success:"+data);
	if (data.result){
		alert("add the post success"); 
		$("#txtpost").val("");
	}else{
		alert("add the post failed"+data);  
	}
}

