/**
 * 
 */
	
function showPrompt(){
  var result = window.prompt("何か入力してください。", "hoge");
 
  if(result == null){
    window.alert("キャンセルされました。");
  }else{
    window.alert("入力された文字は「" + result + "」です。");
  }
}