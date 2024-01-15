<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#cardDiv{
		margin: 10%;
	    word-break: break-all;
	    background-color: #f5f5f2;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    height: 185px; /* Adjust the height as needed */
	    overflow: hidden;
	    text-overflow: ellipsis;
	    text-align: center;
	}
 	.user-id-with-shadow {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Adjust values as needed */
        padding: 5px; /* Add padding for better appearance */
        display: inline-block; /* Ensure the shadow is applied only to the text */
    }
    a:link {
	  text-decoration: none;
	  color: gray;
	}
	 
	a:visited {
	  text-decoration: none;
	  color: gray;
	}
	 
	a:hover {
	  text-decoration: underline;
	  color: gray;
	}
	 
	a:active {
	  text-decoration: underline;
	  color: gray;
	}
</style>
</head>
<meta charset="UTF-8">
  <head>
    <title>Emotions Project</title>
<link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<body>
<br><br>
<main class="container">
		<div class="album py-5 bg-body-tertiary">
			<div class="container">
				<c:if test="${empty interList}">
					<div align="center">
						관심글이 없습니다. 맘에 드는 글을 관심글로 등록해보세요
					</div>
				</c:if>
				<c:if test="${not empty interList}">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
						<c:forEach items="${interList}" var="interList" varStatus="status">
							<div class="col">
								<a href="detailBoard.do?board_no=${interList.board_no}&screen=yourRecord">
									<div class="card shadow-sm">
										<div class="bd-placeholder-img card-img-top" style="width:80%;height: 185px;" id="cardDiv">
											${interList.board_title}
										</div>
										<div class="card-body" align="center">
											<div class="user-id-with-shadow" align="center">
										        ${interList.user_id}
										    </div>
										    <br><br>
											<div class="btn-group justify-content-end" style="width: 100%;">
										        <input type="checkbox" class="btn-check" id="interest_${status.index}" name="interest" value="Y" onchange="interestRecord(${interList.board_no},${status.index})">
										        <label class="btn btn-outline-danger" for="interest_${status.index}">♡</label>
										    </div>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</main>
	<%@include file="../include/bottom.jsp"%>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="../js/jquery-1.10.2.js" ></script>
<script>
jQuery.ajaxSetup({cache:false});


//공개글 비공개글 / 관심글 상세 화면 띄울때 체크 여부
$(document).ready(function(){
	$("input[name=interest]").prop("checked",true);
})


//관심글여부
function interestRecord(board_no,index) {
    var path = getContextPath();
    var checkboxId = "interest_" + index;
    var interest = $("#" + checkboxId).prop("checked");
	debugger;
    if (!interest) {
        // 체크박스가 해제된 경우, interestRecord 함수 실행
        $.ajax({
            type: 'post',
            url: path + "/interestDel.do",
            data: {
                board_no: board_no
            },
            dataType: 'text',
            success: function (data) {
                if ("ok" == data) {
                    alert("관심글에서 해제 되었습니다.");
                    var link = '/interesList.do?board_no=' + board_no;
                    location.replace(link);
                }
            }
        });
    }
}


</script>
</body>
</html>
