/**
 * author : mingli
 * 
 */

$(document).ready(function(){
  $("#btnprofile").on("click",fn_submit);
  init();	
});
gObject = {};
function init(){
	gObject.hostIp=window.location.host;
	gObject.hostPort=window.location.port;
	gObject.projectName="CarPoolingSystem";
	gObject.url = "http://"+gObject.hostIp+"/"+gObject.projectName;
}


 

function fn_submit(){
	console.log("fn_submit:"+gObject.url);
	var data = {};
	data.businessClass = "UserBusiness";
	data.methodName = "addUser";
	data.parameters = {};
	
	formData = {};
	$("form input").each( 
		function(idx,item){
			//console.log("idx:"+idx+"|item"+item);
			formData[item.name]=item.value;
		}
	);
	
	//console.log("formData:"+JSON.stringify(formData));
	data.parameters = JSON.stringify(formData);
	$.ajax({
	  type		: 'POST',
	  url		: gObject.url+"/Profile",
	  data		: data,
	  success	: fn_submit_success,
	  dataType	: "json"
	});
}

function fn_submit_success(data, textStatus, jqXHR){
	console.log("fn_submit_success:"+data);
	//
}