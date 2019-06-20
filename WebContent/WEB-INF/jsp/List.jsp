<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>list</title> 
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>



<body>


<script language="JavaScript" type="text/javascript">
function AllChecked(){
	var allFrom =  document.forms["deleteName"].all;
	var all =allFrom.checked;
	 for (var i=0; i<document.forms["deleteName"].hoge.length; i++){
		 document.forms["deleteName"].hoge[i].checked = all;
	    }
}
function DisChecked(){
    var checks = document.forms["deleteName"].hoge;
    var checksCount = 0;
    for (var i=0; i<checks.length; i++){
      if(checks[i].checked == false){
    	  document.forms["deleteName"].all.checked = false;
      }else{
        checksCount += 1;
        if(checksCount == checks.length){
        	document.forms["deleteName"].all.checked = true;
        }
      }
    }
  }
  
	function modifyData(){
	  document.getElementById('list').action="ModifyServlet";
  }
	
	function createData(){
	document.getElementById('list').action="CreateServlet";
  }
	
	function deleteData(){
	  document.getElementById('list').action="DeleteServlet";
}
</script>




<form method="post" id="list" >

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>







<!-- action="DeleteServlet" name="deleteName" -->

<input type="text" name="name" value="set new document" >
<input type="submit" value="set" onclick="createData();">

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