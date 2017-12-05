<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
        
        <head>
            <title>webservice</title>
        </head>
        
        <body>
            <!--
                카테고리로 장소 검색하기
                ->지도로 좌표 얻어내기
                ->지도 레벨 바꾸기
                -> 점을 두개를 찍어서 그 사이의 교통혼잡 모션을 넣는다.
                -->
        
            <!--다음지도 스크립트-->
            <div id="map" style="width:500px;height:400px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8041df3afdf7e8293bf2999a0ed265a"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new daum.maps.LatLng(33.450701, 126.570667),
                    level: 3
                };
        
                var map = new daum.maps.Map(container, options);
            </script>
        
        
            <!-- json 파싱 스크립트(날씨) -->
            <script>
        
                var list;
                var xhr_weather = new XMLHttpRequest();
                xhr_weather.onreadystatechange = function () {
                    if (xhr_weather.readyState == 4 && xhr_weather.status == 200) {//xhr이 작동할 때 정보를 받아온 json을 출력
        
                        list = JSON.parse(xhr_weather.responseText);//텍스트문서를 파싱하여 json파일로 변경
                        console.log(list['weather']['minutely'][0]['sky'].name);//쿼리중 현재 날씨를 뽑아온다.
                    }
                }
                xhr_weather.open("GET", "http://apis.skplanetx.com/weather/current/minutely?lon=&village=용전동&county=동구&stnid=&lat=&city=대전&version=1&appKey=ccc3af9a-d722-34c0-9acb-d9a6f5776610");
        
                xhr_weather.send();
            </script>
        
            <!-- json 파싱 스크립트(멜론차트) -->
            <script>
        
                var list1;
                var xhr_melon = new XMLHttpRequest();
                xhr_melon.onreadystatechange = function () {
                    if (xhr_melon.readyState == 4 && xhr_melon.status == 200) {//xhr_melon이 작동할 때 정보를 받아온 json을 출력
        
                        list1 = JSON.parse(xhr_melon.responseText);//텍스트문서를 파싱하여 json파일로 변경
                        console.log(list1);
                    }
                }
                xhr_melon.open("GET", "http://apis.skplanetx.com/melon/charts/realtime?count=10&page=5&version=1&appKey=ccc3af9a-d722-34c0-9acb-d9a6f5776610");
        
                xhr_melon.send();
            </script>
        
        
        </body>
        
 </html>