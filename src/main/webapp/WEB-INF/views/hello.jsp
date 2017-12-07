<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>webservice</title>
    <%--<link href="assets/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
                <button id="button" type="button" class="btn btn-default dropdown-toggle"
                        style="padding-bottom: 12px; padding-top:12px">장소 입력
                </button>
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

        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8041df3afdf7e8293bf2999a0ed265a&libraries=services"></script>

        <hr style="color:black">

        <select name="selectBox" id="selectBox" style="display:none">
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


        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc1">서울,경기,인천</h3>
                        <hr style="height:1px">
                        <p id="location1"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc2">강원, 영서</h3>
                        <hr style="height:1px">
                        <p id="location2"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc3">강원, 영동</h3>
                        <hr style="height:1px">
                        <p id="location3"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc4">충남</h3>
                        <hr style="height:1px">
                        <p id="location4"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3>충북</h3>
                        <hr style="height:1px">
                        <p id="location5"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc6">전남</h3>
                        <hr style="height:1px">
                        <p id="location6"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">
                    <div class="caption">
                        <h3 id="loc7">전북</h3>
                        <hr style="height:1px">
                        <p id="location7"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc8">경남</h3>
                        <hr style="height:1px">
                        <p id="location8"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc9">경북</h3>
                        <hr style="height:1px">
                        <p id="location9"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc10">제주</h3>
                        <hr style="height:1px">
                        <p id="location10"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc11">서해 5도</h3>
                        <hr style="height:1px">
                        <p id="location11"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail" style="height: 200px">

                    <div class="caption">
                        <h3 id="loc12">울릉도, 독도</h3>
                        <hr style="height:1px">
                        <p id="location12"></p>
                    </div>
                </div>
            </div>
        </div>

        <%--<script type="text/javascript" src="carwash.js"></script>--%>
        <script type="text/javascript" src="/resources/js/carwash.js"></script>
    </div>
</div>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
</body>
</html>