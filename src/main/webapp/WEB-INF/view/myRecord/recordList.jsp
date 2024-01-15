<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#serachDiv{
		width: 48%;
		float: right;
		margin-right: 17%
	}
	#listCountDiv{
		float: left;
		margin-right: 15%
	}
	#totalDiv{
		display: flex;
		width: 100%;
	}
	.listA:link {
	  text-decoration: none;
	  color: black;
	}
	 
	.listA:visited {
	  text-decoration: none;
	  color: black;
	}
	 
	.listA:hover {
	  text-decoration: underline;
	  color: black;
	}
	 
	.listA:active {
	  text-decoration: underline;
	  color: black;
	}
</style>
<meta charset="UTF-8">
  <head>
    <title>Emotions Project</title>
<link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="../css/common.css" rel="stylesheet">
<main class="container">
<br><br>
	<c:if test="${'myRecord' == screen}">
		<c:if test="${toDay == 0}">
			<div class="d-grid gap-2 col-6 mx-auto">
				<button type="button" class="btn btn-outline-secondary btn-lg" onclick="popup('write')">오늘의 감정 기록하기</button>	
			</div>
			<br><br><br>
		</c:if>
		<c:if test="${toDay > 0}">
			<div class="d-grid gap-2 col-6 mx-auto">
				<button type="button" class="btn btn-outline-secondary btn-lg" onclick="popup('edit')">오늘의 감정 수정하기</button>	
			</div>
			<br><br><br>
		</c:if>
	</c:if>
    <div class="row" align="center">
    <c:forEach items="${cls2Emotion}" var="el">
	      <div class="col-lg-3">
			<a href="#" onclick="recordList('${el.cls2_cd}')"><img alt="${el.cls2_nm}" src="../img/${el.cls2_img_nm}" width="120" height="120"></a>
			<br><br>
	        <h2 class="fw-normal">${el.cls2_nm}</h2><br>
	      </div>
     </c:forEach>
     	<p>Click on the emotion</p>
	<div>
		<br><br><br><br><br>
	</div>
      <div id="listAllDiv">
      	<div id="totalDiv">
	      	<div id="listCountDiv">
	      		<select class="form-select form-select-xs" id="pageUnit" name="pageUnit" onchange="selectPage()">
				  <option value="10" selected>10개</option>
				  <option value="20">20개</option>
				  <option value="30">30개</option>
				  <option value="50">50개</option>
				</select>
	      	</div>
	      	<button onClick="reboot()" class="btn" >초기화</button>
			<div class="input-group" id="serachDiv">
					<select class="form-select-sm" name="search1" id="search1">
					  <option value="" selected>검색조건</option>
					  <option value="board_title">제목</option>
					  <option value="board_detail">내용</option>
					  <c:if test="${'yourRecord' == screen}">
					  	<option value="user_id">작성자아이디</option>
					  </c:if>
					</select>
				  <input type="text" class="form-control" aria-label="Text input with segmented dropdown button" id="search2" name="search2" placeholder="검색어입력" value="${paging.search2}">
				  <button type="button" class="btn btn-outline-secondary" id="serchBtn" onclick="searchBtn()" disabled>검색</button>&emsp;
			</div>
			<c:if test="${'myRecord' == screen}">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	  				<button class="btn btn-outline-danger me-md-2" type="button" onclick='deleteSelected()' >삭제</button>
				</div>
			</c:if>
		</div>
		<table class="table">
		<caption align="top">총 ${tc}건</caption>
		  <thead class="table-light">
		    <tr>
		    	<c:if test="${'myRecord' == screen}">
		    		<th class="col-xs-1" ><input type="checkbox" id="checkall"></th>
		    	</c:if>	
			    <th class="col-xs-1" >no</th>
			    <th class="col-xs-1" >감정</th>
			    <c:if test="${'myRecord' == screen}">
			    	<th class="col-xs-1" >제목</th>
			    	<th class="col-xs-1" colspan="3">내용</th>
			    </c:if>
			    <c:if test="${'yourRecord' == screen}">
			    	<th class="col-xs-1" >작성자 아이디</th>
			    	<th class="col-xs-1" colspan="3">제목</th>
			    </c:if>
			    <th class="col-xs-1">작성일자</th>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach items="${recordList}" var="myAllList">
		    <tr>
		    <!-- 나의 기록 -->
		    <c:if test="${'myRecord' == screen}">
		    	<td class="col-xs-1"><input type="checkbox" name="list_check" value="${myAllList.board_no}"></td>
		    </c:if>
		    	<td class="col-xs-1">${myAllList.rownum}</td>
		    	<td class="col-xs-1">${myAllList.cls3_nm}</td>
		    	<c:if test="${'myRecord' == screen}">
		    	<td class="col-xs-2 text-left title" title="${myAllList.board_title}"><span>${myAllList.board_title}</span></td>
		    	<td class="col-xs-4 text-left ellipsis">
		    		<span>
		    			<a href="detailBoard.do?board_no=${myAllList.board_no}&screen=${screen}" class="listA">${myAllList.board_detail}</a></span>
		    			<td>
			    			<c:if test="${myAllList.reply_count ne 0}">
			    				<b style="color: gray;">[${myAllList.reply_count}]</b>
			    			</c:if>
		    			<td>
		    	</td>
		    	</c:if>
		    	
		    	<!-- 너의기록 -->
		    	<c:if test="${'yourRecord' == screen}">
		    	<td class="col-xs-2 text-left title" >${myAllList.user_id}</td>
		    	<td class="col-xs-4 text-left ellipsis" title="${myAllList.board_title}">
		    		<span>
		    			<a href="detailBoard.do?board_no=${myAllList.board_no}&screen=${screen}" class="listA">${myAllList.board_title}</a></span>
		    			<td>
			    			<c:if test="${myAllList.reply_count ne 0}">
			    				<b style="color: gray;">[${myAllList.reply_count}]</b>
			    			</c:if>
		    			<td>
		    	</td>
		    	</c:if>
		    	<fmt:formatDate value="${myAllList.board_input_dt}" var="dt" pattern="yyyy-MM-dd HH:mm" />
		    	<td class="col-xs-2" >${dt}</td>
		    </tr>
		    </c:forEach>
		    <c:if test="${empty recordList}">
		    	<tr>
		    		<td colspan="8" align="center">No record</td>
		    	</tr>
		    </c:if>
		  </tbody>
		</table>
	  </div>
    </div>
    <br><br>
    <nav class="pageNav" aria-label="Page navigation example">
	   <ul class="pagination justify-content-center">
	      <c:if test="${1 == paging.startPage}">
	      	<li class="page-item disabled">
	      		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
	      	</li>
	      </c:if>
	      <c:if test="${1 != paging.startPage}">
	      	<li class="page-item">
	      		<a class="page-link" href="recordList.do?page=${paging.startPage-1}&search1=${paging.search1}&search2=${paging.search2}&screen=${screen}" tabindex="-1" aria-disabled="true">Previous</a>
	      	</li>
	      </c:if>
	      <c:if test="${empty recordList}">
	      	<li class="page-item active">
					<span class="page-link">1</span>
				</li>
	      </c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
 				<c:choose>
					<c:when test="${i == paging.nowPage}">
						<li class="page-item active">
							<span class="page-link">${i}</span>
						</li>
 					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="recordList.do?page=${i}&search1=${paging.search1}&search2=${paging.search2}&pageUnit=${paging.pagelen}&screen=${screen}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.totalPages == paging.endPage}">
	      		<li class="page-item disabled">
	      			<a class="page-link" href="#" >Next</a>
	      		</li>
	      	</c:if>
	      	<c:if test="${paging.totalPages != paging.endPage}">
	  	 		<li class="page-item">
	      			<a class="page-link" href="recordList.do?page=${paging.endPage+1}&search1=${paging.search1}&search2=${paging.search2}&screen=${screen}">Next</a>
	      		</li>
	      	</c:if>
	  	</ul>
	</nav>
    <%@include file="../include/bottom.jsp"%>
    
    <div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>

</main>
<script src="./js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="../js/jquery-3.7.1.js" ></script>
<script src="../js/jquery-ui.js"></script>
<script type="text/javascript">
jQuery.ajaxSetup({cache:false});

var screen = '${screen}';
//초기화버튼
function reboot(){
	document.body.innerHTML = "";
	var link = "recordList.do?screen="+screen;
	location.href=link;
}

//path 경로 설정 
function getContextPath() {
var hostIndex = location.href.indexOf( location.host ) + location.host.length;
return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
};


//오늘의 감정 기록/수정 클릭시 팝업창 오픈
function popup(val) {
	if("write" == val){
		url = "myWriter.do";
	}else{
		url = "myEdit.do";
	}
	// 이름을 정하면 팝업창을 동일 팝업창으로 인식 다수의 팝업창 발생 하지않음 / 지금 처럼 이름을 _blank 또는 이름을 지정하지 않을 경우 새 팝업으로 인식 
	specs = "width=1200,height=800,top=200,left=100,toolbar=no,menubar=no,scrollbars=no,resizeble=yes";
	//var childWindow = window.open(url,specs, name);
	window.open(url, specs);
	//$('div.modal').modal({remote : 'myWriterEdit.jsp'});
	//window.open(url, 'dd' ,options)
	//window.open(url, specs);
	//window.open('경로', '팝업 이름', '옵션');

	return false;
}

//출력 건수 고정 시키기 
const el = document.getElementById('pageUnit');  //select box
const len = el.options.length;
//select box의 option 갯수만큼 for문 돌림
for (let i=0; i<len; i++){  
  	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
    if(el.options[i].value == ${paging.pagelen}){
    	el.options[i].selected = true;
    }
}

//검색조건 고정 시키기 
const search = document.getElementById('search1');
const searchLen = search.options.length;
//select box의 option 갯수만큼 for문 돌림
for (let k=0; k<searchLen; k++){  
  	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
    if(search.options[k].value == "${paging.search1}"){
    	search.options[k].selected = true;
    }
}

//개수별로 페이징 하기 
function selectPage(){
    var nowPaging = $("#pageUnit option:selected").val();
    var search1 = "${paging.search1}"; 
    var search2 = "${paging.search2}";
    var cls2_cd = "${cls2_cd}";
    
	var path = getContextPath();
	var link = "recordList.do?pageUnit="+nowPaging+"&search1="+search1+"&search2="+search2+"&cls2_cd="+cls2_cd+"&screen="+screen;
	location.href=link;
}

//검색버튼 활성 비활성화
$("#search2").change(function() {
    if("" != $.trim($("#search2").val())){
        $('#serchBtn').removeAttr("disabled");
    }
});

//검색버튼 클릭 시 실행
function searchBtn() {
	var search1 = $("#search1 option:selected").val();
	var search2 = $("#search2").val();
	var nowPaging = $("#pageUnit option:selected").val();
	 var cls2_cd = "${cls2_cd}";
	var path = getContextPath();
	if("" == search1 || null == search1){
		alert('검색 조건을 선택해주세요');
	}else{
		var link = "recordList.do?search1="+search1+"&search2="+search2+"&pageUnit="+nowPaging+"&cls2_cd="+cls2_cd+"&screen="+screen;
		location.href=link;
	}
}

//감정 별로 목록 띄우기
function recordList(cls2_cd) {
	debugger;
	var search1 = $("#search1 option:selected").val();
	var search2 = $("#search2").val();
	var nowPaging = $("#pageUnit option:selected").val();
	var path = getContextPath();
	var link = "recordList.do?cls2_cd="+cls2_cd+"&search1="+search1+"&search2="+search2+"&pageUnit="+nowPaging+"&screen="+screen;
	location.href=link;
}


//체크박스 체크로 삭제하기 
function deleteSelected() {
	var path = getContextPath();
    var checkArr = [];     // 배열 초기화
    $("input[name='list_check']:checked").each(function(i) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    })
 	
    if(0 == checkArr.length){
    	alert("삭제할 글을 선택하여 주십시오.");
    }else{
    	if (confirm("선택하신 글을 삭제하시겠습니까? \n삭제 시 댓글 또한 함께 삭제 됩니다.")) {
        $.ajax({
            url: path + "/writeDelete.do"
            , type: 'post'
            , dataType: 'text'
            , data: {deleteChek: checkArr}
            , success : function(data) {
    			if("ok" == data){
    				location.replace("recordList.do?screen="+screen); 
    				}else if("no" == data){
    					alert("본인의 글만 삭제가 가능합니다.");
    					$("input[name=list_check]").prop("checked",false);
    				}
        		}
        	});
    	} 		
    }
}

//최상단 체크 박스 클릭시 전체 클릭
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=list_check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=list_check]").prop("checked",false);
        }
    })
})
</script>
</body>
</html>
