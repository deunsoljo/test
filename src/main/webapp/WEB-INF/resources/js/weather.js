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