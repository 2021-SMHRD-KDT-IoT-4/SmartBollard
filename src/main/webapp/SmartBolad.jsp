<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="com.Model.StopDTO"%>
<%@page import="com.Model.StopDAO"%>
<%@page import="com.Model.EmcDTO"%>
<%@page import="com.Model.EmcDAO"%>
<%@page import="com.Model.EventDTO"%>
<%@page import="com.Model.EventDAO"%>
<%@page import="com.Model.BoladDTO"%>
<%@page import="com.Model.BoladDAO"%>
<%@page import="com.Model.AdminDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<html>

<head>
<title>Dimension by HTML5 UP</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>																					<!-- 해당 템플렛이 'UTF-8' 인코딩이 되어있다는 코드입니다. -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />														<!-- 외부 스타일 방식 적용 (템플렛 특성) -->
<link rel="stylesheet" href="assets/css/noscript.css" />
<noscript></noscript>


</head>
																											<!-- 내부 스타일 방식 적용 (일부 적용) -->
<style>																					
#event {
	background-color: red;																					/* 통제관리 버튼 적색처리 */
}

.button {
	background-color: black;																				/* 메뉴 전체버튼 흑색처리 */
}

.content {
	background-color : rgba( 0, 0, 0, 0.5) ;																/* 타이틀 헤더부분 흑색처리 & 투명도 적용 */
}
</style>

<body class="is-preload">
	<%
		AdminDTO info = (AdminDTO) session.getAttribute("login_info");										// 로그인 정보가 담긴 세션입니다. 

		int i = 0;
		BoladDAO dao = new BoladDAO();
		ArrayList<BoladDTO> boladList = dao.boladManage();													// 볼라드 정보가 담긴 List입니다.

		StopDAO stopDao = new StopDAO();
		ArrayList<StopDTO> stopList = stopDao.stopShow();													// 정지선위반 정보가 담긴 List입니다.

		EventDAO eventdao = new EventDAO();
		ArrayList<EventDTO> eventList = eventdao.showEvent();												// 축제및 일정 정보가 담긴 List입니다.

		EmcDAO emcdao = new EmcDAO();
		ArrayList<EmcDTO> emcList = emcdao.showEmc();														// 교통통제 정보가 담긴 List입니다.

		ArrayList<BoladDTO> bolnoList = null;

		String stbolno = null;
		response.setCharacterEncoding("UTF-8");																// 해당 템플릿이 'UTF-8' 인코딩이 되어있어 맞춰준 것입니다.
	%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">																				<!-- 타이틀 화면입니다. -->
			<div class="logo">
			</div>
			<div class="content">
				<div class="inner">
					<h1>SMART BOLLARD</h1>
					<p>IoT와 웹을 활용한 스마트 교차로 관리 시스템</p>
					<%
					if (info == null) {
					%>
					로그인이 필요합니다!
					<%
					} else {
					%>
					<span><%=info.getName()%> 관리자님 안녕하세요</span>
					<%
					}
					%>
				</div>
			</div>
			<nav>
				<ul>
					<%
					if (info == null) { 																	// 로그인 전에 나오는 메뉴들입니다.
					%>
					<li><a href="#intro" class="button">제품설명</a></li>
					<li><a href="#admin" class="button">관리자등록</a></li>
					<%
					} else { 																				// 로그인 후에 나오는 메뉴들입니다.
					%>
					<li><a href="#intro" class="button">제품설명</a></li>
					<li><a href="#admin" class="button">관리자등록</a></li>
					<li><a href="#bolad" class="button">볼라드관리</a></li>
					<li><a href="#stopline" class="button">정지선위반관리</a></li>
					<li><a href="#event" class="button">축제일정관리</a></li>
					<li><a href="#emc" id="event">통제관리</a></li>
					<%
					}
					%>
				</ul>

			</nav>
			<%
			if (info == null) {																				// 로그인 전에 나오는 메뉴입니다.
			%>
			<nav>
				<ul>
					<li><a href="#login" class="button">로그인</a></li>
				</ul>
			</nav>
			<%
			} else {																						// 로그인 후에 나오는 메뉴입니다.
			%>
			<nav>
				<ul>
					<li><a href="Logout" class="button">로그아웃</a></li>
				</ul>
			</nav>
			<%
			}
			%>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- login -->
			<article id="login">																			<!-- 로그인 화면입니다. -->
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
							<td align="center" colspan="2"><input type="submit"
								value="로그인"></td>
						</tr>
					</table>
				</form>
			</article>

			<!-- ㅣoginfail -->
			<article id="loginFail">																		<!-- 로그인 실패시의 화면입니다. -->
				<form action="SmartBolad.jsp">
					<td align="left"><input type="submit" value="뒤로가기"></td>
				</form>
				<table>
					<tr>
						<td align="center">로그인 실패!! 관련 부서에 문의하십시요!!</td>
					</tr>
				</table>
			</article>


			<!-- Intro -->
			<article id="intro">																			<!-- 제품개요 화면입니다. -->
				<h2 class="major">제품개요</h2>
				<table>
				<form action="SmartBolad.jsp">
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</form>
				</table>
				<span class="image main"><img src="images/info.gif" alt="실제로 만든 교차로 모형이 연속적으로 나옵니다"></span>
				<p>이 제품은 볼라드에 IoT를 접목한 스마트 볼라드 시스템으로 주기능은 볼라드의 신호표시 및 적신호시 무단횡단을
					방지하기위한 시스템으로서 주변 정지선 카메라와 차량/보행자 신호등과의 연계로 크게는 교차로 전체를 제어할수있는 획기적인
					시스템입니다.</p>
				<p>또한 이 시스템은 주변 경찰서와의 웹을통한 연계시스템을 통해 볼라드 및 카메라, 신호등 등의 교차로 제어
					기기들의 상태파악 및 해당 기기들의 수리부서와의 연락을 통해 고장발견시 즉시 수리가 가능토록 조치가 가능합니다.</p>
			</article>

			<!-- Admin -->
			<article id="admin">																			<!-- 관리자등록(회원가입) 화면입니다. -->
				<h2 class="major">
					<i class="fas fa-users-cog"></i>관리자등록<i class="fas fa-users-cog"></i>
				</h2>
				<table>
				<form action="SmartBolad.jsp">
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</form>
				</table>
				<form action="AdminAdd" method="post">

					<table>
						<tr align="center">
							<td>아이디 :</td>
							<td><input type="text" name="id"></td>
						</tr>
						<tr align="center">
							<td>비밀번호 :</td>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr align="center">
							<td>비밀번호확인 :</td>
							<td><input type="password" name="pwck"></td>
						</tr>
						<tr align="center">
							<td>경관이름 :</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr align="center">
							<td>관할구역 :</td>
							<td><input type="text" name="zone"></td>
						</tr>
						<tr align="center">
							<td>경찰서명 :</td>
							<td><input type="text" name="police"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="등록하기"></td>
							<td align="center"><input type="reset" value="다시입력"></td>
						</tr>
					</table>
				</form>
			</article>

			<!-- Bolad -->
			<article id="bolad">																			<!-- 볼라드관리 화면입니다.(실시간 볼라드 조회) -->
				<h2 class="major">
					<i class="fas fa-chess-pawn"></i>볼라드관리<i class="fas fa-chess-pawn"></i>
				</h2>
				<table>
				<form action="SmartBolad.jsp">
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</form>
				</table>

																											<!-- 이미지 지도를 표시할 div 입니다 -->

				<div id="staticMap" style="width: 1280px; height: 370px;"></div>		

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4cd120e494a61065de839a6b3498e5cd"></script>
				<script>
																											// 이미지 지도에 표시할 마커입니다
																											// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다
			
			var markers = [																					<!-- 지도에 볼라드의 위치를 마커로 찍어둔 기능입니다.(카카오 API 이용) -->
			    {
			        position: new kakao.maps.LatLng(33.450701, 126.570667)
			    },
			    {
			        position: new kakao.maps.LatLng(35.123195564562046,126.86298310286587), 
			        text: 'B<%=boladList.get(i).getBolno()%>'
			        	
			    },			<%i++;%>
			    {
			        position: new kakao.maps.LatLng(35.122978914776425,126.86269822615431), 
			        text: 'B<%=boladList.get(i).getBolno()%>'
			        
			    },			<%i++;%>
			    {
			        position: new kakao.maps.LatLng(35.12317664494927,126.86219598130481), 
			        text: 'B<%=boladList.get(i).getBolno()%>'
			        
			    },			<%i++;%>
			    {
			        position: new kakao.maps.LatLng(35.123440698322185,126.86255208797733), 
			        text: 'B<%=boladList.get(i).getBolno()%>'
			        
			    }
			];
			
			var staticMapContainer  = document.getElementById('staticMap'),									// 이미지 지도를 표시할 div  
			    staticMapOption = { 
			        center: new kakao.maps.LatLng(35.123172, 126.862616), 									// 이미지 지도의 중심좌표
			        level: 1, 																				// 이미지 지도의 확대 레벨
			        marker: markers 																		// 이미지 지도에 표시할 마커 
			    };    
			
			
																											
			var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);					// 이미지 지도를 생성합니다
			
				
		
			</script>

				<table>
					<tr align="center">																		<!-- 볼라드조회 기능입니다. -->
					
						<td>볼라드번호</td>																	<!-- bolno(sequence로 자동 삽입) -->
						
						<td>도로명</td>																		<!-- street -->
						
						<td>제조공장</td>																		<!-- product -->
						
						<td>상태표시</td>																		<!-- bstatus -->
						
						<td>삭제하기</td>																		<!-- 단일행 삭제 기능 -->
						
					
					</tr>
					<!-- 반복문으로 반복시킬예정 -->
					<%
					for (i = 0; i < boladList.size(); i++) {
					%>
					<tr align="center">
						<td>B<%=boladList.get(i).getBolno()%></td>
						<td><%=boladList.get(i).getStreet()%></td>
						<td><%=boladList.get(i).getProduct()%></td>
						<td><%=boladList.get(i).getBstatus()%></td>
						<td><a
							href="BoladDelete?bolno=<%=boladList.get(i).getBolno()%>">삭제</a></td>
						<td></td>
					</tr>
					<%
					}
					%>
				</table>


							<table>
								<tr>
								<form action="#badd">
							<!-- 추가창으로이동 insert문 이용 -->
							<td align="center" colspan="3"><input type="submit" value="추가하기"></td>
							</form></tr>
						</table>
					</tr>
				</table>
			</article>
			<article id="badd">																				<!-- 볼라드추가 화면입니다. -->
				<h2>볼라드등록</h2>
				<form action="#bolad">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form action="BoladAdd">
					<table>
						<tr align = "center">
							<td>도로명 :</td>
							<td><input type="text" name="street"></td>
						</tr>
						<tr align = "center">
							<td>제조공장 :</td>
							<td><input type="text" name="product"></td>
						</tr>
						<tr align = "center">
							<td><input type="submit" value="등록하기"></td>
							<td><input type="reset" value="다시입력"></td>
						</tr>
					</table>
				</form>
			</article>
			<!-- Stopline -->

			<article id="stopline">																			<!-- 정지선위반 관리 화면입니다.(실시간 위반사항 조회) -->
				<h2 class="major">
					<i class="fas fa-video"></i>정지선 위반 관리<i class="fas fa-video"></i>
				</h2>
				<form action="SmartBolad.jsp">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form>
					<div id="cap"></div>																	<!-- 정지선위반 조회 화면입니다. -->
					<table>
						<tr align="center">
						
							<td>위반단속번호</td>																<!-- capno(sequence로 자동 삽입)-->
							
							<td>도로명</td>																	<!-- street -->
							
							<td>적발시간</td>																	<!-- captime(sysdate로 자동 삽입) -->
							
							<td>차량번호</td>																	<!-- carno -->
							
							<td>적발사진(경로)</td>																<!-- capture(JavaScript사용 함수기능으로 링크를 누르면 사진 표시 기능-->
							
							<td>볼라드번호</td>																<!-- bolno -->
							
							<td>삭제하기</td>																	<!-- 단일행 삭제 기능 -->
						</tr>
						<!-- 반복문으로 반복시킬예정 -->
						<%
						for (i = 0; i < stopList.size(); i++) {
						%>
						<tr align="center">
							<td>C<%=stopList.get(i).getCapno()%></td>
							<td><%=stopList.get(i).getStreet()%></td>
							<td><%=stopList.get(i).getCaptime()%></td>
							<td><%=stopList.get(i).getCarno()%></td>
							<td><a id="cap" onclick="capture()"><%=stopList.get(i).getCapture()%></a></td>
							<td>B<%=stopList.get(i).getBolno()%></td>
							<td><a
								href="StopDelete?capno=<%=stopList.get(i).getCapno()%>">삭제</a></td>
						</tr>
						<%
						}
						%>
					</table>
				</form>
				<table>
					<tr>
						<form action="#sadd">
							<!-- 버튼 누를시 즉시 등록 insert문 이용 -->
							<td align="center"><input type="submit" value="추가하기"></td>
						</form>
					</tr>
				</table>
			</article>

			<article id="sadd">
				<h2>정지선 위반 추가</h2>																		<!-- 정지선 위반 추가 화면입니다. -->
				<form action="#stopline">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form action="StopAdd">
					<table>
						<tr align="center">
							<td>도로명 :</td>
							<td><input type="text" name="street"></td>
						</tr>
						<tr align = "center">
							<td>차량번호 :</td>
							<td><input type="text" name="carno"></td>
						</tr>
						<tr align = "center">
							<td>볼라드번호 :</td>
							<td><input type="text" name="bolno"></td>
						</tr>
						<tr align = "center">
							<td colspan="6"><input type="submit" value="추가하기"></td>
						</tr>
					</table>
				</form>
			</article>

			<script src="./assets/js/jquery.min.js"></script>												<!-- 정지선 위반사진 표시 기능입니다. -->

			<script>
				function capture() {
					alert("사진 전송중....");
					var cap = document.getElementById("cap");
					cap.innerHTML = "<img src = 'images/car.jpg'>";
				}
				</script>

			<!------ Event ------>
			<article id="event">																			<!-- 축제및 집회일정 관리화면입니다.(등록된 일정 조회) -->
				<h2 class="major">
					<i class="far fa-calendar-alt"></i>축제일정관리<i
						class="far fa-calendar-alt"></i>
				</h2>
				<form action="SmartBolad.jsp">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form>
					<table>
						<tr align="center">																	<!-- 축제및 집회 일정조회 화면입니다. -->
						
							<td>행사번호</td>																	<!-- eno(sequence로 자동 삽입) -->

							<td>행사명</td>																	<!-- ename -->
							
							<td>기간</td>																		<!-- day -->
							
							<td>주최자</td>																	<!-- host -->
							
							<td>통제시간</td>																	<!-- etime -->
							
							<td>참가인원</td>																	<!-- people -->
							
							<td>시작구간</td>																	<!-- sstreet -->
							
							<td>종료구간</td>																	<!-- estreet -->
							
							<td>삭제하기</td>																	<!-- 단일행 삭제기능 -->
						</tr>

						<%
						for (i = 0; i < eventList.size(); i++) {
						%>
						<tr align="center">
							<td><%=eventList.get(i).getEno()%></td>
							<td><%=eventList.get(i).getEname()%></td>
							<td><%=eventList.get(i).getDay()%></td>
							<td><%=eventList.get(i).getHost()%></td>
							<td><%=eventList.get(i).getEtime()%></td>
							<td><%=eventList.get(i).getPeople()%></td>
							<td><%=eventList.get(i).getSstreet()%></td>
							<td><%=eventList.get(i).getEstreet()%></td>
							<td><a
								href="EventDel?eno=<%=eventList.get(i).getEno()%>"> 삭제 </a></td>

						</tr>
						<%
						}
						%>

					</table>
				</form>
				<table>
					<tr>
						<form action="#evadd">
							<!-- 추가창으로이동 insert문 이용 -->
							<td align="center"><input type="submit" value="추가하기"></td>
						</form>


					</tr>
				</table>
			</article>

			<article id="evadd">																				<!-- 축제및 집회일정 추가 화면입니다. -->
				<h2>행사/집회등록</h2>
				<form action="#event">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<table>
					<form action="EventAdd" method="post">
						<tr align = "center">
							<td>행사명 :</td>
							<td><input type="text" name="ename"></td>
						</tr>
						<tr align = "center">
							<td>기간 :</td>
							<td><input type="text" name="day"></td>
						</tr>
						<tr align = "center">
							<td>주최자 :</td>
							<td><input type="text" name="host"></td>
						</tr>
						<tr align = "center">
							<td>통제시간 :</td>
							<td><input type="text" name="etime"></td>
						</tr>
						<tr align = "center">
							<td>참가인원 :</td>
							<td><input type="text" name="people"></td>
						</tr>
						<tr align = "center">
							<td>시작구간 :</td>
							<td><input type="text" name="sstreet"></td>
						</tr>
						<tr align = "center">
							<td>종료구간 :</td>
							<td><input type="text" name="estreet"></td>
						</tr>
						<tr align = "center">
							<td align="center"><input type="submit" value="등록하기"></td>
							<td><input type="reset" value="다시입력"></td>
						</tr>
				</table>
				</form>
			</article>



			<!-- EMC -->
			<article id="emc">																					<!-- 교통통제관리 화면입니다.(실시간 통제상태 조회) -->
				<h2 class="major">
					<i class="fas fa-road"></i>교통통제관리<i class="fas fa-road"></i>
				</h2>
				<form action="SmartBolad.jsp">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form action="EmcAdd" method="post">															<!-- 교통통제조회 화면입니다. -->
					<table>

						<tr align="center">
							<td align="center">통제번호</td>														<!-- emcno(sequence로 자동 삽입) -->
							
							<td align="center">통제내용</td>														<!-- info -->																					
							
							<td align="center">담당자</td>														<!-- manager -->
																												
							<td align="center">도로명</td>														<!-- street -->
																												
							<td align="center">통제시간</td>														<!-- ttime -->
																												
							<td align="center">통제상태</td>														<!-- lightcolor -->
																												
							<td align="center">관할구역</td>														<!-- zone -->
																												
							<td align="center">삭제하기</td>														<!-- 단일행 삭제 기능 -->
																					
							
						</tr>



						<%
						for (i = 0; i < emcList.size(); i++) {
						%>

						<tr>
							<td align="center"><%=emcList.get(i).getEmcno()%></td>
							<td align="center"><%=emcList.get(i).getInfo()%></td>
							<td align="center"><%=emcList.get(i).getManager()%></td>
							<td align="center"><%=emcList.get(i).getStreet()%></td>
							<td align="center"><%=emcList.get(i).getTtime()%></td>
							<td align="center"><%=emcList.get(i).getLightcolor()%></td>
							<td align="center"><%=emcList.get(i).getZone()%></td>
							<td align="center"><a
								href="EmcDelete?emcno=<%=emcList.get(i).getEmcno()%>">삭제</a></td>
						</tr>
						<%
						}
						%>


						</form>
					</table>
					<form action="#emadd" align="center">
						<input type="submit" value="추가하기">
					</form>
					<form action="#emccontroll" align="center">
						<input type="submit" value="교통통제하기">
					</form>
				</form>
			</article>

			<article id="emadd">																				<!-- 교통통제추가 화면입니다. -->
				<h2>교통통제등록</h2>
				<form action="#emc">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<table>
					<form action="EmcAdd">
						<tr align = "center">
							<td>통제내용 :</td>
							<td><input type="text" name="info"></td>
						</tr>
						<tr align = "center">
							<td>담당자 :</td>
							<td><input type="text" name="manager"></td>
						</tr>
						<tr align = "center">
							<td>도로명 :</td>
							<td><input type="text" name="street"></td>
						</tr>
						<tr align = "center">
							<td>통제날짜 :</td>
							<td><input type="text" name="ttime"></td>
						</tr>
						<tr align = "center">
							<td>관할구역 :</td>
							<td><input type="text" name="zone"></td>
						</tr>
						<tr align = "center">
							<td><input type="submit" value="등록하기"></td>
							<td><input type="reset" value="다시입력"></td>
					</form>
					</tr>
				</table>
			</article>
			</form>
			</article>


			<article id="emccontroll">																		<!-- 통제하기 화면입니다.(도로별로 볼라드 검색) -->
				<h2>교통통제</h2>
				<form action="#emc">
				<table>
					<tr><td align="left"><input type="submit" value="뒤로가기"></td></tr>
				</table>
				</form>
				<form action="SearchBolad">
				<table>
					<tr>
							<td><input type="text" name="street" placeholder="도로명을 입력하세요."></td>			<!-- 도로별 볼라드 검색기능입니다. -->
							<td align = "right"><input type="submit" value="검색"></td>
					</tr>
				</table>
				</form>
				<form action = "http://192.168.1.8">
					<table>
						<tr align="center">
							<td>볼라드번호</td>																<!-- bolno -->
							
						</tr>
						<!-- 통제데이터를 반복문으로 불러오기 -->
						<%
						String street = request.getParameter("name");

						if (street != null){
						%>
						<%
						ArrayList<BoladDTO> bolnoList1 = emcdao.streetBoladShow(street);
						
						%>
						<%
						for (i = 0; i < bolnoList1.size(); i++) {
						%>

						<tr>
							<td align="center"><input type="submit"
								value=<%=bolnoList1.get(i).getBolno()%> name = "bolno"></td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</form>
				
			</article>


		</div>

		<!-- Footer -->
		<footer id="footer">																					<!-- 문의 가능한 정보를 입력한 부분입니다.(실제 개발원 사이트와 우리조의 히스토리를 볼수있습니다.) -->
			<p class="copyright">해당 제품에 대한 자세한 사항은 010-XXXX-XXXX에 문의해주세요.</p>
			<a href = "mailto:smhrd@smhrd.or.kr" class="fas fa-envelope"></a>
			<a href = "https://www.youtube.com/channel/UCubIpLB7cA9tWIUZ26WFKPg" class="fab fa-youtube"></a>
			<a href = "https://www.facebook.com/smhrd0317" class="fab fa-facebook"></a>
			<a href = "https://www.instagram.com/smhrd0317?utm_medium=copy_link" class="fab fa-instagram"></a>
			<a href = "https://github.com/2021-SMHRD-KDT-IoT-4/SmartBollard" class="fab fa-github"></a>
			
			
			
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