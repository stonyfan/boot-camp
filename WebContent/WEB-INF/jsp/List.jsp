<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head><title>list</title> </head>
<script type="text/javascript" >
function showPrompt(){
	  var result = prompt("何か入力してください。", "hoge");
	 
	  if(result == null){
	  confirm("キャンセルされました。");
	  }else{
	    confirm("入力された文字は「" + result + "」です。");
	  }
	}
function Check() {
	$.ajax({
		type:"POST",
		url:"../ListServlet",
		data:{
			name:$("#create").val(), 
		},
		dataType:"text",//类型
		beforeSend:function(XMLHttpRequest){
			$("#show").text("loading..");
		},
		success:function(data,textStatus){//data代表servlet返回的数据，随意命名，一般写msg
			$("#show").text(data);//给id为show的div显示返回的text
			$("#show").css("color","red");
		},
	});
}

</script>
<body>
<form method="post" action="CreateServlet">
<!-- <input type="button" value="create" id="create" name="create" onclick="showPrompt();"> -->
<input type="text" name="name">
<input type="submit" value="set">
<input type="button" value="create" id="create" name="create" onclick="showPrompt();">
</form>
<table>
<tr>
	<th>id</th>
	<th>name</th>
	<th>created</th>
	<th>modified</th>
</tr>

<c:forEach var="article" items="${articles }">
<tr>
	<td>${article.id}</td>
	<td>${article.name}</td>
	<td>${article.created}</td>
	<td>${article.modified}</td>
</tr>
</c:forEach>


</table>
</body>
</html>