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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
  /*
	function modifyData(){
	  document.getElementById('list').action="ModifyServlet";
  }
	*/
	function createData(){
	document.getElementById('list').action="CreateServlet";
  }
	
	function deleteData(){
	  document.getElementById('list').action="DeleteServlet";
}
</script>



<form method="post" id="list" name="list">
<!-- action="DeleteServlet" name="deleteName" -->


<input type="text" name="modify" value="modify" >
<input type="submit" value="modify" onclick="modifyData();">

<input type="submit" value="delete" onclick="deleteData();" >

<%@ include file ="Create.jsp" %>

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