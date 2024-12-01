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
<link rel="stylesheet" type="text/css" href="/css/egovframework/todoList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>TODO리스트-My Day</title>
</head>
<body>
	<div class="todoTitle"> <p >TO-DO LIST</p></div>
	<c:choose>    					
		<c:when test="${not empty result}">
			<div class="table-container">
<%-- 				<form id="updateTodo"  method="POST"> --%>
					<table  class="styled-table" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="150"/>
        				
        			</colgroup>
        			<tr>
        				<th align="center" style="border-right:1px solid #ddd">완료여부</th>
        				<th align="center" style="border-right:1px solid #ddd">할 일 </th>
        				<th align="center" style="">상세 내용</th>
        				
        			</tr>
        			
        			<c:forEach var="result" items="${result}" varStatus="status">
            			<tr>
            			<td align="center" class="listtd" style="align-items: center; display: grid;">
    						<input type="checkbox" name="COMPLETE_YN" id="completeYn" value="" 
          					<c:if test="${result.COMPLETE_YN eq 'Y'}">checked</c:if>
          		 			<c:if test="${result.COMPLETE_YN ne 'Y'}"> </c:if> >
						</td>
            			
            			<td align="left" class="listtd" >
            				<input type="text" id="todoText" name="TITLE" value="${result.TITLE}" >
            			</td>
            			<td align="left" class="listtd" >
            				<input type="text" id="memo" name="CNST" value="${result.CNST}" >
            			</td>
            				<input type="hidden" id="boardId" name="BOARD_ID" value="${result.BOARD_ID}" >
            				<input type="hidden" id="tododate" name="TODO_DATE" value="${result.TODO_DATE}" >
            				<input type="hidden" id="ID" name="ID" value="<%= userID %>" />	
            			</tr>
        			</c:forEach>
        			</table>
<%--         		</form> --%>
			</div>
        		 	
        	<div class="regBtn"><button id="update">TO-DO LIST 수정</button></div> 
        	</c:when>
        				
        	<c:when test="${empty result}">
        		<div class="empty"><p>오늘의 할 일이 없습니다.</p></div>
        		<div class="regBtn" ><button onclick="location.href='/todoListReg.do'">TO-DO LIST 등록</button></div> 
        	</c:when>
        </c:choose>



<script type="text/javascript">
	$("#update").click(function () {
	 	if (confirm("수정하시겠습니까?")) {
     		event.preventDefault();
//      		$("input[name='COMPLETE_YN']").each(function () {
//      		    var isChecked = $(this).is(":checked") ? "Y" : "N";
//      		    $(this).attr("value", isChecked); // value 속성을 직접 설정
//      		});
     		
     		var titles = [];
        	var cnsts = [];
        	var completeYns = [];
        	var boardIds = [];
        	var id = $("#ID").val();
        	var tododate = $("#tododate").val();
        	
        	$(".styled-table").each(function () {
            	titles.push($(this).find("#todoText").val()); 
            	cnsts.push($(this).find("#memo").val());    
            	completeYns.push($(this).find("#completeYn").is(":checked") ? "Y" : "N"); 
            	boardIds.push($(this).find("#boardId").val()); 
        	});
        	
//     		var formData = $("#updateTodo").serializeArray();

    		$.ajax({
        		url: "/updateTodoList.do", 
        		type: "POST",
        		data: {
        			"titles": titles,    		
            		"cnsts": cnsts,
            		"completeYns": completeYns,
            		"boardIds": boardIds,
            		"id" : id,
            		"tododate" : tododate
        		},
        		traditional: true,
        		dataType: "text", 
        		success: function () {
       	  			alert("수정완료");
       	  			window.location.href = "/todoList.do";
        		},
       			 error: function () {            		
            		alert("서버 요청 중 문제가 발생했습니다.");
        		}
    		});
	 	}
	});

</script>
</body>
</html>