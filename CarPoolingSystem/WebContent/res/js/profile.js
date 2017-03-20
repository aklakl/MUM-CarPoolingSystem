/**
 * author : mingli
 * 
 */

$(document).ready(function(){
  $("#btnprofile").on("click",fn_submit);
  $("#btnSaveprofile").on("click",fn_Saveprofile);
  
});

gObject = {};
init();
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
	
	var birthyear = $("input[name='birthyear']").val();
	var currentYear = new Date().myDate.getFullYear();
	console.log("birthyear:"+birthyear);
	/*
	//   http://www.cnblogs.com/roucheng/archive/2016/06/19/jsdate.html
	if (currentYear-birthyear<18){
		alert("your birthyear must be more than 18+ ");
		return false;
	}
	*/
	
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
	if (data.result){
		alert("add the user success"); 
		window.location.href=gObject.url; 
	}else{
		alert("add the user failed");  
	}
}

function fn_Saveprofile(){
	console.log("fn_Saveprofile:"+data);
	if (data.result){
		alert("add the user success"); 
		window.location.href=gObject.url; 
	}else{
		alert("add the user failed");  
	}
}



function fn_fetchDataInUpdateProfile(data, textStatus, jqXHR){
	console.log("fn_submit_success:"+data);
	
	//$();
}