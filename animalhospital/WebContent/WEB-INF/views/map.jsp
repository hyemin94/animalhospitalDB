<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 생성하기</title>
<script src="/mymvc/resources/jquery-3.2.1.min.js"></script>
</head>
<!-- js key : c13de804154308e5ee163a4dd3c992f3 -->
<body>
	<!-- 이미지 지도를 표시할 div 입니다 -->
	<!-- 
	<div id="staticMap" style="width: 100%; height: 350px;"></div> 
	<!-- <div id="staticMap" style="width:600px;height:350px;"></div>  -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c13de804154308e5ee163a4dd3c992f3&libraries=services">
		
	</script>
	<script>
	

	$("#tab").on('click', $(".name"), function(e) {
			
		if($(e.target).is('.name')) { 

			var name = $(e.target).text();
			var addr = $(e.target).next().text();
			
			var call = $(e.target).next().next().text();
			
			// 만약에 X, Y 값으로 사용시 null data 처리할 것 
			/* var X = $(e.target).next().next().next().text();
			var Y = $(e.target).next().next().next().next().text() */

			var geocoder = new kakao.maps.services.Geocoder();

			var mapContainer = document.getElementById('mapresult'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			geocoder.addressSearch(addr, function(result, status) {
				
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        var infowindow = new kakao.maps.InfoWindow({
			            content: 
			            	'<div style="width:200px;text-align:center;padding:6px 0;">'+ name + 
			            	'<br><hr>' + addr + '<br><hr>' + call + '</div>'
			        });
			        infowindow.open(map, marker);
			
			        map.setCenter(coords);
			    } 
			});    
     	}  // if($(e.target).is('.name')) end 
		
     	
		else if($(e.target).is('.address')) {
            
			var name = $(e.target).prev().text();
			var addr = $(e.target).text();
			
			var call = $(e.target).next().text();
			
			var X = $(e.target).next().next().next().text();
			var Y = $(e.target).next().next().next().next().text()
			
			var geocoder = new kakao.maps.services.Geocoder();

			var mapContainer = document.getElementById('mapresult'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			geocoder.addressSearch(addr, function(result, status) {
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        var infowindow = new kakao.maps.InfoWindow({
			            content: 
			            	'<div style="width:200px;text-align:center;padding:6px 0;">'+ name + 
			            	'<br><hr>' + addr + '<br><hr>' + call + '</div>'
			        });
			        infowindow.open(map, marker);
			
			        map.setCenter(coords);
			    } 
			});    
       	} // else if($(e.target).is('.address')) end 

	});	

			
	</script>
</body>
</html>