<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title> 
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>



<body style="padding: 50px;background-color: #CCCCCC">
<script  type="text/javascript">
function AllChecked(){
	var allFrom =  document.forms["list"].all;
	var all =allFrom.checked;
	var hogeLength = document.forms["list"].hoge.length;
	if(typeof(hogeLength) == "undefined"){document.forms["list"].hoge.checked = all;
	}
	else{
	 for (var i=0; i<document.forms["list"].hoge.length; i++){
		 document.forms["list"].hoge[i].checked = all;
	    }
	}
}

function DisChecked(){
    var checks = document.forms["list"].hoge;
    var checksCount = 0;
    for (var i=0; i<checks.length; i++){
      if(checks[i].checked == false){
    	  document.forms["list"].all.checked = false;
      }else{
        checksCount += 1;
        if(checksCount == checks.length){
        	document.forms["list"].all.checked = true;
        }
      }
    }
  }
  
  //  input text not be allow on space and null
  function nullCheck(inputName){
	  var regu = "^[ ]+$";
	  var re = new RegExp(regu);
	  if(inputName.length == 0 || re.test(inputName) == true){
		  alert("lost name");
		  return false;
		  }
  }
  //clear checkbox when only one box be allow
  function checkCleaner(){
	  document.forms["list"].all.checked = false;
	  for (var i=0; i<document.forms["list"].hoge.length; i++){
			 document.forms["list"].hoge[i].checked = false;
		    }
  }
  
  //check anyone be checked before modify
  function modifyCheck(){
	  if($(":checkbox:checked").length == 0){
		  alert("check something");
	  }else if($(":checkbox:checked").length>1){
		  alert("just one");
		  checkCleaner();
	  }else{
		  $('#modifyModal').modal('show');
		  }
  }
	
  
	function deleteData(){
	  document.getElementById('list').action="DeleteServlet";
  }
	
	//check name's size until 30 bytes
	function inputCheck(url,name,id){
		var length = encodeURI(name).replace(/%../g,"*").length;
		if (length >30){
			alert("just 30!!!");
		}else if(id  === undefined){
			alertCheck(url,name);
		}else{
			alertCheck(url,name,id);
		}
	}
	
	//confirm value before post
	function alertCheck(url,name,id){
		var nameS = name;
		if(nullCheck(name) == false) return;
		var confirmT = confirm(nameS);
		if(confirmT != true ){
			return false;
		}else if(id  === undefined){
			$('#myModal').modal('hide');
			createPost(url,name);
		}else{
			modifyPost(url,name,id);
		}
	}
	
	//modify past one
	function modifyPost(url,modifyName,id){
		var modifyForm = document.createElement("form");
		modifyForm.method = "post";
		modifyForm.action = url;
		var myInputId = document.createElement("input");
		myInputId.stytle = "hidden";
		myInputId.name = "idModify";
		myInputId.value =id;
		modifyForm.appendChild(myInputId);
		
		var myInputName =document.createElement("input");
		myInputName.stytle = "hidden";
		myInputName.name = "modifyName";
		myInputName.value = modifyName;
		modifyForm.appendChild(myInputName);
		
		document.body.appendChild(modifyForm);
		modifyForm.submit();
		document.body.removeChild(modifyForm);	
		
	  }
	
	//create new one
	function createPost(url,name){
		var myForm = document.createElement("form");
		myForm.method = "post";
		myForm.action = url;
		var myInput = document.createElement("input");
		myInput.name = "name";
		myInput.value = name;
		myInput.stytle = "hidden";
		myForm.appendChild(myInput);	
		document.body.appendChild(myForm);
		myForm.submit();
		document.body.removeChild(myForm);

	}

	//onfocus
	function onFocus(x){
		var value = $(":checkbox:checked").parents('tr').children().eq(2).text();
		if(x.value == value){
		var value = $(":checkbox:checked").parents('tr').children().eq(2).text();
		document.getElementById('modify').value = "";
		}
	}
	
	//onblur
	function onBlur(x){
	    if(x.value==''&&document.getElementById('test').value!=''){
	        document.getElementById('test').value=$(":checkbox:checked").parents('tr').children().eq(2).text();
	    }
	}
	//modify input default value
	function getModifyName(){	
		var value = $(":checkbox:checked").parents('tr').children().eq(2).text();
		document.getElementById('modify').value = value;
	}
	function delConfirm(){
		var delName = $(":checkbox:checked").map(function(){return $(this).parents('tr').children().eq(2).text();}).get();
		var confirmT = confirm(delName);
		if(confirmT ==true)delAjax();
		$('body').load('ListServlet');
		}
	
	function delAjax(){	
		$.ajax({
			type	:"post",
			url		:"DeleteServlet",
			data	:$('#list').serialize(),
			async	:true,
		success		:function(){},
		error		:function(){alert("fail");}
		});
		
	}
</script>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#createModal">create</button>

<button class="btn btn-primary btn-lg" data-toggle="modal"   onclick = "modifyCheck(),getModifyName();">modify</button>

<button class="btn btn-primary btn-lg" data-toggle="modal"  onclick="delConfirm();">delete</button>

<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">create new</h4>
            </div>
            <div class="modal-body">
            <input type="text"  id="create"  value="" /> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">cancel</button>
                <button type="button" class="btn btn-primary" onclick="inputCheck('CreateServlet',$('#create').val());">submit</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">create new</h4>
            </div>
            <div class="modal-body">
            <input type="text"  id="modify"  value=""
       			onfocus = 'onFocus(this)'
       			onBlur = 'onBlur(this)'
            /> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">cancel</button>
                <button type="button" class="btn btn-primary" id = "modifyClick" onclick="inputCheck('ModifyServlet',$('#modify').val(),$(':checkbox:checked').val());">submit</button>
            </div>
        </div>
    </div>
</div>





<form method="post" id="list" name="list">
<!-- action="DeleteServlet" name="deleteName" -->


<div class="table-responsive">
<table class="table table-hover ">


<tr class="active">
	<th><input type="checkbox" name="all" onClick="AllChecked();" /></th>
	<th>id</th>
	<th>name</th>
	<th>created</th>
	<th>modified</th>
</tr>

<c:forEach var="article" items="${articles}">

<tr class="info">
    <td><input type="checkbox" name="hoge" id="hoges" value="${article.id}"></td>
	<td>${article.id}</td>
	<td>${article.name}</td>
	<td>${article.created}</td>
	<td>${article.modified}</td>
</tr>
</c:forEach>
</table>
</div>
</form>
</body>
</html>