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
                    console.log(list['weather']['minutely'][0]['sky'].name);//쿼리중 현재 날씨를 뽑아온다.
                    //console.log(weather)
                    var text = document.getElementById("text");

                    document.getElementById("weather").innerHTML = text.value + "의 현재 날씨는 " + list['weather']['minutely'][0]['sky'].name;
                }
            }
            console.log(result[0].y + result[0].x);
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
        console.log(carwash_list['weather']['wIndex']['carWash'][0]['locationName']);//쿼리중 지역 이름을 뽑아

        selectValue = locationSelect.options[locationSelect.selectedIndex].value;  //버튼을 눌렀을 때 셀렉트 박스의 밸류값 받아옴
        //alert(selectValue);

        document.getElementById('location1').innerHTML = carwash_list['weather']['wIndex']['carWash'][0]['comment'];
        document.getElementById('location2').innerHTML = carwash_list['weather']['wIndex']['carWash'][1]['comment'];
        document.getElementById('location3').innerHTML = carwash_list['weather']['wIndex']['carWash'][2]['comment'];
        document.getElementById('location4').innerHTML = carwash_list['weather']['wIndex']['carWash'][3]['comment'];
        document.getElementById('location5').innerHTML = carwash_list['weather']['wIndex']['carWash'][4]['comment'];
        document.getElementById('location6').innerHTML = carwash_list['weather']['wIndex']['carWash'][5]['comment'];
        document.getElementById('location7').innerHTML = carwash_list['weather']['wIndex']['carWash'][6]['comment'];
        document.getElementById('location8').innerHTML = carwash_list['weather']['wIndex']['carWash'][7]['comment'];
        document.getElementById('location9').innerHTML = carwash_list['weather']['wIndex']['carWash'][8]['comment'];
        document.getElementById('location10').innerHTML = carwash_list['weather']['wIndex']['carWash'][9]['comment'];
        document.getElementById('location11').innerHTML = carwash_list['weather']['wIndex']['carWash'][10]['comment'];
        document.getElementById('location12').innerHTML = carwash_list['weather']['wIndex']['carWash'][11]['comment'];


    }
}
xhr_carwash.open("GET", "http://apis.skplanetx.com/weather/windex/carwash?version=1&appKey=ccc3af9a-d722-34c0-9acb-d9a6f5776610");
xhr_carwash.send();

//  세차 지수 API 스크립트

var locationSelect = document.getElementById("selectBox");
var locationBtn = document.getElementById("location_button");
var selectValue;

// 클릭 이벤트 등록 (익명 함수)
/*    locationBtn.addEventListener("click", function (e) {
        selectValue = locationSelect.options[locationSelect.selectedIndex].value;  //버튼을 눌렀을 때 셀렉트 박스의 밸류값 받아옴
        //alert(selectValue);
        //셀렉트 밸류 값에 따라서 세차를 해도 되는지 아닌지를 출력해줌
        document.getElementById("hello1").innerHTML = carwash_list['weather']['wIndex']['carWash'][selectValue]['locationName']
            + "에서는 " + carwash_list['weather']['wIndex']['carWash'][selectValue]['comment'];
    });*/