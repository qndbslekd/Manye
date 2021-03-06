<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert Event</title>
<script src="/resources/js/jquery.selectric.js"></script>
<link rel="stylesheet" href="/resources/css/selectric.css">

<!-- 유효성검사 js -->
<script src="/resources/js/formCheck.js"></script> 
<!-- 에디터 js -->
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">

	// ckeditor 설정
	CKEDITOR.on('dialogDefinition', function (ev) {
		
		var dialogName = ev.data.name;
		var dialog = ev.data.definition.dialog;
		var dialogDefinition = ev.data.definition;

		if (dialogName == 'image') {
			dialog.on('show', function (obj) {
				this.selectPage('Upload'); //사진 추가 버튼 클릭시 업로드탭으로 시작
			});	
			dialogDefinition.removeContents('advanced'); // 자세히탭 제거
			dialogDefinition.removeContents('Link'); // 링크탭 제거
		}
	});

	//이미지 업로드 url 설정
	var ckedit_config = {
		filebrowserUploadUrl : '/editor/ckuploader' ,  // 통신할 컨트롤러 매핑 주소 
		toolbar : ''
	}
	// ckeditor 설정 종료
	
</script>
 

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
		
			<form action="modifyEvnetPro" method="post" id="frm" name="frm" enctype="multipart/form-data">
				<input type="hidden" name="eventCode" value="${vo.eventCode }">
				<input type="hidden" name="pageNum" value="${pageNum }" />
				<table class="tableCss table">
					<tr>
						<th>제목</th>
						<td colspan="2"><input type="text" name="eventName" id="tilte" class="input-lg required" msg="제목을" placeholder="제목" size="130" value="${vo.eventName }" /></td>
					</tr>
					<tr>
						<th>술 검색</th>
							<td>
								<input id="dkSch" name="dkSch" class ="boardTitle_middle" />
								<button type="button" class="btn btn-sm btn-grey" onclick="searchDk()">검색</button>
							</td>
					</tr>
					<tr>
						<th>술 선택</th>
						<td colspan="2">
							<select id="option" type="select-one" name="productCode" class="sel short required" msg="술을">
								<option value="${vo.productCode}" selected="selected" >${vo.prName }</option>
							</select></td>
					</tr>
					<tr>
						<th>
							기간
						</th>
						<td>
							<div>
								<label for="from">시작일</label>
								<input type="text" name="evStart" id="from" value="${vo.evStart }" onchange="return checkDay()" class="required" msg="시작일을"/>
								<label for="to">종료일</label>
								<input type="text" name="evEnd" id="to" value="${vo.evEnd }" onchange="return checkDay()" class="required" msg="종료일을"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>활성화여부</th>
						<td>
							<c:if test="${vo.isOpen eq 'Y' }">
							<input type="radio" name="isOpen" value="Y" checked="checked">활성화 
							<input type="radio" name="isOpen" value="N">비활성화 
							</c:if>
							<c:if test="${vo.isOpen eq 'N' }">
							<input type="radio" name="isOpen" value="Y" >활성화 
							<input type="radio" name="isOpen" value="N" checked="checked">비활성화 
							</c:if>
						</td>					
						
					</tr>
					<tr>
						<th>대표사진</th>
						<td>
							<input type="hidden" name="oldImg" value="${vo.thumImg}" >
							<input type="file" name="eventImg"  />
							<br/><br/>
							<img src="${vo.thumImg}">
						</td>
					</tr>

					<tr>
						<td colspan="3" style="margin:0; padding:0">
							<textarea name="content" id="content" style="width:98%;" >${vo.content }</textarea>
							<script type="text/javascript">CKEDITOR.replace('content' , ckedit_config);</script>
						</td>
					</tr>
				</table>
				<div class="text-center pad-top10">
					<input id="addBtn" type="button" class="btn btn-md btn-blue" value="수정">
					<input type="button" class="btn-md" value="취소" onclick="window.location='/admin/event/eventList?pageNum=${pageNum}'"/>
				</div>
			</form>
		</div>
	</div>
</div>
</body>


 <!-- 검색기능 -->
 
 <script>
function searchDk(){
	var input = $('#dkSch').val();
	var context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	$.ajax({
		url: context +'/event/drinkCodeSearch?input='+input,
		type: "get",
		success : function(data){
			
			$('#option').empty();
			$("#option").append("<option value=>주류 선택</option>");
			
			
			var index = Object.keys(data).length;
			console.log(index);
			for(var i=0 ; i<index;i++){
				console.log(data[i].prCode);
				$('#option').append('<option value="'+data[i].prCode+'">'+data[i].prName+'</option>');
			}
		}
	});
	$(".sel").selectric("refresh");
}


/* 	<tr>
						<th>술 선택</th>
						<td colspan="2">
							<select id="option" name="productCode">
								<option value="option">선택</option>
							</select></td>
					</tr>  */
</script>
<script>
$(function() {
	
	$(".sel").selectric();

	// 전송버튼 클릭이벤트 
	// 에디터의 처리가 필요하므로 클릭 이벤트가 필요.
    $('#addBtn').click(function(){
		if (checkFormjquery()) {
		    		
		    		// 에디터 입력값 체크 
		    		var value = CKEDITOR.instances['content'].getData();
		    		if(!value) {
			    		alert("이벤트 상세정보를 입력해주세요.");    			
			    		return false;
		    		}    		
		    		if (confirm("정보를 수정하시겠습니까?")) {
			    		$("form[name='frm']").submit();
					}
		    	}

    });
});

</script>

<script>
	function checkDay(){
		var date = new Date();
		var year = date.getFullYear();
		var month = new String(date.getMonth() + 1);
		var day = new String(date.getDate());
		if(month.length == 1){
			month = "0" + month;
		}
		if(day.length == 1){
			day = "0" + day;
		}
		var today = year+month+day;
		var today1 = new Date(today);
		var from1 = $('#from').val();
		var from1Arr = from1.split('-');
		
		
		var fromCompare = from1Arr[0] + from1Arr[1] + from1Arr[2];
		
		
		if(today > fromCompare){
			alert("오늘 전 날짜로 지정할 수 없습니다")
			$('#from').val("");
			return false;
		}
		var to1 = $('#to').val();
		var to1Arr = to1.split('-');

		var toCompare = to1Arr[0] + to1Arr[1] + to1Arr[2];
		if(fromCompare > toCompare){
			alert("시작일 날짜로 지정할 수 없습니다")
			$('#to').val("");
			return false;
		}
	}
</script>
</html>