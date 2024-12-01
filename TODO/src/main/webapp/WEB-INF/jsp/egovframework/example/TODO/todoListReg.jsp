<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String userID = (String) session.getAttribute("userID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/egovframework/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>TO-DO리스트 작성-My Day</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="todoList">
		<div class="todoTitle"><p>MY TO-DO LIST</p></div>
		<div class="todoCnst">
			<table>
				<tr>
					<td><input class="todo" id="todo" placeholder="할 일" /> </td>
					<td><input class="todomemo" id="todoMemo" placeholder="상세 내용이 있다면 여기에 적어주세요"/></td>
				</tr>
			</table>
				<button id="add" name="add" >ADD </button>
		<!-- /todoCnst -->
		</div>

  			<!-- 할일 목록 테이블 -->
  			<table class="todoTable" id="todoTable">
				<thead>
      				<tr>
       			 		<th id="todoTableTh" style="background-color:#fafafa; font-size:20px">할&nbsp;일</th>
      				</tr>
    			</thead>
    			<tbody>
    				<input type="hidden" id="ID" name="ID" value="<%= userID %>" />	
      			<!-- 여기에 할 일이 추가됩니다 -->
    			</tbody>
  			</table>
  			<div class="save" >
  				<button type="submit" class="saveBtn" id="saveBtn">저장</button>
  			</div>
		
  	<!-- /todoList -->			
	</div>
	
<script>

	$(document).ready(function() {
	//tbody 안에 할일 목록이 있는지 확인
		if ($("#todoTable tbody th").length > 0) {
			$("#todoTableTh").css("visibility", "visible");
		} else {
			$("#todoTableTh").css("visibility", "hidden")
		}
	});

	var todoCount = 0;
	//Add 버튼 클릭 시 실행되는 이벤트
	$("#add").click(function() {
  		// 입력된 할일과 상세 내용 텍스트를 가져옴
  		var todoText = $("#todo").val();
  		var todoMemo = $("#todoMemo").val();
  			// 할 일이 비어있는지 확인
  			if (todoText.trim() === "") {
    			alert("할 일을 입력해주세요!");
    			return;
  			}else if(todoText.trim() != "" && todoMemo.trim() != ""){
	  			todoCount++;
	 			 // 테이블에 새로운 행 추가
				 var newRow =  "<div class='todo-item' value='"+todoCount+"'>" + 
								   "<tr class='todoTr' >" +
				 					"<td >" +
									"<input type='checkbox' class='completeYn' id='complete_yn_"+todoCount+"' name='COMPLETE_YN' value='' />" +
				 					"</td>" +
				 					"<td>" +
									"<input style='width:400px' type='text' class='todoText' id='todoTitle_"+todoCount+"' name='TITLE' value='" + todoText + "'/>-" +
									"</td>" +
									"<td>" +
									"<input style='width:550px' type='text' class='memo' id='todo_cnst_"+todoCount+"' name='CNST' value='" + todoMemo + "'/>" +
									"</td>" +
				
										"<button class='deleteBtn' onclick='deleteRow("+todoCount+");'>삭제</button>" +
									"<input type='hidden' class='boardId' value='"+todoCount+"' name='BOARD_ID' id='board_id_"+todoCount+"'/>" +
									"</tr>" +
									"</div>" 
							
		 				 $("#todoTable tbody").append(newRow);
		 
		  				// 입력창 초기화
		 	 			$("#todo").val("");
		 	 			$("#todoMemo").val("")
		 	 
  	 			//할일 리스트 제목 보이게
  				$("#todoTableTh").css("visibility", "visible");
  				}else if(todoText.trim() != ""){
  					 todoCount++;
	 					 var newRow =  "<div class='todo-item' value='"+todoCount+"'>" + 
						   "<tr class='todoTr' >" +
		 					"<td >" +
							"<input type='checkbox' class='completeYn' id='complete_yn_"+todoCount+"' name='COMPLETE_YN' value='' />" +
		 					"</td>" +
		 					"<td>" +
							"<input style='width:400px' type='text' class='todoText' id='todoTitle_"+todoCount+"' name='TITLE' value='" + todoText + "'/>" +
							"</td>" +
							"<td>" +
							"<input style='width:550px' type='text' class='memo' id='todo_cnst_"+todoCount+"' name='CNST' value='" + todoMemo + "'/>" +
							"</td>" +
		
								"<button class='deleteBtn' onclick='deleteRow("+todoCount+");'>삭제</button>" +
							"<input type='hidden' class='boardId' value='"+todoCount+"' name='BOARD_ID' id='board_id_"+todoCount+"'/>" +
							"</tr>" +
							"</div>" 
						
	 				 $("#todoTable tbody").append(newRow);
	 
	  				// 입력창 초기화
	 	 			$("#todo").val("");
	 	 			$("#todoMemo").val("")
	 	 
	  	 			//할일 리스트 제목 보이게
	  				$("#todoTableTh").css("visibility", "visible");
  				}
	});

// 삭제버튼
function deleteRow(value) {
	console.log("삭제클릭");
	 $("div[value='" + value + "']").remove();
	 updateRowIndexes();
	 console.log("삭제끝");
	 
}

// 삭제 시 순번 다시 매김
function updateRowIndexes() {
	$(".todo-item").each(function (index) {
	        const newBoardId = index + 1; // 새로 매길 boardId 값
	        $(this).attr("value", newBoardId); // div의 value 갱신
	        $(this).find(".boardId").val(newBoardId); // hidden input의 값 갱신
	        $(this).find(".completeYn").attr("id", "complete_yn_"+newBoardId+"");
	        $(this).find(".todoText").attr("id", "todoTitle_"+newBoardId+"");
	        $(this).find(".memo").attr("id", "todo_cnst_"+newBoardId+"");
	        $(this).find(".deleteBtn").attr("onclick", "deleteRow("+newBoardId+"); "); // deleteRow 함수 호출 시 ID 갱신
	  });
}

// 저장버튼
$("#saveBtn").click(function () {
	if($("#todoTitle_1").val() == ''){
	 	alert("최소 하나 이상의 할 일을 입력해주세요.");
	}
	else{
    	var titles = [];
    	var cnsts = [];
    	var completeYns = [];
    	var boardIds = [];
    	var id = $("#ID").val();

    	// 동적으로 추가된 todo-item들을 모두 탐색
    	$(".todo-item").each(function () {
        	titles.push($(this).find(".todoText").val()); 
        	cnsts.push($(this).find(".memo").val());    
        	completeYns.push($(this).find(".completeYn").is(":checked") ? "Y" : "N"); 
        	boardIds.push($(this).find(".boardId").val()); 
    	});

    		console.log(titles, cnsts, completeYns, boardIds); 

   		$.ajax({
       		type: 'POST',
        	url: '/saveTodo.do',
        	data: {
            	"titles": titles,
            	"cnsts": cnsts,
            	"completeYns": completeYns,
            	"boardIds": boardIds,
            	"id" : id
        	},
        	traditional: true, // 배열 데이터를 제대로 전달하기 위한 설정
        	success: function (response) {
            	alert("저장 성공!");
        	},
        	error: function (xhr, status, error) {
            	console.log('Error:', xhr.responseText); // 에러 메시지 출력
            	alert("저장 실패!");
        	}
    	});
	}
});
</script>
</body>
</html>