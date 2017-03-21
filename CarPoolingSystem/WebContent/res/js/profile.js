/**
 * author : mingli
 * date   ：20170319
 * 
 */

$(document).ready(function(){
  $("#btnprofile").on("click",fn_click_submit);
  $("#btnSaveprofile").on("click",fn_click_Saveprofile);
  
});

gObject = {};
init();
function init(){
	gObject.hostIp=window.location.host;
	gObject.hostPort=window.location.port;
	gObject.projectName="CarPoolingSystem";
	gObject.url = "http://"+gObject.hostIp+"/"+gObject.projectName;
	gObject.indexPage = gObject.url+"/UserControler";
}




function fn_click_submit(){
	console.log("fn_click_submit:"+gObject.url);
	var data = {};
	data.businessClass = "UserBusiness";
	data.methodName = "addUser";
	data.parameters = {};
	/*
	var birthyear = $("input[name='birthyear']").val();
	var currentYear = new Date().getFullYear();
	console.log("birthyear:"+birthyear);
	
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
		window.location.href = gObject.indexPage;//gObject.url; 
	}else{
		alert("add the user failed");  
	}
}



function fn_click_Saveprofile(){
	console.log("fn_click_Saveprofile:"+gObject.url);
	var data = {};
	data.businessClass = "UserBusiness";
	data.methodName = "saveUser";
	data.parameters = {};
	formData = {};
	$("form input").each( 
		function(idx,item){
			formData[item.name]=item.value;
		}
	);
	data.parameters = JSON.stringify(formData);
	$.ajax({
	  type		: 'POST',
	  url		: gObject.url+"/Profile",
	  data		: data,
	  success	: fn_click_Saveprofile_success,
	  dataType	: "json"
	});
}

function fn_click_Saveprofile_success(data, textStatus, jqXHR){
	console.log("fn_click_Saveprofile:"+data);
	if (data.result){
		alert("update the user success"); 
		window.location.href = gObject.indexPage;//gObject.url; 
	}else{
		alert("update the user failed");  
	}
}


function fn_fetchDataInUpdateProfile(data, textStatus, jqXHR){
	console.log("fn_submit_success1:"+JSON.stringify(data));
	data = JSON.parse(JSON.stringify(data));
	console.log("fn_submit_success2:"+JSON.stringify(data));
	var obj = JSON.parse((data.datalist));
	obj = obj[0];
	console.log("fn_submit_success3:"+JSON.stringify(obj));
	for(var key in obj) {
	    console.log(key+":"+obj[key]);
	    if (key =="gender"){
	    	if (obj[key] ==0)
	    		$("#gendermale").attr("checked","checked"); 
	    	else
	    		$("#genderfemale").attr("checked","checked");
	    }else{
	    	$("input[name='"+key+"']").val(obj[key]);
	    }
	}
}