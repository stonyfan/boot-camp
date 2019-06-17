<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head><title>list</title> </head>



<body>
<form method="post" action="CreateServlet">
<!-- <input type="button" value="create" id="create" name="create" onclick="showPrompt();"> -->
<input type="text" name="name">
<input type="submit" value="set">
</form>


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
</script>
<form method="post" action="DeleteServlet" name="deleteName">
<input type="submit" value="delete"  >
<table>
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