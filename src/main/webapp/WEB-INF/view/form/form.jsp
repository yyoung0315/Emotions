<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emotions Project</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="../css/bootstrap.min1.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    #Btn{
    	 float: right;
    	 margin-right: 3%;
    
    }
    span{
    	color: red;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">Sign up</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름<span>*</span></label><br>
              <input type="text" class="form-control" pattern="[a-zA-Z0-9가-힣]+" onkeyup="filterInput(this, /[^a-zA-Z가-힣]/g);" id="name" required>
              <div class="invalid-feedback">
                이름을 재확인해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="user_id">이메일<span>*</span></label><button type="button" id="Btn" class="btn btn-primary btn-sm" onclick="idCheck()">중복체크</button>
              <input type="hidden" id="idCk" >
              <input type="email" class="form-control" pattern="[a-zA-Z0-9@.]+" onkeyup="filterInput(this, /[^a-zA-Z0-9@.]/g);" id="user_id" placeholder="name@example.com" required>
              <div class="invalid-feedback" id="idDiv">
                이메일을 재확인해주세요 ex)name@example.com
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="bday">생년월일<span>*</span></label>
            <input type="date" class="form-control" id="bday" pattern="\d{4}-\d{2}-\d{2}" onkeyup="filterInput(this, /[^0-9-]/g);" min="1900-01-01" placeholder="9999-99-99" required>
            <div class="invalid-feedback">
              생년월일을 재확인해주세요. ex)9999-99-99
            </div>
          </div>
          
          <div class="mb-3">
            <label for="tel">휴대폰 번호<span>*</span></label>
            <input type="tel" class="form-control" id="tel"pattern="\d{3}-\d{3,4}-\d{4}"  onkeyup="filterInput(this, /[^0-9-]/g);" placeholder="010-0000-0000" required>
            <div class="invalid-feedback">
              휴대폰 번호를 재확인해주세요. ex)010-0000-0000
            </div>
          </div>
          
        <div class="row">
   			<div class="col-md-6 mb-3">
	            <label for="pwd">비밀번호<span>*</span></label>
	            <input type="password" class="form-control" id="pwd" pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$"   onkeyup="filterInput(this, /[\s]/g);" placeholder="영문,숫자,특수문자 총 8자 이상" required>
	            <div class="invalid-feedback" >
	              비밀번호를 재확인해주세요.<br>ex)영문, 숫자, 특수문자를 조합하여 총 8자 이상
          		</div>
          	</div>
        	<div class="col-md-6 mb-3">
	            <label for="pwdCh">비밀번호 확인<span>*</span></label>
	            <input type="password" class="form-control" id="pwdCh" pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$"  onkeyup="filterInput(this, /[\s]/g);" placeholder="영문,숫자,특수문자 총 8자 이상" required>
	            <div class="invalid-feedback" id="pwdDiv">
	              비밀번호 확인을 재확인해주세요. <br>ex)영문, 숫자, 특수문자를 조합하여 총 8자 이상
	            </div>
           </div>
	    </div>
          <br>
          <input type="button" onclick="address_Btn()" value="우편번호 찾기" class="btn btn-primary btn-lg btn-block" ><br><br>
          <div class="mb-3">
          	<label for="tel">우편번호<span>*</span></label>
			<input type="text" class="form-control" id="address_num" placeholder="우편번호찾기를 눌러주세요" onclick="address_Btn()" required>
			<div class="invalid-feedback">
	          	우편번호를 입력해주세요
	        </div><br>
			<label for="tel">주소<span>*</span></label>
			<input type="text" class="form-control" id="address" placeholder="우편번호찾기를 눌러주세요" onclick="address_Btn()" required>
			<div class="invalid-feedback">
	          	주소를 입력해주세요
	        </div>
          </div>
          <br>
           <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		  </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <br>
          <div class="row">
	          <div class="col-md-6 mb-3">
	          	<a href="index.do" class="btn btn-secondary btn-lg btn-block" >메인으로 돌아가기</a>
	          </div>
	          <div class="col-md-6 mb-3">
	          	<button class="btn btn-primary btn-lg btn-block" id="submit">가입 완료</button>
	          </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
<script src="../js/jquery-3.7.1.js" ></script>
<script src="../js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
jQuery.ajaxSetup({cache:false});

//절대 경로 path 
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

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
		$('#pwdCh').val("")
		$('#pwdCh').focus();
	}else {
		$('#pwdDiv').hide();
	}
});

//오늘날짜 구하기
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
	var today = year + "-" + month + "-" + day;
    return today;
}
document.getElementById("bday").setAttribute("max", getToday());


//아이디 중복 체크 AJAX 처리 
function idCheck(){
	var path = getContextPath();
       var dataStr={user_id : $('#user_id').val()};
       if($('#user_id').val() == ""){
          	alert("이메일이 입력 되지 않았습니다.");
      		$('#user_id').focus();
      		$('#idDiv').show();
             return false;
             }
         $.ajax({
             type: "post"
             , url :  path+"/idCheck.do"
             , data : dataStr
             , success: function (data){
           	  if("OK" == data) {
           		  alert("사용가능한 아이디 입니다."); 
           		  $('#idCk').val("Y");
           		  $('#idDiv').hide();
           	  }else{
           		  alert("사용할 수 없는 아이디 입니다. 다시 확인 하여 주십시오.");
           			$('#idCk').val("N");
                  	  $('#user_id').val("");
                     $('#user_id').focus();
              	}
          	}
      });     
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
//회원가입 데이터 변수메소드
function insertVal() {
	var insertData={};
	insertData.name = $("#name").val(); 
	insertData.user_id = $("#user_id").val();
	insertData.pwd = $("#pwd").val();
	insertData.bday =$("#bday").val();
	insertData.tel = $("#tel").val();
	insertData.address_num = $("#address_num").val();
	insertData.address = $("#address").val();
	
	return insertData;
}
    
//공백 유효성 + 값 형식 체크
//form 으로 밑에서 값을 다 가져와서 쓰는데 이걸 바로 컨트롤러로 넘기면 간단할것 같아서 찾아보고있는데 방법이 딱히 나오지 않음....
    window.addEventListener('load', () => {
    	//변수 form안에 form 값을 다 넘김
      const forms = document.getElementsByClassName('validation-form');
      
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
        	//checkValidity 이게 형식 / 공백 체크하는거임 
          if (form.checkValidity() === false) {
        	  	//기본 동작을 취소하는 JavaScript 메서드 주로 폼을 제출하거나 링크를 클릭할 때 페이지를 다시 로드하는 등의 기본 동작을 방지
            	event.preventDefault();
        	  	//폼 제출(submit) 이벤트가 상위 엘리먼트로 전파되지 않고 현재 엘리먼트에서만 처리 결론: 부모의 엘리멘트로 전파차단을 막아 폼제출 방지 
            	event.stopPropagation();
            	form.classList.add('was-validated'); 
          } else {
        	  if("Y" == $("#idCk").val()){
        		  insertOk();
        	  }else{
        		  alert("아이디 중복체크를 하지 않았습니다.");
        		  $('#user_id').focus();
        		  event.preventDefault();
        	  }
        	  
          }
        }, false);
      });
    }, false);
    
function insertOk() {
	var insertData = insertVal();

	 $.ajax({
	 type: "POST",
	 url: "formOk.do",
	 contentType : "application/json",
	 data: JSON.stringify(insertData),
		 success: function (data){
		    if ("ok" == data) {
		    	 alert("회원가입이 완료되었습니다. \n 로그인 화면으로 이동합니다.");
		        var link = '/login.do';
		        location.replace(link);
		    }
		 }
     });
	 event.preventDefault(); // 폼 제출 방지
}

  </script>
</html>