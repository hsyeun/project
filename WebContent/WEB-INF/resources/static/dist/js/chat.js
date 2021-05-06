// 최초 진입
var m;
var o;
var b;
function chat_login_success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){
		m = ob.a_membersDto;
		o = ob.a_ordersDto;
		b = ob.list_A_barcode;
		
		if(m != undefined) ismember = true;
		if(o != undefined) isorder = true;

		if(ismember && isorder){
			if(m.phone != o.client_phone){
				alert('올바르지 않은 접근입니다.');
				return false;
			}
		}
		
		s+='<p>';
		if(ismember) s+=m.name+' 고객님<br>';
		s+='무엇을 도와드릴까요?</p>';	
		$('.textWrap').eq($('.textWrap').length-1).html(s);
		$('.innerContentWrap').eq($('.innerContentWrap').length-1).html(cando());
		scrollAnimation();
	}else{
		alert(ob.message);
	}
}

function chatloading(){
	var s = '';
	s+='<hr class="clear">';
	s+='<div class="chatWrap chatBot">';
	s+='	<div class="portraitWrap">';
	s+='		<div class="portrait"><img src="/resources/chatbot/img/512wooli2.png" alt=""></div>';
	s+='		<span class="alt">똑순이</span>';
	s+='	</div>';
	s+='	<div class="textBalloonWrap">';
	s+='		<div class="nameWrap">똑순이</div>';
	s+='		<div class="textBalloon">';
	s+='			<div class="textWrap">';
	s+='				<div class="txtLoading">';
	s+='					<img src="/resources/chatbot/img/textloading-animation.gif" alt="text loading">';
	s+='				</div>';
	s+='			</div>';
	s+='			<div class="imgPreviewWrap">';
	s+='			</div>';
	s+='		</div>';
	s+='	</div>';
	s+='	<div class="innerContentWrap">';	
	s+='	</div>';
	s+='</div>';
	
	s+='<div class="outterContentWrap">';
	s+='</div>';
	
	$('.content').append(s);
}

function cando(){
	var s = '';
	s+='<div class="linkWrap">';
	s+='	<ul class="linkItems">';
	s+='		<li class="linkItem" onclick="wooli_show();"><p>크린나라란?</p></li>';
	s+='		<li class="linkItem" onclick="wooli_my_order();"><p>나의 주문</p></li>';
	s+='		<li class="linkItem" onclick="wooli_qna();"><p>자주묻는질문</p></li>';
	/*s+='		<li class="linkItem"><p>자주 묻는질문</p></li>';
	s+='		<li class="linkItem"><p>할인 방법</p></li>';
	s+='		<li class="linkItem"><p>서비스 지역</p></li>';*/
	s+='	</ul>';
	s+='	<div class="btnViewTotal" onclick="wooli_move();">똑순이 티비영상</div>';
	s+='</div>';
	s+='<div class="videoPreviewWrap">';
	s+='</div>';
	return s;
}

function wooli_show(){
	var s = '';
	var imgPreviewWrap = '';
	var innerContentWrap = '';
	var outterContentWrap = '';
	
	s+='<p>세탁장인과 IT와의 만남. 크린나라입니다.</p>';
	
	outterContentWrap+='<div class="videosWrap">';
	outterContentWrap+='	<div class="videosInnerWrap">';
	outterContentWrap+='		<ul class="videoItems">';
	for (var i = 1; i < 6; i++) {
		outterContentWrap+='			<li class="videoItem">';
		outterContentWrap+='				<a href="#">';
		outterContentWrap+='					<img src="/resources/web/img/app/store/app'+i+'.png" height="400px">';
		outterContentWrap+='				</a>';
		outterContentWrap+='			</li>';
	}
	outterContentWrap+='		</ul>';
	outterContentWrap+='	</div>';
	outterContentWrap+='</div>';
	
	add_content(s, imgPreviewWrap, innerContentWrap, outterContentWrap);
}

function wooli_guide(){
	var s = '';
	var imgPreviewWrap = '';
	var innerContentWrap = '';
	var outterContentWrap = '';
	
	s+='<p>아래의 이미지 순서대로 진행이 됩니다</p>';
	
	add_content(s, imgPreviewWrap, innerContentWrap, outterContentWrap);
}

function wooli_qna(){
	var s = '';
	var imgPreviewWrap = '';
	var innerContentWrap = '';
	var outterContentWrap = '';
	
	s+='<p>무엇이 궁금하세요?</p>';
	
	innerContentWrap+='<div class="linkWrap">';
	innerContentWrap+='	<ul class="linkItems">';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'결제가 궁금합니다.\');"><p>결제가 궁금합니다.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'앱결제가 뭐예요.\');"><p>앱결제가 뭐예요.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'수거/배송비는요.\');"><p>수거/배송비는요.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'취소하고 싶어요.\');"><p>취소하고 싶어요.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'시간변경 할래요.\');"><p>시간변경 할래요.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'세탁은 몇일이 소요되나요.\');"><p>세탁은 몇일이 소요되나요.</p></li>';
	innerContentWrap+='		<li class="linkItem" onclick="reply_qna(\'옷이 망가지면요.\');"><p>옷이 망가지면요.</p></li>';
	innerContentWrap+='	</ul>';
	innerContentWrap+='</div>';
	
	add_content(s, imgPreviewWrap, innerContentWrap, outterContentWrap);
}

function reply_qna(reply){
	var s = '';
	if(reply == '결제가 궁금합니다.') s='<p>세탁물을 수거완료 후 정확한 품목과 수량을 확인하여, 당일 또는 익일 오전중으로 <b>카카오톡/문자</b> 가 자동 발송됩니다.<br>계산서를 수령 후 앱 결제 또는 무통장 입금으로 결제가 가능합니다.</p>';
	if(reply == '앱결제가 뭐예요.') s='<p>카카오톡으로 계산서 수령 후 크린나라 앱 => 주문내역 => 주문상세 에서 앱결제를 진행 할 수 있습니다.</br>카드결제라고 생각하시면 됩니다.</p>';
	if(reply == '수거/배송비는요.') s='<p>수거배송 비는 별도 없으며, 최소주문금액은 2만원입니다. 2만원 이하 주문 시 2만원 이하의 금액에 대한 최소주문금액이 발생합니다.</p>';
	if(reply == '취소하고 싶어요.') s='<p>주문 완료 후 세탁물이 수거 되기 이전까지는 <b>언제든지</b> 취소가 가능합니다. <br>하지만 세탁 특성상 이미 수거되어 세탁 공정이 진행중인 경우에는 취소가 <b>불가능</b>합니다.</p>';
	if(reply == '시간변경 할래요.') s='<p>수거 배송 <b>1시간</b> 이전까지는 주문상세 에서 변경 가능하고 카카오톡과 유선연락은 24시간 항시 열려있습니다.</p>';
	if(reply == '세탁은 몇일이 소요되나요.') s='<p> 세탁/드라이크리닝의 경우 <b>+2일</b>이 소요됩니다.<br>단 신발 또는 수선이 포함된 경우에는 <b>+1일</b> 정도 시간이 추가됩니다.</br>가맹점 마다 차이가 있으니 이점 참고하세요</p>';
	if(reply == '옷이 망가지면요.') s='<p>고객님의 소중한 의류에 문제가 생기지않도록 철저한 <b>재질구분</b>과 전문 세탁 공정을 거쳐 세탁되고 있으며,<br>혹여 세탁물이 손상되더라도 크린나라가 <b>책임지고</b> 보상 해 드립니다.</p>';
	
	$('.textWrap').eq($('.textWrap').length-1).html(s);
	scrollAnimation();
}

function wooli_move(){
	var s = "";
	s+='				<video controls autoplay loop style="width:100%;">';
	s+='   					<source src="https://clean-nara.com/resources/wooli.mp4" type="video/mp4">'; 
	s+='				</video>';
	$('.videoPreviewWrap').eq($('.videoPreviewWrap').length-1).html(s);
	scrollAnimation();
}

function wooli_my_order(){
	var status_code_name = getstatename(o.status_code);
	var s = '';
	var imgPreviewWrap = '';
	var innerContentWrap = '';
	var outterContentWrap = '';
	
	s+='<p>고객님의 현재 '+status_code_name+' 상태 입니다.</p>';
	if(o.status_code == 'SD') {
		s+='예약하신 '+wooliservice.timeTotext(o.order_picuptime)+' 에 찾아뵙도록 하겠습니다.</br>';
		if(o.order_door == 'Y') s+='비대면 수거는 따로 유선연락을 드리지 않습니다. </br>방문 시간전 꼭 문앞에 세탁물을 보관 해 주세요';
		if(o.order_door == 'N') s+='직접방문은 유선으로 전화를 드리고 방문 드려요. </br>매니저의 전화를 꼭 받아주세요!';
	}
	
	if(o.status_code == 'SDW') {
		s+='전화번호 : <a href="tel:'+o.sdw_employee_phone+'">'+wooliservice.phoneTodat(o.sdw_employee_phone)+'</a></br>'; 
		s+='매니저 : '+o.sdw_employee_phone_name+'</br>';
		s+='담당직원이 예약하신 시간에 방문 드리도록 하겠습니다.';
		imgPreviewWrap+='<div class="/resources/chatbot/imgCover"></div>';
		imgPreviewWrap+='<a href="#">';
		imgPreviewWrap+='	<img src="/resources/files/thum_'+o.sw_img+'" width="100%" alt="">';
		imgPreviewWrap+='</a>';
	}
	
	if(o.status_code == 'SW') {
		s+='전화번호 : <a href="tel:'+o.sw_employee_phone+'">'+wooliservice.phoneTodat(o.sw_employee_phone)+'</a></br>'; 
		s+='매니저 : '+o.sdw_employee_phone_name+'</br>';
		s+='총 '+o.orderbag_cnt+'개의 의류를 수거하였습니다. 검수 완료 후 접수증을 SNS로 발송 드리겠습니다.</br>';
	}
	
	if(o.status_code == 'TW') { 
		innerContentWrap+='<div class="linkWrap">';
		innerContentWrap+='	<ul class="linkItems">';
		var total = 0;
		for (var i = 0; i < b.length; i++) {
			var barcode = b[i];
			var item = barcode.item;
			var price = Number(barcode.price);
			total+=price;
			innerContentWrap+='		<li class="linkItem2"><a href="#"><p>'+item+'['+wooliservice.comma(price)+']</p></a></li>';
		}
		innerContentWrap+='	</ul>';
		innerContentWrap+='	<div class="btnViewTotal" onclick="move_payment();">결제금액 : '+wooliservice.comma(total)+'원 => 바로가기</div>';
		innerContentWrap+='</div>';
	}
	
	if(o.status_code == 'PW') {
		s+='결제번호 : '+o.pay_key+'</br>';
		s+='결제방법 : '+getPayTypeName(o.lgd_paytype)+'</br>';
		s+='결제금액 : '+wooliservice.comma(o.lgd_amount)+'</br>';
		s+='결제기관 : '+o.lgd_financename+'</br>';
	}
	
	if(o.status_code == 'LW') {
		s+='총 결제완료 금액은 '+wooliservice.comma(o.lgd_amount)+' 입니다</br>';
		s+='예약하신 '+o.order_deliverdate+' '+wooliservice.timeTotext(o.order_picuptime)+' 에 찾아뵙도록 하겠습니다.</br>';
		s+='배송일을 변경 하시려면 아래 링크로 이동하세요';
		innerContentWrap+='<div class="linkWrap">';
		innerContentWrap+='	<ul class="linkItems">';
		var total = 0;
		for (var i = 0; i < b.length; i++) {
			var barcode = b[i];
			var item = barcode.item;
			var price = Number(barcode.price);
			total+=price;
			innerContentWrap+='		<li class="linkItem2"><a href="#"><p>'+item+'['+wooliservice.comma(price)+']</p></a></li>';
		}
		innerContentWrap+='	</ul>';
		innerContentWrap+='	<div class="btnViewTotal" onclick="move_payment();">배송일 변경 => 앱으로 이동</div>';
		innerContentWrap+='</div>';
	}
	
	if(o.status_code == 'BDW') {
		s+='전화번호 : <a href="tel:'+o.bdw_employee_phone+'">'+wooliservice.phoneTodat(o.bdw_employee_phone)+'</a></br>'; 
		s+='매니저 : '+o.bdw_employee_phone_name+'</br>';
		s+='담당직원이 예약하신 시간에 방문 드리도록 하겠습니다.';
	}
	
	if(o.status_code == 'BW') {
		s+='전화번호 : <a href="tel:'+o.bw_employee_phone+'">'+wooliservice.phoneTodat(o.bw_employee_phone)+'</a></br>'; 
		s+='매니저 : '+o.bw_employee_phone_name+'</br>';
		s+='애용해 주셔서 감사합니다.';
		imgPreviewWrap+='<div class="/resources/chatbot/imgCover"></div>';
		imgPreviewWrap+='<a href="#">';
		imgPreviewWrap+='	<img src="/resources/files/thum_'+o.sw_img+'" width="100%" alt="">';
		imgPreviewWrap+='	<img src="/resources/files/thum_'+o.bw_img+'" width="100%" alt="">';
		imgPreviewWrap+='</a>';
	}
	
	add_content(s, imgPreviewWrap, innerContentWrap, outterContentWrap);
}

function move_payment(){
	window.location = '/openApp.jsp?type=payment';
}


function init_chat(){
	var s = '';
	s+='<p> 뭐든지 물어만 주세요! 전 똑똑한 똑순이예욧!</p>';
	$('.textWrap').eq($('.textWrap').length-1).html(s);
	$('.innerContentWrap').eq($('.innerContentWrap').length-1).html(cando());
	scrollAnimation();
}

function scrollAnimation(){
	var scrollMax = Math.max($(".contentWrap .content").height());
	var el = document.scrollingElement || document.documentElement;
	$(el).animate({scrollTop:scrollMax},10);
}

function add_content(s, imgPreviewWrap, innerContentWrap, outterContentWrap){
	chatloading();
	setTimeout(function(){ 
		$('.textWrap').eq($('.textWrap').length-1).html('<p>'+s+'</p>');
		$('.imgPreviewWrap').eq($('.imgPreviewWrap').length-1).html(imgPreviewWrap);
		$('.innerContentWrap').eq($('.innerContentWrap').length-1).html(innerContentWrap);
		$('.outterContentWrap').eq($('.innerContentWrap').length-1).html(outterContentWrap);
		scrollAnimation();
	}, 1000);	
}

function getPayTypeName(p){
	if(p == 'SC0010') return '카드결제';
	if(p == 'SC0030') return '계좌이체';
	if(p == 'SC0040') return '무통장입금';
}

function view_menu(){
	var s = '';
	s+='<p>';
	if(ismember) s+=m.name+' 고객님<br>';
	s+='무엇을 도와드릴까요?</p>';	
	add_content(s, '', cando(), '');
}