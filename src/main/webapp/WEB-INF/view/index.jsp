<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <head>
    <title>Emotions Project</title>
<link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<%@include file="./include/top.jsp"%>
<main class="container">
  <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary">
    <div class="col-lg-6 px-0">
      <h1 class="display-4 fst-italic">오늘 당신의 <br>하루는 어땠나요?</h1>
      <p class="lead my-3"> Today comes only once, and never again returns. </p>
    </div>
  </div>

  <div class="row g-5">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 fst-italic border-bottom">
        What are Emotions
      </h3>
      <article class="blog-post">
        <h2 class="display-5 link-body-emphasis mb-1">Emotions</h2>
        <p class="blog-post-meta">November 20, 2023</p>

        <p>오늘 당신의 하루는 어땠나요 라는 말로 시작된 사이트</p>
        <hr>
        <blockquote class="blockquote">
          <p>today is precious</p>
        </blockquote>
        <p>Emotions 에서 중요하게 생각하는 세가지</p>
        <ul>
          <li>당신의 오늘</li>
          <li>당신의 감정</li>
          <li>당신의 내일 </li>
        </ul>
        <h2>Emotions is You</h2>
        <p>Emotions are what you make them.</p>
        <ul>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/UwvhO2uMKOs?si=NVB1IdBn7FHt_L4q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </ul>
        <br>
        <h3><p>What are Emotions?</p></h3>
        <dl>
          <dt>나의 하루를 기록하며 경험을 공유하는 곳</dt><br>
          <dd>당신의 하루에 많은 사람들이 관심을 가진다는 것 알고 계신가요? <br>Emotions는 당신의 하루 하루를 조금 더 오래 기억 할 수 있도록 도와드립니다.</dd><br>
          <dt>나의 오늘의 감정은 어땠지?</dt><br>
          <dd>당신의 하루 뭘했는지가 중요하지만 당신의 감정 또한 너무 소중합니다. <br>오늘 내가 느꼈던 감정, 마음, 기분 이런 것 하나 하나가 모여 당신의 하루를 만드니까요 </dd><br>
          <dt>당신의 내일은 보다 나은 날이 될 수 있기를</dt><br>
          <dd>일기를 쓰다보면 내일은 더 좋은 날이 되었으면 좋겠다를 참 많이 쓴 것 같습니다. <br>당신의 감정을 보다 깊이 생각하고 어루만져주면 보다 나은 내일을 만날 수 있을것이라 확신합니다. </dd>
        </dl>
      </article>
    </div>
    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-body-tertiary rounded">
          <h4 class="fst-italic">CEO. Yoon Young Kim</h4>
          <p class="mb-0"> 
          	march 10, 2016 처음 순례길을 걷겠다 마음을 먹었을 때 저는 공책에 한 문장을 썼습니다. 오늘 너의 감정은 어땠어?
          	이 문장을 쓰고 매일 같이 순례길을 걷고 많은 사람들을 만나면서 저를 포함한 모든 이들에게 물어봤습니다.
          	사람들은 저 마다 여러가지 대답을 했지만 다들 자세한 대담을 하지 못했습니다.
          	대부분의 사람들이 자신의 하루를 기록할 때 뭘 했는지를 작성한다고 합니다.
          	하지만 Emotions에서는 자신의 감정을 돌아볼 수 있는 시간을 드릴 수 있게 노력하겠습니다.
          </p>
        </div>
        <div>
          <h4 class="fst-italic">New Record</h4>
          <ul class="list-unstyled">
          <c:forEach items="${newRecord}" var="newRe" varStatus="status">
	            <li>
	              <a href="#" class="newRecord d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top">
	                <input type="hidden" value="${newRe.board_no}" class="board_no">
	                <img alt="emotion" src="./img/${newRe.cls2_img_nm}" width="115px"height="100px">
	                <div class="col-lg-8">
						<h6 class="mb-0">가장 최근글</h6>
						<fmt:formatDate value="${newRe.board_input_dt}" var="dt" pattern="yyyy-MM-dd" />
						<small class="text-body-secondary">${dt}</small>
	                </div>
	              </a>
	            </li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </div>
</main>
<%@include file="./include/bottom.jsp"%>
<script src="./js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="../js/jquery-3.7.1.js" ></script>
<script src="../js/jquery-ui.js"></script>
<script type="text/javascript">

jQuery.ajaxSetup({cache:false});

//절대 경로 path 
function getContextPath() {
var hostIndex = location.href.indexOf( location.host ) + location.host.length;
return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}


// 로그인이 안되어있는 경우 버튼 클릭 시 로그인 화면으로 이동
var loggedIn = true;
//링크 엘리먼트를 가져옵니다.
var newRecords = document.querySelectorAll(".newRecord");

if(${empty loginInfo}){
	loggedIn = false;
}

//각 링크에 이벤트 리스너를 추가합니다.
newRecords.forEach(function(newRecord) {
    newRecord.addEventListener("click", function() {
        // 현재 클릭한 요소의 board_no 값을 가져옵니다.
        var board_no = this.querySelector(".board_no").value;

        // 로그인 상태에 따라 href 속성을 설정합니다.
        this.href = loggedIn ? "/detailBoard.do?board_no=" + board_no : "/login.do";
    });
});
</script>
</body>
</html>
