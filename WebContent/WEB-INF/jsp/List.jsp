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



<body>
<script  type="text/javascript">
function AllChecked(){
	var allFrom =  document.forms["list"].all;
	var all =allFrom.checked;
	 for (var i=0; i<document.forms["list"].hoge.length; i++){
		 document.forms["list"].hoge[i].checked = all;
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
  
	
	function deleteData(){
	  document.getElementById('list').action="DeleteServlet";
}
	function modifyData(){
		document.getElementById('list').action="ModifyServlet";
	  }
	
	function createPost(url){
		var myForm = document.createElement("form");
		myForm.method = "post";
		myForm.action = url;
		var myInput = document.createElement("input");
		myInput.name = "name";
		var name = document.getElementById('create').value;
		myInput.value = name;
		myInput.stytle = "hidden";
		myForm.appendChild(myInput);	
		document.body.appendChild(myForm);
		myForm.submit();
		document.body.removeChild(myForm);
	}
	function alertCheck(url){
		var name = document.getElementById('create').value;
		var confirmT = confirm(name);
		var length = encodeURI(name).replace(/%../g,"*").length;
		
		if(confirmT != true ){
			return false;
		}else{
			$('#myModal').modal('hide');
			//return inputCheck();
			createPost(url);
		}
	}
	
	function inputCheck(url){
		var name = document.getElementById('create').value;
		var length = encodeURI(name).replace(/%../g,"*").length;
		if (length >30){
			alert("just 30!!!");
		}else{
			alertCheck(url);
		}
	}
</script>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">create</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">create new</h4>
            </div>
            <div class="modal-body">
            <input type="text"  id="create"  value="用意test123" /> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">cancel</button>
                <button type="button" class="btn btn-primary" onclick="inputCheck('CreateServlet');">submit</button>
            </div>
        </div>
    </div>
</div>

<form method="post" id="list" name="list">
<!-- action="DeleteServlet" name="deleteName" -->

<input type="text" name="modify" value="modify" >
<input type="submit" value="modify" onclick="modifyData();">

<input type="submit" value="delete" onclick="deleteData();" >


<table>
<tr></tr>

<tr>
	<th><input type="checkbox" name="all" onClick="AllChecked();" /></th>
	<th>id</th>
	<th>name</th>
	<th>created</th>
	<th>modified</th>
</tr>

<c:forEach var="article" items="${articles}">

<tr>
    <td><input type="checkbox" name="hoge" value="${article.id}"></td>
	<td>${article.id}</td>
	<td>${article.name}</td>
	<td>${article.created}</td>
	<td>${article.modified}</td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>