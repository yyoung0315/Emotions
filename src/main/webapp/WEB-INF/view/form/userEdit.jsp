<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <head>
    <title>Emotions Project</title>
    <%@include file="../include/top.jsp"%>
	<link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   <link rel="stylesheet" href="../css/bootstrap.min1.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/css/userEdit.css">
<style type="text/css">
	span{
    	color: red;
    }
</style>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원 정보 수정</h4>
        <form class="validation-form" novalidate>
            <div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" value="${userInfo.name}" readonly="readonly">
            </div>
          <div class="mb-3">
            <label for="bday">생년월일</label>
            <input type="date" class="form-control" value="${userInfo.bday}" readonly="readonly">
          </div>
          
          <div class="mb-3">
            <label for="tel">휴대폰 번호<span>*</span></label>
            <input type="tel" class="form-control" id="tel" value="${userInfo.tel}" required>
            <div class="invalid-feedback">
              휴대폰 번호를 입력해주세요.
            </div>
          </div>
          <input type="button" onclick="address_Btn()" value="우편번호 찾기" class="btn btn-primary btn-lg btn-block" ><br><br>
          <div class="mb-3">
          	<label for="tel">우편번호<span>*</span></label>
			<input type="text" class="form-control" id="address_num" value="${userInfo.address_num}" required>
			<div class="invalid-feedback">
	          	우편번호찾기를 눌러주세요
	        </div><br>
			<label for="tel">주소<span>*</span></label>
			<input type="text" class="form-control" id="address" value="${userInfo.address}" required>
			<div class="invalid-feedback">
	          	우편번호찾기를 눌러주세요
	        </div>
          </div>
           <br>
          <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		  </div>
          <hr class="mb-4">
            <label>비밀번호 변경을 원하시면 <a href="#" data-bs-toggle="modal" data-bs-target="#pwdModal" >여기</a>를 눌러주세요</label>
            <label>개명 하신 고객님은 <a href="#" onClick="alert('Emotions 고객센터 : 010-2343-6755')">고객센터</a>로 문의주세요</label>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">수정 완료</button>
        </form>
      </div>
    </div>
  </div>

		<!-- 비번 모달용 -->
		<div class="modal fade" id="pwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		   			<div class="col-md-12">
			            <label for="pwd">비밀번호<span>*</span></label>
			            <input type="password" class="form-control" id="pwd" onkeyup="filterInput(this, /[\s]/g);" placeholder="영문,숫자,특수문자 총 8자 이상">
			            <div class="invalid-feedback" >
			              비밀번호를 재확인해주세요.<br>ex)영문, 숫자, 특수문자를 조합하여 총 8자 이상
		          		</div>
		          	</div>
		          	<br>
		        	<div class="col-md-12">
			            <label for="pwdCh">비밀번호 확인<span>*</span></label>
			            <input type="password" class="form-control" id="pwdCh" onkeyup="filterInput(this, /[\s]/g);" placeholder="영문,숫자,특수문자 총 8자 이상">
			            <div class="invalid-feedback" id="pwdDiv">
			              비밀번호 확인을 재확인해주세요. <br>ex)영문, 숫자, 특수문자를 조합하여 총 8자 이상
			            </div>
		           </div>
		      </div><br>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="changePassword()">비밀번호 변경</button>
		      </div>
		    </div>
		  </div>
		</div>
<%@include file="../include/bottom.jsp"%>
</body>

<script src="./js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="../js/jquery-3.7.1.js" ></script>
<script src="../js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

jQuery.ajaxSetup({cache:false});

//절대 경로 path 
function getContextPath() {
  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

//각 항목에 들어가면 안되는 문자 입력 안되도록 함 
function filterInput(inputField, pattern) {
    inputField.value = inputField.value.replace(pattern, '');
}

//비밀번호 확인 다를 경우 경고글 
$("#pwdCh").change(function() {
	if($("#pwd").val() !=  $("#pwdCh").val()){
		$('#pwdDiv').show();
		$('#pwdCh').val("")
		$('#pwdCh').focus();
	}else {
		$('#pwdDiv').hide();
	}
});

//비밀번호 확인 후 비밀번호 변경했을때 경고글 
$("#pwd").change(function() {
	if($("#pwd").val() !=  $("#pwdCh").val()){
		$('#pwdDiv').show();
		$('#pwdCh').val("");
		$('#pwdCh').focus();
	}else {
		$('#pwdDiv').hide();
	}
});


// 비밀번호 Pattern 체크해주기 
function changePassword() {
	  var dataStr={pwd : $('#pwd').val()};
	  //비밀번호 값 가져와서
	  const pwd = document.getElementById('pwd').value;
	  //Pattern을 변수에 넣고
	  const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
	  //비교
	  if (!passwordPattern.test(pwd) || "" == pwd) {
	    alert("비밀번호를 재확인해주세요.\n ex)영문, 숫자, 특수문자를 조합하여 총 8자 이상이 되어야합니다.");
	    $('#pwd').val("");
	    $('#pwdCh').val("");
	    $('#pwd').focus();
	  } else {
	    //정상 입력을 했다면 ajax로 값 보내기
		  var path = getContextPath();
			$.ajax({
				type: "post"
		      , url :  path+"/pwdChange.do"
		      , data : dataStr
			  , success : function(data) {
					if ("OK" == data) {
						alert("비밀번호 수정이 완료 되었습니다. \n새로운 정보로 재 로그인 해주세요.");
						var link = '/logout.do';
						location.replace(link);
					}
				}
			});
	  }
	}
	
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function address_Btn() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_num').value = data.zonecode;
                document.getElementById("address").value = addr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 500; //우편번호서비스가 들어갈 element의 width
        var height = 700; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }

//공백 유효성 체크
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
  </script>
</html>