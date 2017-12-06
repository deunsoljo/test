<!-- json 파싱 스크립트(세차지수) -->

var carwash_list;   //세차 지수 리스트를 저장할 var 변수
var xhr_carwash = new XMLHttpRequest();
xhr_carwash.onreadystatechange = function () {
    if (xhr_carwash.readyState == 4 && xhr_carwash.status == 200) {//xhr이 작동할 때 정보를 받아온 json을 출력

        carwash_list = JSON.parse(xhr_carwash.responseText);//텍스트문서를 파싱하여 json파일로 변경
        console.log(carwash_list['weather']['wIndex']['carWash'][1]['locationName']);//쿼리중 지역 이름을 뽑아온다.
    }
}
xhr_carwash.open("GET", "http://apis.skplanetx.com/weather/windex/carwash?version=1&appKey=5b1231cd-da01-3551-b1f5-02992547a5a8");
xhr_carwash.send();


<!--세차 지수 API 스크립트-->
var locationSelect = document.getElementById("selectBox");
var locationBtn = document.getElementById("location_button");
var selectValue;
//alert("1");
// 클릭 이벤트 등록 (익명 함수)
locationBtn.addEventListener("click", function (e) {
    selectValue = locationSelect.options[locationSelect.selectedIndex].value;  //버튼을 눌렀을 때 셀렉트 박스의 밸류값 받아옴
    //alert(selectValue);
    //셀렉트 밸류 값에 따라서 세차를 해도 되는지 아닌지를 출력해줌
    document.getElementById("hello1").innerHTML = carwash_list['weather']['wIndex']['carWash'][selectValue]['locationName']
        + "에서는 " + carwash_list['weather']['wIndex']['carWash'][selectValue]['comment'];

});