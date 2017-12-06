<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>웹서비스 텀프</title>
</head>
<body>
<!--
    카테고리로 장소 검색하기
    ->지도로 좌표 얻어내기
    ->지도 레벨 바꾸기
    -> 점을 두개를 찍어서 그 사이의 교통혼잡 모션을 넣는다.
-->
<%--
    셀렉트 박스로 지역을 선택하기
    선택된 지역의 밸류 값을 버튼으로 넘겨주기
    밸류값을 바탕으로 세차를 해도 되는지 안되는지 출력해주기
--%>

<!--세차 지수 API HTML-->
<h3>1. 세차를 해도 될까요?</h3>

<select name="selectBox" id="selectBox">
    <option value="0">서울.경기.인천</option>
    <option value="1">강원영서</option>
    <option value="2">강원영동</option>
    <option value="3">충남</option>
    <option value="4">충북</option>
    <option value="5">전남</option>
    <option value="6">전북</option>
    <option value="7">경남</option>
    <option value="8">경북</option>
    <option value="9">제주</option>
    <option value="10">서해5도</option>
    <option value="11">울릉도.독도</option>
</select>
<button id="location_button" type="button" value="button">지역 선택</button>
<p id="hello1"></p>
<%--세차 api javascript 호출--%>
<script type="text/javascript" src="/resources/js/carwash.js"></script>

<!--다음지도 스크립트-->
<div id="local_box">

    <input id="text" type="text" value="text">

    <button id="button" type="button" value="button">장소 입력</button>
    <!--여기서 입력한 장소를 위도, 경도로 변경하여 지도의 값을 변경시키고 값을 받아온 날씨를 대입-->
    <p id="hello"></p>
</div>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8041df3afdf7e8293bf2999a0ed265a&libraries=services"></script>
<script type="text/javascript" src="/resources/js/map.js"></script>

<!-- json 파싱 스크립트(날씨) -->
<script type="text/javascript" src="/resources/js/weather.js"></script>

</body>
</html>
