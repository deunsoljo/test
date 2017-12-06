<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html><html>
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>webservice</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    
    <body>
        <div class="jumbotron" style="background-color:white">
            <div class="container">
    
                <!--다음지도 스크립트-->
                <div class="row">
                    <div class="col-md-11">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon" id="sizing-addon1">장소 입력란</span>
                            <input id="text" type="text" class="form-control" placeholder="장소" aria-describedby="sizing-addon1">
                        </div>
                    </div>
                    <div class="com-md-1">
                        <button id="button" type="button" class="btn btn-default dropdown-toggle">장소 입력</button>
                    </div>
                </div>
    
                <!--여기서 입력한 장소를 위도, 경도로 변경하여 지도의 값을 변경시키고 값을 받아온 날씨를 대입-->
                <hr>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <p id="weather">지역 날씨</p>
                    </div>
                </div>
    
                <hr>
                <div id="map" style="width:100%;height:550px;"></div>
    
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8041df3afdf7e8293bf2999a0ed265a&libraries=services"></script>
    
                <hr style="color:black">
    
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
    
    
    
                <script type="text/javascript" src="carwash.js"></script>
    
                <script>
                    //지역날씨를 받아오며 버튼을 누르면 실행(위 패널)
                    var myBtn = document.getElementById("button");
                    
                    var list;
    
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };
    
                    // 지도를 생성합니다
                    var map = new daum.maps.Map(mapContainer, mapOption);
    
                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new daum.maps.services.Geocoder();
                    myBtn.addEventListener("click", function (e) {
                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch(text.value, function (result, status) {
    
                            // 정상적으로 검색이 완료됐으면
                            if (status === daum.maps.services.Status.OK) {
    
                                var coords = new daum.maps.LatLng(result[0].y, result[0].x);
    
                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new daum.maps.Marker({
                                    map: map,
                                    position: coords
                                });
    
                                //json으로 정보를 얻어와 파싱함
                                var xhr_weather = new XMLHttpRequest();
                                xhr_weather.onreadystatechange = function () {
                                    if (xhr_weather.readyState == 4 && xhr_weather.status == 200) {//xhr이 작동할 때 정보를 받아온 json을 출력
    
                                        list = JSON.parse(xhr_weather.responseText);//텍스트문서를 파싱하여 json파일로 변경
                                        console.log(list);//쿼리중 현재 날씨를 뽑아온다.
                                        console.log(weather)
                                        var text = document.getElementById("text");
    
                                        document.getElementById("weather").innerHTML = text.value + "의 현재 날씨는 " + list['weather']['minutely'][0]['sky'].name;
                                    }
                                }
                                xhr_weather.open("GET", "http://apis.skplanetx.com/weather/current/minutely?lon=" + result[0].y + "&village=&county=&stnid=&lat=" + result[0].x + "&city=&version=1&appKey=ccc3af9a-d722-34c0-9acb-d9a6f5776610");
    
                                xhr_weather.send();
    
                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                            }
                        });
                    });
    
                    //json 파싱 스크립트(세차지수) 
    
                    var carwash_list;   //세차 지수 리스트를 저장할 var 변수
                    var xhr_carwash = new XMLHttpRequest();
                    xhr_carwash.onreadystatechange = function () {
                        if (xhr_carwash.readyState == 4 && xhr_carwash.status == 200) {//xhr이 작동할 때 정보를 받아온 json을 출력
    
                            carwash_list = JSON.parse(xhr_carwash.responseText);//텍스트문서를 파싱하여 json파일로 변경
                            console.log(carwash_list['weather']['wIndex']['carWash'][1]['locationName']);//쿼리중 지역 이름을 뽑아온다.
                        }
                    }
                    xhr_carwash.open("GET", "http://apis.skplanetx.com/weather/windex/carwash?version=1&appKey=ccc3af9a-d722-34c0-9acb-d9a6f5776610");
                    xhr_carwash.send();
    
                    //  세차 지수 API 스크립트
    
                    var locationSelect = document.getElementById("selectBox");
                    var locationBtn = document.getElementById("location_button");
                    var selectValue;
    
                    // 클릭 이벤트 등록 (익명 함수)
                    locationBtn.addEventListener("click", function (e) {
                        selectValue = locationSelect.options[locationSelect.selectedIndex].value;  //버튼을 눌렀을 때 셀렉트 박스의 밸류값 받아옴
                        //alert(selectValue);
                        //셀렉트 밸류 값에 따라서 세차를 해도 되는지 아닌지를 출력해줌
                        document.getElementById("hello1").innerHTML = carwash_list['weather']['wIndex']['carWash'][selectValue]['locationName']
                            + "에서는 " + carwash_list['weather']['wIndex']['carWash'][selectValue]['comment'];
                    });
                </script>
    
            </div>
        </div>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
    
    </html>