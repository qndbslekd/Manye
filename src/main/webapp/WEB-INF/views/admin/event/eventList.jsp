<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventList view</title>

<!-- 검색기능, href 걸기 디자인하기 -->

	<!-- 날짜 -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
$( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
        	
          dateFormat: "yy-mm-dd",
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        dateFormat: "yy-mm-dd",
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
    
  } );

</script>
</head>
<body>
<div class="grid-Wrapper">
	<div class="grid">  
		<div class="grid-sizer"></div>
		<div class="gutter-sizer"></div>
		<div class="grid-item grid-item--width6 ">
			<h1>이벤트 목록</h1>
			<form action="#" method="post">
				<table class="tableCss table">
					<tr>
						<th>이벤트명</th>
						<td><input name="SchEvName"></td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
							<div>
								<label for="from">시작일</label>
								<input type="text" name="evStart" id="from"/>
								<label for="to">종료일</label>
								<input type="text" name="evEnd" id="to"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>상태</th>
						<td>
							<label><input type="radio" value="Y" name="isOpen">활성</label>
							<label><input type="radio" value="N" name="isOpen">비활성</label>							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn-md" value="검색">
						</td>
					</tr>
				</table>
			</form>
		
			<table class="tableCss table">
				<tr>
					<th>No</th>
					<th>이벤트명</th>
					<th>판매상품</th>
					<th>기간</th>
					<th>이벤트 상태</th>
				</tr>
				<c:if test="${count == 0 || empty count }">
					<tr>
						<td>
							등록된 이벤트가 없습니다.
						</td>
					</tr>
				</c:if>
				
				<c:if test="${count > 0 }">
					<c:forEach var="eventList" items="${eventList }">
						<tr>
							<td>${number}</td>
								<c:set var="number" value="${number-1}" />
							<td>${eventList.eventName}</td>
							<td>${eventList.prName }</td>
							<td>${eventList.evStart} ~ ${eventList.evEnd}</td>
							<td>
								<c:if test="${eventList.isOpen == 'Y'}">활성</c:if>
								<c:if test="${eventList.isOpen == 'N'}">비활성</c:if>
							
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		
		</div> <!-- grid-item--width6  -->
	</div><!-- grid -->
</div>	<!-- grid-Wrapper -->



</body>
</html>