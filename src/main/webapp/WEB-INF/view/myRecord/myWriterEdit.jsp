<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style type="text/css">
</style>
<meta charset="UTF-8">
<head>
<title>Emotions Project</title>
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style type="text/css">
 	.textLengthWrap{
 		white-space: nowrap;
 	}
 </style>
 <body>
<main class="container">
<br>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
      <c:if test="${empty myEdit}">
      	<h2 class="display-5 link-body-emphasis mb-1">나의 ${tc+1}번째 기록</h2>
      </c:if>
      <c:if test="${not empty myEdit}">
      	<fmt:formatDate value="${myEdit.board_input_dt}" var="dt" pattern="yyyy-MM-dd HH:mm" />
      	<h2 class="display-5 link-body-emphasis mb-1">${dt}기록</h2>
      </c:if>
     <br>
     <c:if test="${not empty myEdit}">
     <label class="form-label">선택했던 감정</label>
      <div class="row">
      		<!-- 대분류 -->
	       <div class="col-md-6">
				<input value="${myEdit.cls2_nm}" class="form-control" readonly="readonly">
			</div>
			<!-- 소분류 -->
			 <div class="col-md-6 mb-3">
			 	<input value="${myEdit.cls3_nm}" class="form-control"  readonly="readonly">
			 	<input value="${myEdit.cls3_cd}" id="cls3_cd" type="hidden">
			</div>
		</div>
	  </c:if>
      <label for="exampleFormControlInput1" class="form-label">오늘의 감정</label>
      <div class="row">
      		<!-- 대분류 -->
	       <div class="col-md-6">
			  <select class="form-select" id="Select2Emotion" aria-label="Default select example" onchange="selectCls2Emotion()">
			  	<option value="" >선택해주세요</option>
			   <c:forEach items="${cls2Emotion}" var="el2">
				  <option value="${el2.cls2_cd}">${el2.cls2_nm}</option>
			  </c:forEach>
			  </select>
			</div>
			<!-- 소분류 -->
			 <div class="col-md-6 mb-4">
			  <select class="form-select" id="Select3Emotion" aria-label="Default select example">
				  	<option value="" >선택해주세요</option>
			  	  <c:forEach items="${cls3Emotion}" var="el3">
				  	<option value="${el3.cls3_cd}" >${el3.cls3_nm}</option>
				  </c:forEach>
			  </select>
			</div>
		</div>
       <div class="mb-4">
       	  <input type="hidden" id="board_no" value="${myEdit.board_no}">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" class="form-control" id="board_title" maxlength="50"  placeholder="나의 오늘 하루에 제목을 50자내로 작성한다면?" value="${myEdit.board_title}">
		</div>
		<div class="mb-4">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" id="board_detail" rows="15" style="resize: none;" maxlength="500" placeholder="욕설, 비방글을 제외 한 본인의 감정을 위주로 작성해주시면 됩니다.&#13;&#10; 최대한 구체적으로 본인의 감정을 500자 이내로 작성해보세요">${myEdit.board_detail}</textarea>
		  <div class="textLengthWrap">
		  	<span class="textCount">0자</span>
		  	<span class="textTotal">/500자</span>
		  </div>
		</div>
      </div>
      <c:if test="${not empty myEdit}">
		<div class="form-check form-switch" align="right">
		  <input class="form-check-input" type="checkbox" role="switch" id="hideRecord" name="hideChk" value="Y" onchange="hideRecord(${detailList.board_no})">
		  <label class="form-check-label" for="flexSwitchCheckDefault"><b>비공개 여부</b></label>
		</div>
		<br><br>
		</c:if>
      <div class="row">
	       <div class="col-md-6">
	       	  <button class="btn btn-secondary btn-lg btn-block" id="closeBtn" onclick="closeBtn()">닫기</button>
	       </div>
	       <div class="col-md-6">
	       <c:if test="${empty myEdit}">
	       	  <button class="btn btn-primary btn-lg btn-block" id="writerOk" onclick="writerOk()">나의 기록 저장</button>
	       </c:if>
	       <c:if test="${not empty myEdit}">
	       	  <button class="btn btn-primary btn-lg btn-block" id="editOk" onclick="editOk()">나의 기록 수정</button>
	       </c:if>
	       </div>
      </div>
    </div>
<br><br>
</main>
<script src="./js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="../js/jquery-1.10.2.js" ></script>
<script>
jQuery.ajaxSetup({cache:false});

//path 경로 설정 
function getContextPath() {
  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
};

//대분류고정 시키기 
function setSelectValue(Select2Emotion, value) {
  var selectEmotion = document.getElementById(Select2Emotion);
  if (selectEmotion) {
      for (var i = 0; i < selectEmotion.options.length; i++) {
          if (selectEmotion.options[i].value === value) {
        	  selectEmotion.selectedIndex = i;
              break;
          }
      }
  }
}

var cls2_cd = "${cls2_cd}";
//이 함수를 호출하여 선택한 조건을 설정합니다
setSelectValue('Select2Emotion', cls2_cd);



//대분류 선택 시 중분류 값 가져오기
function selectCls2Emotion() {
	var cls2_cd = $("#Select2Emotion option:selected").val();
	var path = getContextPath();
	var board_no = "${myEdit.board_no}";
	
	if(""==board_no || null ==board_no){
		var link = "myWriter.do?cls2_cd="+cls2_cd;
		location.href=link;
	}else{
		var link = "myEdit.do?cls2_cd="+cls2_cd;
		location.href=link;
	}
}

//textarea 글자수 세기, 글자수 제한
$('#board_detail').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
    
    // 글자수 제한
    if (content.length > 500) {
    	// 200자 부터는 타이핑 되지 않도록
        $(this).val($(this).val().substring(0, 500));
        // 200자 넘으면 알림창 뜨도록
        alert('글자수는 500자까지 입력 가능합니다.');
    };
});

//글 작성 저장하기 
function writerOk() {
	if ("" == $('#board_title').val().trim()) {
		alert("글 제목을 입력해주세요.");
		$('#board_title').focus();
		return false;
	} else if("" == $('#board_detail').val().trim()){
		alert("글 내용을 입력해주세요.");
		$('#board_detail').focus();
		return false;
	}else if("" == $("#Select3Emotion option:selected").val()){
		alert("감정을 선택해주세요.");
		return false;
	}else{
		var writeData = {}; 
		writeData.board_title = $("#board_title").val();
		writeData.board_detail = $("#board_detail").val();
		writeData.cls3_cd = $("#Select3Emotion option:selected").val();
		$.ajax({ 
			type : 'post'
			, url :"/writeOk.do"
			, contentType : "application/json"
			, data : JSON.stringify(writeData)
			, success : function(data) {
				if ("ok" == data) {
					alert("오늘의 감정은 당일에 한해서 수정가능합니다.");
					opener.location.href="/recordList.do?screen=myRecord";
               	 	window.close();
				}
			}
		});

	}
}
//글 수정 저장하기 
function editOk() {
	var cls3_cd1 = $("#Select3Emotion option:selected").val();
	var cls3_cd2 = $("#cls3_cd").val();
	
	if ("" == $('#board_title').val().trim()) {
		alert("글 제목을 입력해주세요.");
		$('#board_title').focus();
		return false;
	} else if("" == $('#board_detail').val().trim()){
		alert("글 내용을 입력해주세요.");
		$('#board_detail').focus();
		return false;
	}else{
		var editData = {}; 
		editData.board_title = $("#board_title").val();
		editData.board_no = $("#board_no").val();
		editData.board_detail = $("#board_detail").val();
		if(null == cls3_cd1 || "" ==cls3_cd1){
			editData.cls3_cd = cls3_cd2;
		}else{
			editData.cls3_cd = cls3_cd1;
		}
		$.ajax({ 
			type : 'post'
			, url :"/editOk.do"
			, contentType : "application/json"
			, data : JSON.stringify(editData)
			, success : function(data) {
				if ("ok" == data) {
					alert("오늘의 감정은 당일에 한해서 수정가능합니다.");
					opener.location.href="/recordList.do?screen=myRecord";
               	 	window.close();
				}
			}
		});

	}
}


// 닫기 버튼누르면 팝업창 닫기
function closeBtn(){
    opener.location.reload();
    window.close();
}

//비공개여부
function hideRecord(board_no) {
	var path = getContextPath();
	var hide = $("input[name='hideChk']:checked").val();
	if("Y" == hide){
		 if (confirm("해당 글을 비공개로 전환 하시겠습니까?")) {
		      $.ajax({
		           type : 'post'   
		           , url : path+"/hideChk.do"
		           , data: {	
		        	   board_no : board_no
		        	   ,hide : hide
		           	}
		           , dataType: 'text'
		           , success: function (data){
		              if("ok" == data){
		            	  alert("해당 글이 비공개로 전환 되었습니다.");
	                	 var link = '/detailBoard.do?board_no='+board_no;
	                     location.replace(link);
	               		}
	              	}
	           });
	      };
	}else if("" == hide || null == hide){
		hide = "N";
		$.ajax({
	           type : 'post'   
	           , url : path+"/hideChk.do"
	           , data: {	
	        	   board_no : board_no
	        	   ,hide : hide
	           	}
	           , dataType: 'text'
	           , success: function (data){
	              if("ok" == data){
	                 alert("해당 글이 공개로 전환 되었습니다.");
             	 var link = '/detailBoard.do?board_no='+board_no;
                  location.replace(link);
            		}
           	}
        });
	}
	
}

</script>
</body>
</html>