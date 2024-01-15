<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/top.jsp"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Calendar</title>
    <style>
        #calendarTable {
            width: 100%;
            border: 1px solid #dddddd;
        }
        .calTr{
        	border: 1px solid #dddddd !important;
        }

        .calTh, .calTd {
            border: 1px solid #dddddd !important;
            text-align: center;
            position: relative;
        }
        .calTd{
        	width: 200px; 
            height: 170px;  
        }
        
        .calTh {
            background-color: #f2f2f2;
        }
        
        #sunday{
            color: red;
        }
        
        #saturday{
        	color: blue;
        }
        
        #title{
        	color: gray;
        }
        
        .day-number {
            position: absolute;
            top: 5px;
            left: 5px;
        }
        .myCC1{
        	color: black;

        }
        .myCC2{
        	color: blue;
        }
    </style>
    <link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link href="../css/common.css" rel="stylesheet">
</head>
<main class="container">
<br><br>
    <h2 id="calendarTitle" align="center">${year} 년 ${month}월</h2>
    <br><br>
    <div align="right">
    	<span class="myCC1"><b>${month}월 나의기록&ensp;<span class="myCC2">${myCC}</span>건</b></span>
   	</div>
<table id="calendarTable">
    <tr class='calTr'>
        <th class='calTh' id='sunday'>일</th>
        <th class='calTh'>월</th>
        <th class='calTh'>화</th>
        <th class='calTh'>수</th>
        <th class='calTh'>목</th>
        <th class='calTh'>금</th>
        <th class='calTh' id='saturday'>토</th>
    </tr>
    <tr class='calTr'>
    	<!-- 첫주에 요일에 맞춰 공백 값 주기 -->
        <c:forEach var="i" begin="1" end="${firstDayOfWeek}">
            <td class='calTd'></td>
        </c:forEach>
        
		<!-- 날짜일 출력 -->
        <c:forEach var="day" begin="1" end="${dayOfMonth}">
            <td class='calTd'>
                <span class='day-number'>${day}</span>
                <c:forEach items="${myCalendarList}" var="myCalendarList">
                	<c:if test="${myCalendarList.inputDay == day}">
                		<a href="detailBoard.do?board_no=${myCalendarList.board_no}&screen=myRecord"><img src='../img/${myCalendarList.cls2_img_nm }' width='100px;' /></a>
                	</c:if>
				</c:forEach>
			</td>
			
			<!-- 토요일마다 개행 -->
            <c:if test="${(firstDayOfWeek + day - 1) % 7 eq 6}">
                </tr><tr class='calTr'>
            </c:if>
        </c:forEach>
    </tr>
</table>
<%@include file="../include/bottom.jsp"%>
</main>
<script src="./js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="../js/jquery-1.10.2.js" ></script>
<script type="text/javascript"></script>
<script>

</script>