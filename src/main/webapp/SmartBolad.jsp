<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="com.Model.BoladDAO"%>
<%@page import="com.Model.BoladDTO"%>
<%@page import="java.util.ArrayList"%>
<html>

<head>
    <title>Dimension by HTML5 UP</title>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css" />
    </noscript>
</head>
<style>
    #event {
        background-color: red;
    }

    .button {
        background-color: black;
    }
</style>

<body class="is-preload">
	<%

		ArrayList<BoladDTO> list = new ArrayList<BoladDTO>();
		BoladDAO dao = new BoladDAO();
	
	%>

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Header -->
        <header id="header">
            <div class="logo">
                <span class="icon fa-gem"></span>
            </div>
            <div class="content">
                <div class="inner">
                    <h1>스마트 볼라드</h1>
                    <p>IoT와 웹을 활용한 스마트 교차로 관리 시스템</p>
                </div>
            </div>
            <nav>
                <ul>
                    <li><a href="#intro" class="button">제품설명</a></li>
                    <li><a href="#admin" class="button">관리자등록</a></li>
                    <li><a href="#bolad" class="button">볼라드관리</a></li>
                    <li><a href="#stopline" class="button">정지선위반관리</a></li>
                    <li><a href="#event" class="button">축제일정관리</a></li>
                    <li><a href="#emc" id="event">통제관리</a></li>
                    <!--<li><a href="#elements">Elements</a></li>-->
                </ul>

            </nav>

            <span><a href="#login">로그인</a></span>

        </header>

        <!-- Main -->
        <div id="main">

            <!-- login -->
            <article id="login">
                <form action="AdminLogin" method="post">
                    <table>
                        <tr>
                            <td align="right">아이디 :</td>
                            <td><input type="text" name="id"></td>
                        </tr>
                        <tr>
                            <td align="right">비밀번호 :</td>
                            <td><input type="password" name="pw"></td>
                        </tr>

                        <tr>
                            <td align="center" colspan="2"><input type="submit" value="로그인"></td>
                        </tr>
                    </table>

                </form>
            </article>

            <!-- Intro -->
            <article id="intro">
                <h2 class="major">제품개요</h2>
                <span class="image main"><img src="images/Info.gif" alt="" /></span>
                <p>이 제품은 볼라드에 IoT를 접목한 스마트 볼라드 시스템으로 주기능은 볼라드의 신호표시 및 적신호시 무단횡단을
                    방지하기위한 시스템으로서 주변 정지선 카메라와 차량/보행자 신호등과의 연계로 크게는 교차로 전체를 제어할수있는 획기적인
                    시스템입니다.</p>
                <p>또한 이 시스템은 주변 경찰서와의 웹을통한 연계시스템을 통해 볼라드 및 카메라, 신호등 등의 교차로 제어
                    기기들의 상태파악 및 해당 기기들의 수리부서와의 연락을 통해 고장발견시 즉시 수리가 가능토록 조치가 가능합니다.</p>
            </article>
	
            <!-- Admin -->
            <article id="admin">
                <h2 class="major">
                    <i class="fas fa-users-cog"></i>관리자등록<i class="fas fa-users-cog"></i>
                </h2>
                <form action="AdminAdd" method="post">
                    
                    <table>
                        <tr>
                            <td align="right">아이디 :</td>
                            <td><input type="text" name="id"></td>
                        </tr>
                        <tr>
                            <td align="right">비밀번호 :</td>
                            <td><input type="password" name="pw"></td>
                        </tr>
                        <tr>
                            <td align="right">비밀번호확인 :</td>
                            <td><input type="password" name="pwck"></td>
                        </tr>
                        <tr>
                            <td align="right">경관이름 :</td>
                            <td><input type="text" name="admin"></td>
                        </tr>
                        <tr>
                            <td align="right">관할구역 :</td>
                            <td><input type="text" name="zone"></td>
                        </tr>
                        <tr>
                            <td align="right">경찰서명 :</td>
                            <td><input type="text" name="office"></td>
                        </tr>
                        <tr>
                            <td align="right"><input type="submit" value="등록하기"></td>
                            <td align="left"><input type="reset" value="다시입력"></td>
                        </tr>
                    </table>
                </form>
            </article>

            <!-- Bolad -->
            <article id="bolad">
                <h2 class="major">
                    <i class="fas fa-chess-pawn"></i>볼라드관리<i class="fas fa-chess-pawn"></i></i>
                </h2>
                <form>
                    <table>
                        <tr>
                            <form>
                                <td><input type="text"></td>
                                <td><input type="button" value="검색"></td>
                            </form>
                        </tr>
                    </table>
                    <br>
                    <div id="map" style="width: 100%; height: 350px;"></div>
                    <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd120e494a61065de839a6b3498e5cd"></script>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(35.123256,
                                    126.862632), // 지도의 중심좌표
                                level: 1
                                // 지도의 확대 레벨
                            };

                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        var imageSrc = '../../images/fix_bolad.png', // 마커이미지의 주소입니다    
                            imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
                            imageOption = {
                                offset: new kakao.maps.Point(27, 69)
                            }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                        var markerImage = new kakao.maps.MarkerImage(imageSrc,
                            imageSize, imageOption), markerPosition = new kakao.maps.LatLng(
                                35.123159, 126.862957); // 마커가 표시될 위치입니다

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({

                            position: markerPosition,
                            image: markerImage
                            // 마커이미지 설정 
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);

                        // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                        var content = '<div class="customoverlay">'
                            + '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">'
                            + '    <span class="title">구의야구공원</span>'
                            + '  </a>' + '</div>';

                        // 커스텀 오버레이가 표시될 위치입니다 
                        var position = new kakao.maps.LatLng(35.122956,
                            126.863001);

                        // 커스텀 오버레이를 생성합니다
                        var customOverlay = new kakao.maps.CustomOverlay({
                            map: map,
                            position: position,
                            content: content,
                            yAnchor: 1
                        });
                    </script>
                    <table>
                        <tr align="center">
                            <td>볼라드번호</td>
                            <!-- bolno -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>제조공장</td>
                            <!-- product -->
                            <td>상태표시</td>
                            <!-- bstatus -->
                        </tr>
                        <!-- 반복문으로 반복시킬예정 -->
                        <% for(int i = 0 ; i < list.size() ; i++) { %>
                        <tr align="center">
                            <td><%= list.get(i).getBolno() %></td>
                            <td><%= list.get(i).getStreet() %></td>
                            <td><%= list.get(i).getProduct() %></td>
                            <td><%= list.get(i).getBstatus() %></td>
                        </tr>
                        <% } %>
                    </table>
                </form>

                <table>
                    <tr>
                        <form action="#badd">
                            <!-- 추가창으로이동 insert문 이용 -->
                            <td align="center"><input type="submit" value="추가하기"></td>
                        </form>
                        <form action="#bupdate">
                            <!-- 수정창으로이동 update문 이용 -->
                            <td align="center"><input type="submit" value="수정하기"></td>
                        </form>
                        <form action="#bdelete">
                            <!-- 삭제창으로이동 체크박스필요 delete문 이용 -->
                            <td align="center"><input type="submit" value="삭제하기"></td>
                        </form>
                    </tr>
                </table>
            </article>
            <article id="badd">
                <h2>볼라드등록</h2>
                <form>
                    <table>
                        <tr>
                            <form action="BoladAdd.java">
                                <td align="right">도로명 :</td>
                                <td><input type="text" name="street"></td>
                        </tr>
                        <tr>
                            <td align="right">제조공장 :</td>
                            <td><input type="text" name="product"></td>
                        </tr>
                        <tr>
                            <td align="center" colspan = "2"><input type="submit" value="등록하기"><input type="reset" value="다시입력"></td>
                        </tr>
                </form>
                </table>
            </article>
            <article id="bupdate">
                <h2>볼라드수정</h2>
                <table>
                    <form>
                        <tr>
                            <form action="BoladUpdate.java">
                                <td align="right">도로명 :</td>
                                <td><input type="text" name="road"></td>
                        </tr>
                        <tr>
                            <td align="right">제조공장 :</td>
                            <td><input type="text" name="product"></td>
                        </tr>
                        <tr>
                           <td align="center" colspan = "2"><input type="submit" value="수정하기"><input type="reset" value="다시입력"></td>
                    </form>
                    </tr>
                </table>
            </article>
            <article id="bdelete">
                <h2>볼라드삭제</h2>
                <form action="BoladDelete.java">
                    <table>
                        <tr align="center">
                            <td>볼라드번호</td>
                            <!-- bolno -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>제조공장</td>
                            <!-- product -->
                            <td>상태표시</td>
                            <!-- bstatus -->
                        </tr>
                        <tr>
                            <td></td>
                            <!-- 삭제데이터를 반복문으로 불러오기 -->
                        </tr>
                        <tr>
                           <td align="center" colspan = "4">  <input type="submit" value="삭제하기"></td>
                        </tr>
                    </table>
                </form>
            </article>
            <!-- Stopline -->

            <article id="stopline">
                <h2 class="major">
                    <i class="fas fa-video"></i>정지선 위반 관리<i class="fas fa-video"></i>
                </h2>
                <form>
                    <div id="cap"></div>
                    <table>
                        <tr align="center">
                            <td>위반단속번호</td>
                            <!-- capno -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>적발시간</td>
                            <!-- sysdate로 자동지정 -->
                            <td>차량번호</td>
                            <!-- carno -->
                            <td>적발사진(경로)</td>
                            <!-- capture -->
                            <td>볼라드번호</td>
                            <!-- bolno -->
                        </tr>
                        <tr align="center">
                            <!-- 반복문으로 반복시킬예정 -->
                            <td>C00001</td>
                            <td>풍암로</td>
                            <td>21/06/21 16:20</td>
                            <td>123가4567</td>
                            <td>사진외부경로</td>
                            <td>B00001</td>
                        </tr>
                        <tr align="center">
                            <td>C00001</td>
                            <td>풍암로</td>
                            <td>21/06/21 16:20</td>
                            <td>123가4567</td>
                            <td>사진외부경로</td>
                            <td>B00001</td>
                        </tr>
                        <tr align="center">
                            <td>C00001</td>
                            <td>풍암로</td>
                            <td>21/06/21 16:20</td>
                            <td>123가4567</td>
                            <td>사진외부경로</td>
                            <td>B00001</td>
                        </tr>
                    </table>
                </form>
                <table>
                    <tr>
                        <form action="StopAdd.java">
                            <!-- 버튼 누를시 즉시 등록 insert문 이용 -->
                            <td align="center"><input type="submit" value="추가하기"></td>
                        </form>
                        <form action="StopUpdate.java">
                            <!-- 버튼 누를시 즉시 수정 update문 이용 -->
                            <td align="center"><input type="submit" value="수정하기"></td>
                        </form>
                        <form action="#sdelete">
                            <!-- 삭제창으로이동 체크박스필요 delete문 이용 -->
                            <td align="center"><input type="submit" value="삭제하기"></td>
                        </form>
                    </tr>
                </table>
            </article>

            <article id="sdelete">
                <h2>정지선 위반 삭제</h2>
                <form action="StopDelete.java">
                    <table>
                        <tr align="center">
                            <td>위반단속번호</td>
                            <!-- capno -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>적발시간</td>
                            <!-- sysdate로 자동지정 -->
                            <td>차량번호</td>
                            <!-- carno -->
                            <td>적발사진(경로)</td>
                            <!-- capture -->
                            <td>볼라드번호</td>
                            <!-- bolno -->
                        </tr>
                        <tr>
                            <td></td>
                            <!-- 삭제데이터를 반복문으로 불러오기 -->
                        </tr>
                        <tr>
                            <td align="center" colspan = "6"><input type="submit" value="삭제하기"></td>
                        </tr>
                    </table>
                </form>
            </article>

            <script src="./assets/js/jquery.min.js"></script>

            <script>
                function capture() {
                    alert("!");
                    var cap = document.getElementById("cap");
                    cap.innerHTML = "<img src = '../../images/unnamed.jpg'>";
                }
            </script>

            <!-- Event -->
            <article id="event">
                <h2 class="major">
                    <i class="far fa-calendar-alt"></i>축제일정관리<i class="far fa-calendar-alt"></i>
                </h2>
                <form>
                    <table>
                        <tr align="center">
                            <td>행사명</td>
                            <!-- ename -->
                            <td>기간</td>
                            <!-- day -->
                            <td>주최자</td>
                            <!-- host -->
                            <td>통제시간</td>
                            <!-- etime -->
                            <td>참가인원</td>
                            <!-- people -->
                            <td>시작구간</td>
                            <!-- sstreet -->
                            <td>종료구간</td>
                            <!-- estreet -->
                        </tr>
                        <tr align="center">
                            <td>2021 추억의 충장축제</td>
                            <!-- ename -->
                            <td>21/09/01~21/09/16</td>
                            <!-- day -->
                            <td>동구청</td>
                            <!-- host -->
                            <td>18:00~20:00</td>
                            <!-- etime -->
                            <td>미정</td>
                            <!-- people -->
                            <td>금남로</td>
                            <!-- sstreet -->
                            <td>문화전당로</td>
                            <!-- estreet -->
                        </tr>
                        <tr align="center">
                            <td>2021 추억의 충장축제</td>
                            <!-- ename -->
                            <td>21/09/01~21/09/16</td>
                            <!-- day -->
                            <td>동구청</td>
                            <!-- host -->
                            <td>18:00~20:00</td>
                            <!-- etime -->
                            <td>미정</td>
                            <!-- people -->
                            <td>금남로</td>
                            <!-- sstreet -->
                            <td>문화전당로</td>
                            <!-- estreet -->
                        </tr>
                        <tr align="center">
                            <td>2021 추억의 충장축제</td>
                            <!-- ename -->
                            <td>21/09/01~21/09/16</td>
                            <!-- day -->
                            <td>동구청</td>
                            <!-- host -->
                            <td>18:00~20:00</td>
                            <!-- etime -->
                            <td>미정</td>
                            <!-- people -->
                            <td>금남로</td>
                            <!-- sstreet -->
                            <td>문화전당로</td>
                            <!-- estreet -->
                        </tr>
                        <tr align="center">
                            <td>2021 추억의 충장축제</td>
                            <!-- ename -->
                            <td>21/09/01~21/09/16</td>
                            <!-- day -->
                            <td>동구청</td>
                            <!-- host -->
                            <td>18:00~20:00</td>
                            <!-- etime -->
                            <td>미정</td>
                            <!-- people -->
                            <td>금남로</td>
                            <!-- sstreet -->
                            <td>문화전당로</td>
                            <!-- estreet -->
                        </tr>
                    </table>
                </form>
                <table>
                    <tr>
                        <form action="#evadd">
                            <!-- 추가창으로이동 insert문 이용 -->
                            <td align="center"><input type="submit" value="추가하기"></td>
                        </form>
                        <form action="#evupdate">
                            <!-- 수정창으로이동 update문 이용 -->
                            <td align="center"><input type="submit" value="수정하기"></td>
                        </form>
                        <form action="#evdelete">
                            <!-- 삭제창으로이동 체크박스필요 delete문 이용 -->
                            <td align="center"><input type="submit" value="삭제하기"></td>
                        </form>
                    </tr>
                </table>
            </article>

            <article id="evadd">
                <h2>행사/집회등록</h2>
                <table>
                    <form action="EventAdd.java">
                        <tr>
                            <td align="right">행사명 :</td>
                            <td><input type="text" name="ename"></td>
                        </tr>
                        <tr>
                            <td align="right">기간 :</td>
                            <td><input type="text" name="day"></td>
                        </tr>
                        <tr>
                            <td align="right">주최자 :</td>
                            <td><input type="text" name="host"></td>
                        </tr>
                        <tr>
                            <td align="right">통제시간 :</td>
                            <td><input type="text" name="etime"></td>
                        </tr>
                        <tr>
                            <td align="right">참가인원 :</td>
                            <td><input type="text" name="people"></td>
                        </tr>
                        <tr>
                            <td align="right">시작구간 :</td>
                            <td><input type="text" name="sstreet"></td>
                        </tr>
                        <tr>
                            <td align="right">종료구간 :</td>
                            <td><input type="text" name="estreet"></td>
                        </tr>
                        <tr>
                           <td align="center" colspan = "2"><input type="submit" value="등록하기"><input type="reset" value="다시입력"></td>
                        </tr>
                </table>
                </form>
            </article>
            <article id="evupdate">
                <h2>행사/집회수정</h2>
                <table>
                    <form action="EventUpdate.java">
                        <tr>
                            <td align="right">행사명 :</td>
                            <td><input type="text" name="ename"></td>
                        </tr>
                        <tr>
                            <td align="right">기간 :</td>
                            <td><input type="text" name="day"></td>
                        </tr>
                        <tr>
                            <td align="right">주최자 :</td>
                            <td><input type="text" name="host"></td>
                        </tr>
                        <tr>
                            <td align="right">통제시간 :</td>
                            <td><input type="text" name="etime"></td>
                        </tr>
                        <tr>
                            <td align="right">참가인원 :</td>
                            <td><input type="text" name="people"></td>
                        </tr>
                        <tr>
                            <td align="right">시작구간 :</td>
                            <td><input type="text" name="sstreet"></td>
                        </tr>
                        <tr>
                            <td align="right">종료구간 :</td>
                            <td><input type="text" name="estreet"></td>
                        </tr>
                        <tr>
                            <td align="center" colspan = "2"><input type="submit" value="수정하기"><input type="reset" value="다시입력"></td>
                    </form>
                    </tr>
                </table>
            </article>
            <article id="evdelete">
                <h2>행사/집회삭제</h2>
                <form action="EventDelete.java">
                    <table>
                        <tr align="center">
                            <td>행사명</td>
                            <!-- ename -->
                            <td>기간</td>
                            <!-- day -->
                            <td>주최자</td>
                            <!-- host -->
                            <td>통제시간</td>
                            <!-- etime -->
                            <td>참가인원</td>
                            <!-- people -->
                            <td>시작구간</td>
                            <!-- sstreet -->
                            <td>종료구간</td>
                            <!-- estreet -->
                        </tr>
                        <tr>
                            <td></td>
                            <!-- 삭제데이터를 반복문으로 불러오기 -->
                        </tr>
                        <tr>
                            <td align="center" colspan = "7"><input type="submit" value="삭제하기"></td>
                        </tr>
                    </table>
                </form>
            </article>

            <!-- EMC -->
            <article id="emc">
                <h2 class="major">
                    <i class="fas fa-road"></i></i>교통통제관리<i class="fas fa-road"></i></i>
                </h2>
                <form action="EventAdd" method="post">
                    <table>
                        <form>
                            <tr align="center">
                                <td>볼라드번호</td>
                                <!-- bolno -->
                                <td>통제내용</td>
                                <!-- info -->
                                <td>담당자</td>
                                <!-- manager -->
                                <td>도로명</td>
                                <!-- street -->
                                <td>통제시간</td>
                                <!-- ttime -->
                                <td>신호상태</td>
                                <!-- lightcolor -->
                                <td>관할구역</td>
                                <!-- zone -->
                            </tr>
                            <tr align="center">
                                <td>B00001</td>
                                <td>장마로 인한 도로침수</td>
                                <td>서구청</td>
                                <td>죽봉대로</td>
                                <td>00:00~23:59</td>
                                <td>정상</td>
                                <td>서구</td>
                            </tr>
                            <tr align="center">
                                <td>B00001</td>
                                <td>장마로 인한 도로침수</td>
                                <td>서구청</td>
                                <td>죽봉대로</td>
                                <td>00:00~23:59</td>
                                <td>정상</td>
                                <td>서구</td>
                            </tr>
                            <tr align="center">
                                <td>B00001</td>
                                <td>장마로 인한 도로침수</td>
                                <td>서구청</td>
                                <td>죽봉대로</td>
                                <td>00:00~23:59</td>
                                <td>정상</td>
                                <td>서구</td>
                            </tr>
                            <tr align="center">
                                <td>B00001</td>
                                <td>장마로 인한 도로침수</td>
                                <td>서구청</td>
                                <td>죽봉대로</td>
                                <td>00:00~23:59</td>
                                <td>정상</td>
                                <td>서구</td>
                            </tr>
                        </form>
                    </table>
                    <table>
                        <tr>
                            <form action="#emadd">
                                <!-- 추가창으로이동 insert문 이용 -->
                                <td align="center"><input type="submit" value="추가하기"></td>
                            </form>
                            <form action="#emupdate">
                                <!-- 수정창으로이동 update문 이용 -->
                                <td align="center"><input type="submit" value="수정하기"></td>
                            </form>
                            <form action="#emdelete">
                                <!-- 삭제창으로이동 체크박스필요 delete문 이용 -->
                                <td align="center"><input type="submit" value="삭제하기"></td>
                            </form>
                            <form action="#emccontroll">
                                <!-- 통제창으로이동 서버로 신호 전송 예정 -->
                                <td align="center"><input type="submit" value="교통통제하기"></td>
                            </form>
                        </tr>
                    </table>
                </form>
            </article>

            <article id="emadd">
                <h2>교통통제등록</h2>
                <table>
                    <form action="EmcAdd.java">
                        <tr>
                            <td align="right">도로명 :</td>
                            <td><input type="text" name="ename"></td>
                        </tr>
                        <tr>
                            <td align="right">기간 :</td>
                            <td><input type="text" name="day"></td>
                        </tr>
                        <tr>
                            <td align="right">통제내용 :</td>
                            <td><input type="text" name="host"></td>
                        </tr>
                        <tr>
                            <td align="right">담당자 :</td>
                            <td><input type="text" name="etime"></td>
                        </tr>
                        <tr>
                            <td align="right">통제시간 :</td>
                            <td><input type="text" name="people"></td>
                        </tr>
                        <tr>
                            <td align="right">관할구역 :</td>
                            <td><input type="text" name="sstreet"></td>
                        </tr>
                        <tr>
                            <td align="center" colspan = "2"><input type="submit" value="등록하기"><input type="reset" value="다시입력"></td>
                        </tr>
                </table>
                </form>
            </article>
            <article id="evupdate">
                <h2>교통통제수정</h2>
                <table>
                    <form action="EmcUpdate.java">
                        <tr>
                            <td align="right">도로명 :</td>
                            <td><input type="text" name="ename"></td>
                        </tr>
                        <tr>
                            <td align="right">기간 :</td>
                            <td><input type="text" name="day"></td>
                        </tr>
                        <tr>
                            <td align="right">통제내용 :</td>
                            <td><input type="text" name="host"></td>
                        </tr>
                        <tr>
                            <td align="right">담당자 :</td>
                            <td><input type="text" name="etime"></td>
                        </tr>
                        <tr>
                            <td align="right">통제시간 :</td>
                            <td><input type="text" name="people"></td>
                        </tr>
                        <tr>
                            <td align="right">관할구역 :</td>
                            <td><input type="text" name="sstreet"></td>
                        </tr>
                        <tr>
                           <td align="center" colspan = "2"><input type="submit" value="수정하기"><input type="reset" value="다시입력"></td>
                    </form>
                    </tr>
                </table>
            </article>
            <article id="emdelete">
                <h2>교통통제삭제</h2>
                <form action="EmcDelete.java">
                    <table>
                        <tr align="center">
                            <td>볼라드번호</td>
                            <!-- bolno -->
                            <td>통제내용</td>
                            <!-- info -->
                            <td>담당자</td>
                            <!-- manager -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>통제시간</td>
                            <!-- ttime -->
                            <td>신호상태</td>
                            <!-- lightcolor -->
                            <td>관할구역</td>
                            <!-- zone -->
                        </tr>
                        <tr>
                            <td></td>
                            <!-- 삭제데이터를 반복문으로 불러오기 -->
                        </tr>
                        <tr>
                            <td align="center" colspan = "7"><input type="submit" value="삭제하기"></td>
                        </tr>
                    </table>
                </form>
            </article>
            <article id="emccontroll">
                <h2>교통통제</h2>
                <form action="EmcControll.java">
                    <table>
                        <tr align="center">
                            <td>볼라드번호</td>
                            <!-- bolno -->
                            <td>도로명</td>
                            <!-- street -->
                            <td>신호상태</td>
                            <!-- lightcolor -->
                            <td>관할구역</td>
                            <!-- zone -->
                        </tr>
                        <tr>
                            <td></td>
                            <!-- 통제데이터를 반복문으로 불러오기 -->
                        </tr>
                        <tr>
                            <td align="center" colspan = "4"><input type="submit" value="통제하기"></td>
                        </tr>
                    </table>
                </form>
            </article>

            <!-- Elements -->
            <article id="elements">
                <h2 class="major">Elements</h2>

                <section>
                    <h3 class="major">Text</h3>
                    <p>
                        This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i>
                        and this is <em>emphasized</em>. This is <sup>superscript</sup>
                        text and this is <sub>subscript</sub> text. This is <u>underlined</u>
                        and this is code:
                        <code>for (;;) { ... }</code>
                        . Finally, <a href="#">this is a link</a>.
                    </p>
                    <hr />
                    <h2>Heading Level 2</h2>
                    <h3>Heading Level 3</h3>
                    <h4>Heading Level 4</h4>
                    <h5>Heading Level 5</h5>
                    <h6>Heading Level 6</h6>
                    <hr />
                    <h4>Blockquote</h4>
                    <blockquote>Fringilla nisl. Donec accumsan interdum
                        nisi, quis tincidunt felis sagittis eget tempus euismod.
                        Vestibulum ante ipsum primis in faucibus vestibulum. Blandit
                        adipiscing eu felis iaculis volutpat ac adipiscing accumsan
                        faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum
                        dolor sit amet nullam adipiscing eu felis.</blockquote>
                    <h4>Preformatted</h4>
                    <pre>
						<code>i = 0;

while (!deck.isInOrder()) {
    print 'Iteration ' + i;
    deck.shuffle();
    i++;
}

print 'It took ' + i + ' iterations to sort the deck.';</code>
					</pre>
                </section>

                <section>
                    <h3 class="major">Lists</h3>

                    <h4>Unordered</h4>
                    <ul>
                        <li>Dolor pulvinar etiam.</li>
                        <li>Sagittis adipiscing.</li>
                        <li>Felis enim feugiat.</li>
                    </ul>

                    <h4>Alternate</h4>
                    <ul class="alt">
                        <li>Dolor pulvinar etiam.</li>
                        <li>Sagittis adipiscing.</li>
                        <li>Felis enim feugiat.</li>
                    </ul>

                    <h4>Ordered</h4>
                    <ol>
                        <li>Dolor pulvinar etiam.</li>
                        <li>Etiam vel felis viverra.</li>
                        <li>Felis enim feugiat.</li>
                        <li>Dolor pulvinar etiam.</li>
                        <li>Etiam vel felis lorem.</li>
                        <li>Felis enim et feugiat.</li>
                    </ol>
                    <h4>Icons</h4>
                    <ul class="icons">
                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
                    </ul>

                    <h4>Actions</h4>
                    <ul class="actions">
                        <li><a href="#" class="button primary">Default</a></li>
                        <li><a href="#" class="button">Default</a></li>
                    </ul>
                    <ul class="actions stacked">
                        <li><a href="#" class="button primary">Default</a></li>
                        <li><a href="#" class="button">Default</a></li>
                    </ul>
                </section>

                <section>
                    <h3 class="major">Table</h3>
                    <h4>Default</h4>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Item One</td>
                                    <td>Ante turpis integer aliquet porttitor.</td>
                                    <td>29.99</td>
                                </tr>
                                <tr>
                                    <td>Item Two</td>
                                    <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                    <td>19.99</td>
                                </tr>
                                <tr>
                                    <td>Item Three</td>
                                    <td>Morbi faucibus arcu accumsan lorem.</td>
                                    <td>29.99</td>
                                </tr>
                                <tr>
                                    <td>Item Four</td>
                                    <td>Vitae integer tempus condimentum.</td>
                                    <td>19.99</td>
                                </tr>
                                <tr>
                                    <td>Item Five</td>
                                    <td>Ante turpis integer aliquet porttitor.</td>
                                    <td>29.99</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2"></td>
                                    <td>100.00</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    <h4>Alternate</h4>
                    <div class="table-wrapper">
                        <table class="alt">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Item One</td>
                                    <td>Ante turpis integer aliquet porttitor.</td>
                                    <td>29.99</td>
                                </tr>
                                <tr>
                                    <td>Item Two</td>
                                    <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                    <td>19.99</td>
                                </tr>
                                <tr>
                                    <td>Item Three</td>
                                    <td>Morbi faucibus arcu accumsan lorem.</td>
                                    <td>29.99</td>
                                </tr>
                                <tr>
                                    <td>Item Four</td>
                                    <td>Vitae integer tempus condimentum.</td>
                                    <td>19.99</td>
                                </tr>
                                <tr>
                                    <td>Item Five</td>
                                    <td>Ante turpis integer aliquet porttitor.</td>
                                    <td>29.99</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2"></td>
                                    <td>100.00</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </section>

                <section>
                    <h3 class="major">Buttons</h3>
                    <ul class="actions">
                        <li><a href="#" class="button primary">Primary</a></li>
                        <li><a href="#" class="button">Default</a></li>
                    </ul>
                    <ul class="actions">
                        <li><a href="#" class="button">Default</a></li>
                        <li><a href="#" class="button small">Small</a></li>
                    </ul>
                    <ul class="actions">
                        <li><a href="#" class="button primary icon solid fa-download">Icon</a></li>
                        <li><a href="#" class="button icon solid fa-download">Icon</a></li>
                    </ul>
                    <ul class="actions">
                        <li><span class="button primary disabled">Disabled</span></li>
                        <li><span class="button disabled">Disabled</span></li>
                    </ul>
                </section>

                <section>
                    <h3 class="major">Form</h3>
                    <form method="post" action="#">
                        <div class="fields">
                            <div class="field half">
                                <label for="demo-name">Name</label> <input type="text" name="demo-name" id="demo-name"
                                    value="" placeholder="Jane Doe" />
                            </div>
                            <div class="field half">
                                <label for="demo-email">Email</label> <input type="email" name="demo-email"
                                    id="demo-email" value="" placeholder="jane@untitled.tld" />
                            </div>
                            <div class="field">
                                <label for="demo-category">Category</label> <select name="demo-category"
                                    id="demo-category">
                                    <option value="">-</option>
                                    <option value="1">Manufacturing</option>
                                    <option value="1">Shipping</option>
                                    <option value="1">Administration</option>
                                    <option value="1">Human Resources</option>
                                </select>
                            </div>
                            <div class="field half">
                                <input type="radio" id="demo-priority-low" name="demo-priority" checked> <label
                                    for="demo-priority-low">Low</label>
                            </div>
                            <div class="field half">
                                <input type="radio" id="demo-priority-high" name="demo-priority">
                                <label for="demo-priority-high">High</label>
                            </div>
                            <div class="field half">
                                <input type="checkbox" id="demo-copy" name="demo-copy">
                                <label for="demo-copy">Email me a copy</label>
                            </div>
                            <div class="field half">
                                <input type="checkbox" id="demo-human" name="demo-human" checked>
                                <label for="demo-human">Not a robot</label>
                            </div>
                            <div class="field">
                                <label for="demo-message">Message</label>
                                <textarea name="demo-message" id="demo-message" placeholder="Enter your message"
                                    rows="6"></textarea>
                            </div>
                        </div>
                        <ul class="actions">
                            <li><input type="submit" value="Send Message" class="primary" /></li>
                            <li><input type="reset" value="Reset" /></li>
                        </ul>
                    </form>
                </section>

            </article>

        </div>

        <!-- Footer -->
        <footer id="footer">
            <p class="copyright">
                &copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
            </p>
        </footer>

    </div>

    <!-- BG -->
    <div id="bg"></div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>