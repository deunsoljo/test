
var locationSelect = document.getElementById("selectBox");
var locationBtn = document.getElementById("location_button");
var selectValue;
alert("1");
// 클릭 이벤트 등록 (익명 함수)
locationBtn.addEventListener("click", function (e) {
    selectValue = locationSelect.options[locationSelect.selectedIndex].value;  //버튼을 눌렀을 때 셀렉트 박스의 밸류값 받아옴
    //alert(selectValue);
    //셀렉트 밸류 값에 따라서 세차를 해도 되는지 아닌지를 출력해줌
    document.getElementById("hello1").innerHTML = carwash_list['weather']['wIndex']['carWash'][selectValue]['locationName']
        + "에서는 " + carwash_list['weather']['wIndex']['carWash'][selectValue]['comment'];
});