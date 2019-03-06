<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/imgs/hospital.png">
<title>우리친구 병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script>
   // 로그아웃시 한번 더 물어보는 스크립트
   $(document).ready(function() {
      $('#logout').unbind("click").click(function(e) {
         e.preventDefault();
         fn_logout();
      });

      function fn_logout() {
         if (window.confirm("로그아웃 하시겠습니까?")) {
            window.location.href = "/project_A/logout.html";
         };
      };
   });
</script>
<style>
   .fakeimg {
      height: 200px;
      background: #aaa;
   }
   
   table, th, tr, td {
      text-align: center;
   }
   
   #tp {
      width: 400px;
      margin-left: 34%;
   }
   
   #bg {
      background-image:url("${pageContext.request.contextPath}/imgs/topbg.png");
      background-repeat:no-repeat;
      background-size:100% 100%;
      height:300px;
   }
   
   ul, nav ul, li {
      margin: 0;
      padding: 0;
      list-style: none
   }
   
   a:hover, a:focus, a:active {
      color: #000;
      text-decoration: none
   }
   
   #hospital {
      margin: 40px;
      border: 1px solid #ddd;
      background: #fff;
      overflow: hidden;
   }
   
   #hospital li {
      float: left;
      width: 25%;
      border-left: 1px solid #ddd;
      box-sizing: border-box;
      line-height: 55px;
      text-align: center;
   }
   
   #hospital li:first-child {
      border: 0;
   }
   
   #hospital li a {
      color: #777;
      font-size: 18px;
      font-weight: 300px;
      display: block;
   }
   
   #hospital li.on {
      background: #ed862c;
   }
   
   #hospital li.on a {
      color: #fff;
   }
   
   #scont {
      margin-top: 40px;
      padding: 60px 60px 150px;
      color: #434343;
      font-size: 15px;
      border: 10px solid #ecece8;
      background: #fff;
   }
   
   .s1 {
      width: 90%;
      margin-left: 58px;
   }
</style>
</head>
<body>
   <!-- Navbar (sit on top) -->
   <div class="w3-top">
      <div class="w3-bar w3-white w3-card" id="myNavbar">
         <a href="/project_A/" class="w3-bar-item w3-button w3-wide"> <i
            class="fa fa-home">HOME</i></a>
         <!-- Right-sided navbar links -->
         <div class="w3-right w3-hide-small">
            <a href="/project_A/#about" class="w3-bar-item w3-button">병원 소개</a> 
            <a href="/project_A/#ledger" class="w3-bar-item w3-button">병원장 소개</a> 
            <a href="/project_A/#reservation" class="w3-bar-item w3-button">진료 예약</a> 
            <a href="/project_A/#shop" class="w3-bar-item w3-button">반려동물 용품</a>
            <c:if test="${logins == null}">
               <c:url value="/login.html" var="login" />
               <a class="w3-bar-item w3-button" href="${login}">로그인</a>
            </c:if>
            <c:choose>
               <c:when test="${logins[0].S_ID == 'hys'}">
                  <c:url value="/animal/receiptlist.html" var="reclist" />
                  <a class="w3-bar-item w3-button" href="${reclist}">예약 차트</a>
                  <c:url value="/animal/shop.html" var="shop" />
                  <a class="w3-bar-item w3-button" href="${shop}">상품 등록</a>
                  <div class="w3-bar-item">
                     <b>${logins[0].S_NAME}</b> 관리자님
                  </div>
               </c:when>
               <c:when test="${logins == null}"></c:when>
               <c:when test="${logins[0].S_ID != 'hys'}">
                  <div class="w3-bar-item"><b>${logins[0].S_NAME}</b> 회원님</div>
               </c:when>
            </c:choose>
            <c:if test="${logins != null}">
               <c:url value="/logout.html" var="logout" />
               <a class="w3-bar-item w3-button" id="logout" href="${logout}">로그아웃</a>
            </c:if>
            <c:if test="${logins == null}">
               <c:url value="/join.html" var="join" />
               <a class="w3-bar-item w3-button" href="${join}">회원가입</a>
            </c:if>
         </div>
      </div>
   </div>
   <div class="jumbotron text-center" style="margin-bottom: 0" id="bg"></div>
   

   <!-- 병원소개 Section -->
   <div class="w3-container" style="padding: 128px 16px" id="about">
      <h1 class="w3-center">병원 소개</h1>
      <p class="w3-center w3-large">
         <font color="#8eb22d">참된 생명존중을 바탕으로하는 <b>우리친구병원</b></font>을 <br/> 방문해주셔서
         감사드립니다.
      </p>
      <ul id="hospital">
         <li class="on"><a href="/project_A/">인사말</a></li>

         <c:url value="/machine.html" var="machine" />
         <li><a href="${machine}">장비안내</a></li>

         <c:url value="/facilities.html" var="facilities" />
         <li><a href="${facilities}">시설안내</a></li>

         <c:url value="/map.html" var="map" />
         <li><a href="${map}">오시는길</a></li>
      </ul>

      <div id="scont" class="s1">
         <div>
            <h3>
               <font color="#8eb22d">참된 생명존중을 바탕으로하는 <b>페트로동물병원</b></font>을<br>방문해주셔서
               감사드립니다.
            </h3>
            <p>
               안녕하세요. 반려동물의 건강과 행복을 위해 노력하는 우리친구 병원입니다.<br>저희 동물병원은 다년간의 풍부한
               임상경력과 최상의 검사시설을 보유하고 있어<br> 고객님들께 가성비 높은 만족도를 제공하여 드리고 있습니다.<br>
               <br>또한 <span class="c-orange">내과, 피부과, 외과, 안과, 치과 등</span> 정확한
               진단과 수술을 위해 전문화된 수의사들이<br> 근무하고있으며, 참된 생명존중을 바탕으로 최상의 진료·연구·교육을
               실현하여<br>반려동물의 건강과 행복을 위해 노력하고 있습니다.<br> <br> 앞으로도
               여러분들의 소중하고 사랑스러운 반려동물의 건강과 행복한 삶을 위해<br> <span
                  class="bg-green">언제나 청결한 병원, 정확한 진단과 치료가 이루어지는 병원</span>이 될 수 있도록<br>최선을
               다하겠습니다.<br> <br> 감사합니다.<br> <br> <br> <br>
               <b>우리친구 병원 직원일동</b>
            </p>
         </div>
      </div>
   </div>

   <!-- 병원장 Section -->
   <div class="w3-container w3-center" style="padding: 128px 16px; text-align: center; border-top:2px solid black;" id="ledger">
      <h2>우리친구 병원장 소개합니다.</h2>
           <p>우리의 친구를 책임질 원장님을 소개합니다.</p>
        <div class="card" style="width:400px; margin-left:10%; align:center;">
          <img class="card-img-top" src="${pageContext.request.contextPath}/imgs/MASTER.jpg" alt="Card image" style="width:100%">
             <div class="card-body">
                  <h4 class="card-title" style="color:black">서 형 철</h4>
                     <p class="card-text" style="color:black;">서울대학교 수석 졸업, 긍정적인 마인드, 엄청난 실력, 참된 실력, 어마무시한 실력으로 완전
                                   무장한 서형철 원장 믿고 한 번! 딱!<br> 한번만 맡겨주세요! 후회하지 않을겁니다.</p>
             </div>
        </div>
        <div class="w3-container w3-center" style="width:50%; margin-left:40%; margin-top:-58%;">
        <h3>[상, 표 창 장]</h3>
           <table style="margin-left:5%;">
              <tr>
                 <td>
                  <div>
                     <div>
                        <a href="/project_A/sang/sang1.jsp"><img
                           src="${pageContext.request.contextPath}/imgs/sang.png" alt="John"
                           style="width: 100%"></a>
                        <div class="w3-container">
                           <h3>휴먼 교육센터 표창장</h3>
                           <p class="w3-opacity">동물 사랑 & 관심</p>
                        </div>
                     </div>
                  </div>
               </td>
               <td>
                  <div>
                     <div>
                        <a href="/project_A/sang/sang2.jsp"><img
                           src="${pageContext.request.contextPath}/imgs/sang2.png" alt="Jane"
                           style="width: 100%"></a>
                        <div class="w3-container">
                           <h3>표 창 장</h3>
                           <p class="w3-opacity">모범</p>
                        </div>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
                  <div>
                     <div>
                        <a href="/project_A/sang/sang3.jsp"><img
                           src="${pageContext.request.contextPath}/imgs/sang3.png" alt="Mike"
                           style="width: 100%"></a>
                        <div class="w3-container">
                           <h3>상 장</h3>
                           <p class="w3-opacity">생명 존중</p>
                        </div>
                     </div>
                  </div>
               </td>
               <td>
                  <div>
                     <div>
                        <a href="/project_A/sang/sang4.jsp"><img
                           src="${pageContext.request.contextPath}/imgs/sang4.png" alt="Dan"
                           style="width: 100%"></a>
                        <div class="w3-container">
                           <h3>청결상</h3>
                           <p class="w3-opacity">청 결</p>
                        </div>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      </div>
   </div>
      
   <!-- 진료 예약 Section -->
   <div class="w3-container" style="padding-top:10%; border-top:2px solid black; margin-top:-5%;" id="reservation">
      <h3 class="w3-center"> * 진료예약 * </h3>
      <p class="w3-center w3-large">[진료예약 미리보기입니다.]</p>
      <p class="w3-center" style="margin-top:-3%;"><br>*진료를 원하시면 작성지를 눌러주세요.*</p>
      <c:url value="/animal/receipt.html" var="receipt" />
   </div>   
   
      <div class="w3-row-padding" style="margin-top:10px; margin-left:30%; border-top: 2px dotted gray; margin-right:30%;">
         <a href="${receipt}">
            <form style="width:100%;">
               <table class="table table-hover">
                  <tr>
                     <th>이 름 : </th>
                     <td><input type="button" name="p_name" class="form-control btn-block"></td>
                  </tr>
                  <tr>
                     <th>나 이 : </th>
                     <td><input type="button" name="p_age" class="form-control btn-block"></td>
                  </tr>
                  <tr>
                     <th>종 류 : </th>
                     <td><input type="button" name="p_kinds" class="form-control btn-block"></td>
                  </tr>
                  <tr>
                     <th>.</th>
                     <td>.</td>
                  </tr>
                  <tr>
                     <th>.</th>
                     <td>.</td>
                  </tr>
                  <tr>
                     <th>.</th>
                     <td>.</td>
                  </tr>
               </table>
            </form>
         </a>
         <h7>*접수비는 1만원으로 하고있습니다. 진료후 결제 시 적용되고, 접수비는 환불,반환이 불가능합니다.*</h7>
      </div>

   <!-- 반려동물 용품 Section -->
   <div class="w3-container w3-center w3-dark-grey"
      style="padding: 128px 16px; margin-top:10%;" id="shop">
      <h3>반려동물 용품점</h3>
      <p class="w3-large">우리와 함께하는 친구,가족에게 멋진 선물하세요.</p>
      <div class="w3-row-padding" style="margin-top: 64px">
         <div class="w3-third w3-section">
            <ul class="w3-ul w3-white w3-hover-shadow">
               <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
               <li class="w3-padding-16"><b>10GB</b> Storage</li>
               <li class="w3-padding-16"><b>10</b> Emails</li>
               <li class="w3-padding-16"><b>10</b> Domains</li>
               <li class="w3-padding-16"><b>Endless</b> Support</li>
               <li class="w3-padding-16">
                  <h2 class="w3-wide">$ 10</h2> <span class="w3-opacity">per
                     month</span>
               </li>
               <li class="w3-light-grey w3-padding-24">
                  <button class="w3-button w3-black w3-padding-large">Sign
                     Up</button>
               </li>
            </ul>
         </div>
         <div class="w3-third">
            <ul class="w3-ul w3-white w3-hover-shadow">
               <li class="w3-red w3-xlarge w3-padding-48">Pro</li>
               <li class="w3-padding-16"><b>25GB</b> Storage</li>
               <li class="w3-padding-16"><b>25</b> Emails</li>
               <li class="w3-padding-16"><b>25</b> Domains</li>
               <li class="w3-padding-16"><b>Endless</b> Support</li>
               <li class="w3-padding-16">
                  <h2 class="w3-wide">$ 25</h2> <span class="w3-opacity">per
                     month</span>
               </li>
               <li class="w3-light-grey w3-padding-24">
                  <button class="w3-button w3-black w3-padding-large">Sign
                     Up</button>
               </li>
            </ul>
         </div>
         <div class="w3-third w3-section">
            <ul class="w3-ul w3-white w3-hover-shadow">
               <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
               <li class="w3-padding-16"><b>50GB</b> Storage</li>
               <li class="w3-padding-16"><b>50</b> Emails</li>
               <li class="w3-padding-16"><b>50</b> Domains</li>
               <li class="w3-padding-16"><b>Endless</b> Support</li>
               <li class="w3-padding-16">
                  <h2 class="w3-wide">$ 50</h2> <span class="w3-opacity">per
                     month</span>
               </li>
               <li class="w3-light-grey w3-padding-24">
                  <button class="w3-button w3-black w3-padding-large">Sign
                     Up</button>
               </li>
            </ul>
         </div>
      </div>
   </div>
   <!-- Footer -->
   <footer class="w3-center w3-black w3-padding-64">
      <a href="/project_A/" class="w3-button w3-light-grey"><i
         class="fa fa-arrow-up w3-margin-right"></i>To the top</a><p/>
      <p>
         SINCE 2002.07.21 <br> Contact Phone : 041-555-7777
      </p>
   </footer>

</body>
</html>