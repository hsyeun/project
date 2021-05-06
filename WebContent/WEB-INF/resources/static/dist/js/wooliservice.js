//|||||||||||||||||||||||||||| ##################  |||||||||||||||||||||||||||||/
var g_CurrFileName = "./" + document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 20); //"./joinadmin.html"
var g_AbsoluteUrl = document.URL.substring(document.domain.length + 12, document.URL.lastIndexOf("/") + 1);
var isie=(/msie/i).test(navigator.userAgent); //ie
var isie6=(/msie 6/i).test(navigator.userAgent); //ie 6
var isie7=(/msie 7/i).test(navigator.userAgent); //ie 7
var isie8=(/msie 8/i).test(navigator.userAgent); //ie 8
var isie9=(/msie 9/i).test(navigator.userAgent); //ie 9
var isfirefox=(/firefox/i).test(navigator.userAgent); //firefox
var isapple=(/applewebkit/i).test(navigator.userAgent); //safari,chrome
var isopera=(/opera/i).test(navigator.userAgent); //opera
var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);//ios
var isipad=(/(ipad)/i).test(navigator.userAgent);//ipad
var isandroid=(/android/i).test(navigator.userAgent);//android

//|||||||||||||||||||||||||||| TS TSRequest START |||||||||||||||||||||||||||||/
var Wooliservice = function()
{
	// 파라미터
	this.params = [];

	// GET 방식의 파라미터를 변수이름으로 가지고 옵니다.
    this.getParameter = function( name )
    {
        var rtnval = '';
        var nowAddress = unescape(location.href);
        var parameters = (nowAddress.slice(nowAddress.indexOf('?')+1,nowAddress.length)).split('&');
        for(var i = 0 ; i < parameters.length ; i++)
        {
            var varName = parameters[i].split('=')[0];
            if(varName.toUpperCase() == name.toUpperCase())
            {
                rtnval = parameters[i].split('=')[1];
                break;
            }
        }
		return rtnval;
    }

    // 3자리 단위로 , 를 부여합니다.
    this.comma = function( str )
    {
    	str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    // Form ID 를 넣으면 유효성 체크를 합니다.
    this.isVaildationForm = function( id )
    {
    	var ret = true;
    	if(ret){
    		$('#'+id+' input').each(function(key, value) {
    			var placeholder = $(this).attr('placeholder');
    			var necessary = $(this).attr('necessary');
    			var v = $(this).val();
    			if(placeholder != undefined && necessary != undefined){
    				if(necessary){
    					if($.trim(v) == ''){
    						modal_pop_dark('필수입력',placeholder + '은(는) 필수입력입니다.');
    						ret = false;
    						return false;
    					}
    				}
    			}
    	    });
    	}

    	if(ret){
    		$('#'+id+' select').each(function(key, value) {
    			var placeholder = $(this).attr('placeholder');
    			var necessary = $(this).attr('necessary');
    			var v = $(this).val();
    			if(placeholder != undefined && necessary != undefined){
    				if(necessary){
    					if($.trim(v) == ''){
    						modal_pop_dark('필수입력',placeholder + '은(는) 필수입력입니다.');
    						ret = false;
    						return false;
    					}
    				}
    			}
    	    });
    	}
    	
    	if(ret){
    		$('#'+id+' textarea').each(function(key, value) {
    			var placeholder = $(this).attr('placeholder');
    			var necessary = $(this).attr('necessary');
    			var v = $(this).val();
    			if(placeholder != undefined && necessary != undefined){
    				if(necessary){
    					if($.trim(v) == ''){
    						modal_pop_dark('필수입력',placeholder + '은(는) 필수입력입니다.');
    						ret = false;
    						return false;
    					}
    				}
    			}
    	    });
    	}

    	return ret;
    }            
    
    this.isMobile = function(phoneNum) 
    { 
    	var regExp =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; 
    	var myArray; 
    	if(regExp.test(phoneNum)){ 
    		myArray = regExp.exec(phoneNum); 
    		// console.log(myArray[1]); 
    		// console.log(myArray[2]); 
    		// console.log(myArray[3]); 
    		return true; 
    	} else { 
    		return false; 
    	}     	
    }
	
    this.initDatePicker = function(st, ed)
    {
    	$.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
    	
    	$( "#"+st ).datepicker();
    	$( "#"+ed ).datepicker();    	
    }
           
    this.ajaxclient_none = function(url, data, successFunction)
    {       	    	
    	$.ajax({
    		url : url,
    		type : 'post',
    		async: true,
    		data : data,
    		beforeSend:function(){
    			//$.LoadingOverlay("show");
    		},
    		complete:function(){
    			//$.LoadingOverlay("hide");
    		},
    		success : function(data){
    			//console.log(data);
    			var ob = $.parseJSON(data);
    			if(ob.code == '5555') window.location = '/mobile/lostSesstion'; 
    				
    			successFunction(data);
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});
    }
    
    this.ajaxclient = function(url, data, successFunction)
    {       	    	
    	$.ajax({
    		url : url,
    		type : 'post',
    		async: true,
    		data : data,
    		beforeSend:function(){
    			$.LoadingOverlay("show");
    		},
    		complete:function(){
    			$.LoadingOverlay("hide");
    		},
    		success : function(data){
    			//console.log(data);
    			var ob = $.parseJSON(data);
    			if(ob.code == '5555') window.location = '/mobile/lostSesstion'; 
    				
    			successFunction(data);
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});
    }
    
    this.ajaxadmin = function(url, data, successFunction)
    {       	    	
    	$.ajax({
    		url : url,
    		type : 'post',
    		async: true,
    		data : data,
    		beforeSend:function(){
    			$.LoadingOverlay("show");
    		},
    		complete:function(){
    			$.LoadingOverlay("hide");
    		},
    		success : function(data){
    			//console.log(data);
    			var ob = $.parseJSON(data);
    			if(ob.code == '5555'){
    				/*var wooli_id = localStorage.getItem('wooli_id');
    				var wooli_pwd = localStorage.getItem('wooli_pwd');
    				if(wooli_id == null) wooli_id = '';
    				if(wooli_pwd == null) wooli_pwd = '';
    				if(wooli_id == 'null') wooli_id = '';
    				if(wooli_pwd == 'null') wooli_pwd = '';
    				if(wooli_id != '' && wooli_pwd != ''){
    					window.location = '/admin/deliver?phone='+wooli_id; // 예외페이지 이동 
    				}else{
    					if(isios){
    						window.location = '/admin/login'; // 예외페이지 이동 
    					}else{
    						window.location = '/admin/logout'; // 예외페이지 이동 
    					}
    				}*/
    				window.location = '/admin/logout'; // 예외페이지 이동 
    			}
    				
    			successFunction(data);
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});
    }
    
    this.ajaxchat = function(url, data, successFunction)
    {       	    	
    	$.ajax({
    		url : url,
    		type : 'post',
    		async: true,
    		data : data,
    		beforeSend:function(){
    			chatloading();
    		},
    		complete:function(){
    			$.LoadingOverlay("hide");
    		},
    		success : function(data){
    			setTimeout(function(){ 
    				successFunction(data);
    			}, 1000);
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});
    }
    
    this.ajax = function(url, data, successFunction)
    {       	    	
    	$.ajax({
    		url : url,
    		type : 'post',
    		async: true,
    		data : data,
    		beforeSend:function(){
    			$('body').loading();
    		},
    		complete:function(){
    			$('body').loading('stop');
    		},
    		success : function(data){
    			//console.log(data);
    			var ob = $.parseJSON(data);
    			if(ob.code == '5555') window.location = '/superadmin/';
    			if(ob.code == '6666') window.location = '/admin/';
    				
    			successFunction(data);
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});
    }
    
    function getDate() {
        
    }
    
    // yyyymmdd To yyyy-mm-dd
    this.nowyyyymmddhhmmss = function()
    {
    	d = new Date();
        return d.YYYYMMDDHHMMSS();
    }
    
 // yyyymmdd To yyyy-mm-dd
    this.nowyyyy_mm_dd = function()
    {
    	return wooliservice.nowyyyymmddhhmmss().substring(0,4)+'-'+wooliservice.nowyyyymmddhhmmss().substring(4,6)+'-'+wooliservice.nowyyyymmddhhmmss().substring(6,8);
    }
    
    // yyyymmdd To yyyy-mm-dd
    this.yyyymmddToyyyy_mm_dd = function(s)
    {
    	var year = s.substring(0, 4);
    	var month = s.substring(4, 6);
    	var day = s.substring(6, 8);

    	return year + '-' + month + '-' + day;
    }
    
    // yyyymmdd To yyyy-mm-dd
    this.yyyymmddhhmmssTokor = function(s)
    {
    	var year = s.substring(0, 4);
    	var month = s.substring(4, 6);
    	var day = s.substring(6, 8);
    	
    	return year + '년' + month + '월' + day+ '일';
    }
    
    // yyyymmdd To 10:45분
    this.yyyymmddTohhqumm = function(s)
    {
    	var hh = s.substring(8, 10);
    	var mm = s.substring(10, 12);    	

    	return hh + ':' + mm;
    }

    // yyyymmdd To yyyy-mm-dd
    this.yyyymmddToyyyydatmmdatdd = function(s)
    {
    	var year = s.substring(0, 4);
    	var month = s.substring(4, 6);
    	var day = s.substring(6, 8);

    	return year + '.' + month + '.' + day;
    }

    this.fileUpload = function(url, formData, successFunction)
    {
    	$.ajax({
    		url : url,
    		processData: false,
    		contentType: false,
    		data: formData,
    		type: 'POST',	
    		beforeSend:function(){
    			$('body').loading();
    		},
    		complete:function(){
    			$('body').loading('stop');			
    		},
    		success : function(data){			
    			console.log(data);
    			successFunction(data);			
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}			
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});	
    }
    
    this.fileUploadUI = function(url, formData, successFunction)
    {
    	$.ajax({
    		url : url,
    		processData: false,
    		contentType: false,
    		data: formData,
    		type: 'POST',	
    		beforeSend:function(){
    			$.LoadingOverlay("show");
    		},
    		complete:function(){
    			$.LoadingOverlay("hide");			
    		},
    		success : function(data){			
    			console.log(data);
    			successFunction(data);			
    		},
    		error : function(request,status,error){
    			alert(error);
    			if(errorFunction!=undefined){
    				errorFunction(request,status,error);
    			}			
    		},
    		fail : function() {
    			alert("인터넷 연결 상태를 확인해주세요.");
    		}
    	});	
    }
    
    this.reload = function(data)
    {
		var ob = $.parseJSON(data);
		if(ob.code == '0000'){
			location.reload(); 				
		}else{
			alert(ob.message);
		}
	}
    
    this.open_addr = function()
    {
    	daum.postcode.load(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                	open_addr_result(data); 
                }
            }).open();
        });
	}      
        
    var geocoder;
    this.daumInit = function()
    {
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

	    // 지도를 생성합니다    
	    var map = new daum.maps.Map(mapContainer, mapOption); 
	
	    // 주소-좌표 변환 객체를 생성합니다
	    geocoder = new daum.maps.services.Geocoder();
    }
    
    this.get_latlng = function(addr)
    {
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(addr, function(result, status) {
    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === daum.maps.services.Status.OK) {
    	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
    	        get_latlng_result(result[0].y, result[0].x);
    	    } 
    	});  
    }
    
    // 관리자 옵션 관리
    this.gv = function(_cdmaster_code, _code, list)
    {    	
    	a = jQuery.grep(list, function( a ) {
          if(a.cdmaster_code == _cdmaster_code && a.code == _code)    		
        	  return a;
    	});
    	
    	return a;
    }
    
    // 주문하기
    this.gvs = function(_cdmaster_code, list)
    {    	
    	a = jQuery.grep(list, function( a ) {
          if(a.cdmaster_code == _cdmaster_code)    		
        	  return a;
    	});
    	
    	return a;
    }
    
    // 주문하기
    this.gv_coupon = function(_master_uuid, list)
    {    	
    	a = jQuery.grep(list, function( a ) {
          if(a.master_uuid == _master_uuid)    		
        	  return a;
    	});
    	
    	return a;
    }
    
    // 주문테이블 필터 개수
    this.status_cnt = function(status_code, list_A_ordersDto)
    {    	
    	a = jQuery.grep(list_A_ordersDto, function( a ) {
          if(a.status_code == status_code)    		
        	  return a;
    	});
    	
    	return a.length;
    }
    
    // 주문테이블 필터 개수
    this.client_addr_old_distinct = function(list_A_ordersDto)
    {    	
    	var jbAry = new Array();
    	for (var i = 0; i < list_A_ordersDto.length; i++) {
    		var client_addr_old = list_A_ordersDto[i].client_addr_old;
    		var arr = client_addr_old.split(' ');
    		var dong = arr[arr.length-2];
    		if(!jbAry.includes(dong)) jbAry.push(dong);
		}
    	return jbAry;
    }
    
    // 해당 
    this.client_addr_old_dong = function(status_code, addr_old, list_A_ordersDto)
    {    	
    	a = jQuery.grep(list_A_ordersDto, function( a ) {
            if(a.status_code == status_code && a.client_addr_old.indexOf(addr_old) > -1)    		
          	  return a;
      	});
    	
    	return a.length;
    }
    
    this.status_ob = function(status_code, list_A_ordersDto)
    {    	
    	a = jQuery.grep(list_A_ordersDto, function( a ) {
          if(a.status_code == status_code)    		
        	  return a;
    	});
    	
    	return a;
    }
    
    // 09-12 => 09시-12시
    this.timeTotext = function(t)
    {    	
    	return t.substring(0,2)+'시-'+t.substring(3,5)+'시';    	
    }
    
    // 상세값
    this.gvss = function(three, two, one)
    {    	
    	a = jQuery.grep(one, function( a ) {
          if(a.cdmaster_code == two && a.code == three)    		
        	  return a;
    	});
    	
    	if(a.length == 1) return a[0].subcode_name;
    	else return "";    	
    }
    
    // 1,2,3,4 input compare 01 02 03 return  
    this.gvt = function(t, list)
    {    	
    	a = jQuery.grep(list, function( a ) {
          if(Number(a.code.substring(0,2)) == t)    		
        	  return a;
    	});
    	
    	return a;
    }
    
    // 2018-01-01 오늘 날짜
    this.getYYYYMMDD = function(addDay)
    {    	
    	var now = new Date();
    	now.setDate(now.getDate() + addDay); /* 날짜 + 1일 */
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return year + '-' + mon + '-' + day;
    }
    
    // 2018
    this.getYYYY = function() 
    {    	
    	var now = new Date();
    	now.setDate(now.getDate()); /* 날짜 + 1일 */
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return year;
    }
    
    // 12
    this.getMM = function()
    {    	
    	var now = new Date();
    	now.setDate(now.getDate()); /* 날짜 + 1일 */
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return mon;
    }
    
    // 23
    this.getDD = function()
    {    	
    	var now = new Date();
    	now.setDate(now.getDate()); /* 날짜 + 1일 */
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return day;
    }
    
    // 2018
    this.getYYYYBeta = function(d) 
    {    
    	return d.substr(0,4);
    }
    
    // 12
    this.getMMBeta = function(d)
    {   
    	return d.substr(5,2);
    }
    
    // 23
    this.getDDBeta = function(d)
    {    	
    	return d.substr(8,2);
    }
    
    
    // 0,1,2 => 월
    this.getDay = function(addDay)
    {    	
    	var week = new Array('일', '월', '화', '수', '목', '금', '토');
    	var today = new Date();
    	today.setDate(today.getDate() + addDay); /* 날짜 + 1일 */
        var gettoday = today.getDay();
        var todayLabel = week[gettoday];
        
        return todayLabel;
    }
    
    // 2018-01-01 => 월
    this.getDayByyyyymmdd = function(yyyymmdd)
    {    	
    	var week = new Array('일', '월', '화', '수', '목', '금', '토');
    	var today = new Date(yyyymmdd);    	
        var gettoday = today.getDay();
        var todayLabel = week[gettoday];
        
        return todayLabel;
    }
    
    // 2018-01-01 => ORDER_WORKTIME_THU
    this.getCodeWorkLabel = function(yyyy_mm_dd)
    {    	
    	//var yyyymmdd = this.replaceAll(yyyy_mm_dd,'-','');
    	var dayOfweekEng = this.getDayEngByyyyymmdd(yyyy_mm_dd);
    	if(dayOfweekEng == 'sun') return 'ORDER_WORKTIME_SUN';
    	if(dayOfweekEng == 'mon') return 'ORDER_WORKTIME_MON';
    	if(dayOfweekEng == 'tue') return 'ORDER_WORKTIME_TUE';
    	if(dayOfweekEng == 'wed') return 'ORDER_WORKTIME_WED';
    	if(dayOfweekEng == 'thu') return 'ORDER_WORKTIME_THU';
    	if(dayOfweekEng == 'fri') return 'ORDER_WORKTIME_FRI';
    	if(dayOfweekEng == 'sat') return 'ORDER_WORKTIME_SAT';
    }

    this.replaceAll = function(str, searchStr, replaceStr)
    {    	
    	return str.split(searchStr).join(replaceStr);
    }
    
    // 0,1,2 => mon
    this.getDayEng = function(addDay)
    {    	
    	var week = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
    	var today = new Date();
    	today.setDate(today.getDate() + addDay); /* 날짜 + 1일 */
        var gettoday = today.getDay();
        var todayLabel = week[gettoday];
        
        return todayLabel;
    }
    
    // 2018-01-01 => 월
    this.getDayEngByyyyymmdd = function(yyyymmdd)
    {    	
    	var week = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
    	var today = new Date(yyyymmdd);    	
        var gettoday = today.getDay();
        var todayLabel = week[gettoday];
        
        return todayLabel;
    }
    
    // 날짜 더하기
    this.addDays = function(dt, add)
    {    	
    	var now = new Date(dt); 
    	now.setDate(now.getDate() + add); //15일 더하여 setting
    	var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return year + '-' + mon + '-' + day;
    }
    
    // 날짜 => 해당 날의 마지막달
    this.getStEdByDt = function(dt)
    {
    	var now = new Date(Number(dt.substring(0,4)), Number(dt.substring(5,7)), 0);
    	var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        return year + '-' + mon + '-' + day;
    }
    
    // 20181215123023 => 2019-03-12 23:34:12.0
    this.dateFormat1 = function(dt)
    {
    	if(dt == '') return '';
    	if(dt == undefined) return '';
    	return dt.substring(0,4)+'-'+dt.substring(4,6)+'-'+dt.substring(6,8)+' '+dt.substring(8,10)+':'+dt.substring(10,12)+':'+dt.substring(12,14)+'.0';
    }        
    
    // 공통 색변하는 span
    this.chgColor = function(id)
    {    	
    	$('#'+id).find('span').click(function(){
    		if($(this).text().indexOf('마감') > -1){
    			$(this).removeClass('off').removeClass('on').addClass('off');
    		}else{
    			var isOnOff = 'on';    		    		
        		$(this).parent().parent().find('span').removeClass('on').addClass('off');
        		$(this).removeClass('off').removeClass('on').addClass(isOnOff);
    		}    		    		
    	});
    } 
    
    // 
    this.phoneTodat = function(p)
    {    	
	    return p.substring(0,3)+'-'+p.substring(3,7)+'-'+p.substring(7);
    } 
    
    this.weekOfDayKor = function(d)
    {    
        var week = ['일', '월', '화', '수', '목', '금', '토'];
        var dayOfWeek = week[new Date(d).getDay()];
        return dayOfWeek;    	
	}

    // 페이징
    this.paging = function(page, pageSize, total)
    {    	
    	var s = '';
    	var disabledSt = '';
    	var disabledEt = '';
    	var mok = parseInt(total / pageSize); 
    	var namoji = total % pageSize;
    	var pageCnt = namoji == 0? mok:mok+1;
    	
    	if(mok == 0) pageCnt = 1;
    	if(page == 1) disabledSt = 'disabled';
    	if(page == pageCnt) disabledEt = 'disabled';
    	
    	s+='<button type="button" class="btn-prev" '+disabledSt+' data="'+(page-1)+'">이전</button>';
    	s+='	<span class="pages"><b>'+page+'</b>/'+pageCnt+'</span>';
    	s+='<button type="button" class="btn-next" '+disabledEt+' data="'+(page+1)+'">다음</button>';
    	$('.paging').html(s);    	    	
    }     
}

var wooliservice = new Wooliservice();

window.onhashchange = function (event) {	
	//closeNewModal();
}

function appToWebClosePop(){
	// 안드로이드 앱에서 웹 호출 뒤로가기 상세 페이지에서는 다 호출임
	// 현재 팝업이 있으면 닫고 없으면 뒤로가기
	if($("#div_popup").is(":visible")) closeNewModal();
	else {		
		if(window.location.href.indexOf('orderStep1.jsp')>-1 
				|| window.location.href.indexOf('useguide_detail.jsp')>-1
				|| window.location.href.indexOf('cs_detail.jsp')>-1
				|| window.location.href.indexOf('company_detail.jsp')>-1
				|| window.location.href.indexOf('laundry_detail.jsp')>-1
				|| window.location.href.indexOf('joinus_detail.jsp')>-1
				|| window.location.href.indexOf('partner_detail.jsp')>-1
				|| window.location.href.indexOf('event_detail.jsp')>-1
				|| window.location.href.indexOf('regist_detail.jsp')>-1
				|| window.location.href.indexOf('coupcharge_detail.jsp')>-1
				|| window.location.href.indexOf('cashcharge_detail.jsp')>-1){
			window.location = '/mobile/?page_name=pages/main.jsp';
		}else if(window.location.href.indexOf('order_detail.jsp')>-1){
			window.location = '/mobile/?page_name=pages/orderlist.jsp';
		}else if(window.location.href.indexOf('alram_detail.jsp')>-1 
				|| window.location.href.indexOf('profile_detail.jsp')>-1
				|| window.location.href.indexOf('rank_detail.jsp')>-1
				|| window.location.href.indexOf('outmember_detail.jsp')>-1
				|| window.location.href.indexOf('cash_detail.jsp')>-1
				|| window.location.href.indexOf('coupon_detail.jsp')>-1
				|| window.location.href.indexOf('board_mylist_detail.jsp')>-1
				|| window.location.href.indexOf('card_regist.jsp')>-1){
			window.location = '/mobile/?page_name=pages/setting.jsp';
		}else{
			history.back();
		}		
	}
}

function appToWebReloadOrder(){
	search($('.pages > b').text());
}

function link(url){
	window.location = '/mobile/link?move_url='+url;
}

function move(url){
	window.location = url;
}
//cmm_ajax(contextroot+'/report/er_report', report.paramToString(), edit_sample_SuccessFunction);










function getstatename(s){
	if(s == 'SX') return '관리자주문취소';
	if(s == 'CX') return '주문취소';
	if(s == 'XX') return '결제취소';
	if(s == 'SD') return '수거대기';
	if(s == 'SDW') return '수거진행';
	if(s == 'SW') return '수거완료';
	if(s == 'TW') return '결제대기';
	if(s == 'PW') return '결제완료';
	if(s == 'LW') return '결제세탁완료';
	if(s == 'BDW') return '배송진행';
	if(s == 'BW') return '배송완료';
}

function getstatename_patch(s,m){
	if(s == 'LW' && m == 'RP') return '현장결제대기';
	if(s == 'TW' && m == 'RP') return '현장결제대기';
	if(s == 'LW' && m == 'APP') return '결제완료';
	if(s == 'TW' && m == 'APP') return '앱결제대기';
	
	if(s == 'SX') return '관리자주문취소';
	if(s == 'CX') return '주문취소';
	if(s == 'XX') return '결제취소';
	if(s == 'SD') return '수거대기';
	if(s == 'SDW') return '수거진행';
	if(s == 'SW') return '수거완료';
	if(s == 'PW') return '결제완료';
	if(s == 'BDW') return '배송진행';
	if(s == 'BW') return '배송완료';
}

function getstatename_patch_admin(s,m){
	if(s == 'LW' && m == 'RP') return '<b style="color:red;">현장결제대기</b>';
	if(s == 'TW' && m == 'RP') return '<b style="color:red;">현장결제대기</b>';
	if(s == 'LW' && m == 'APP') return '결제완료';
	if(s == 'TW' && m == 'APP') return '<b style="color:red;">앱결제대기</b>';;
	
	if(s == 'SX') return '관리자주문취소';
	if(s == 'CX') return '주문취소';
	if(s == 'XX') return '결제취소';
	if(s == 'SD') return '수거대기';
	if(s == 'SDW') return '수거진행';
	if(s == 'SW') return '수거완료';
	if(s == 'PW') return '결제완료';
	if(s == 'BDW') return '배송진행';
	if(s == 'BW') return '배송완료';
}

function getstatecolor(s){
	if(s == 'CX') return 'red';
	if(s == 'SX') return 'red';
	if(s == 'XX') return 'red';
	if(s == 'SD') return 'blue';
	if(s == 'SDW') return 'blue';
	if(s == 'SW') return 'blue';
	if(s == 'TW') return 'yellow';
	if(s == 'PW') return 'blue';
	if(s == 'LW') return 'blue';
	if(s == 'BDW') return 'blue';
	if(s == 'BW') return 'green';
}

function admin_cmm_barcode(s,o){
	s+='<div class="">'
	s+='	<div class="one-half-responsive">';			
	s+='    	<div class="cart-costs large-costs full-bottom">';
	var total = 0;
	for (var j = 0; j < o.listA_barcode.length; j++) {
		var bc = o.listA_barcode[j];
		s+='<h5><strong>['+bc.barcode+']['+bc.item+']</strong><em>'+bc.price+'</em></h5>';
		total+=Number(bc.price);
	}
	s+='			<h6><strong>결제완료금액</strong><em>'+total+'</em></h6>';
	s+='		</div>';
	s+='	</div>';
	s+='</div>';
	return s;
}

var kakao_addr_detail;
var kakao_lat;
var kakao_lng;
function _navi(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){		
		Kakao.init('2d116c4711c0ab50de81311a2ed6f30c');
		Kakao.Navi.start({
			name: kakao_addr_detail,
			x: Number(kakao_lng),
			y: Number(kakao_lat),
			coordType: 'wgs84'
		});
	}else{
		modal_pop_dark(ob.code,ob.message);
	}
}

function _navi_force(){
	Kakao.init('2d116c4711c0ab50de81311a2ed6f30c');
	Kakao.Navi.start({
		name: kakao_addr_detail,
		x: Number(kakao_lng),
		y: Number(kakao_lat),
		coordType: 'wgs84'
	});
}

function navi(addr_detail,lat,lng,seq,status_code){
	if(status_code == 'SDW' || status_code == 'BDW'){
		kakao_addr_detail = addr_detail;
		kakao_lat = lat;
		kakao_lng = lng;
		var phone_mon = $.parseJSON(JsonMember).phone;
		if(phone_mon == '01068806380' || phone_mon == '01032024748' || phone_mon == '01038855177' || phone_mon == '01059132560'){
			var con_test = confirm("출발 카카오톡 발송 하시겠어요?");
			var param = '';
			if(con_test == true) param = 'temp_str=Y&temp_seq='+seq;
			else param = 'temp_str=N&temp_seq='+seq;
			wooliservice.ajaxclient('/start_move', param, _navi);
		}else{
			var param = '';
			param = 'temp_str=N&temp_seq='+seq;
			wooliservice.ajaxclient('/start_move', param, _navi);
		}
	}else{
		kakao_addr_detail = addr_detail;
		kakao_lat = lat;
		kakao_lng = lng;
		_navi_force();
	}
}

function updateOrderTime(seq){
	var yyyy = $('#yyyy_'+seq).val();
	var mm = $('#mm_'+seq).val();
	var dd = $('#dd_'+seq).val();
	var hhmm =$('#hhmm_'+seq).val();
	var dt = yyyy+'-'+mm+'-'+dd;
	
	var param = 'a_ordersDto.seq='+seq;
	var op = $('#time_option_'+seq).val();
	if(op == 'S'){ // 수거변경
		param+='&a_ordersDto.order_picupdate='+dt;		
		param+='&a_ordersDto.order_picuptime='+hhmm;
	}else{ // 배송변경
		param+='&a_ordersDto.order_deliverdate='+dt;
		param+='&a_ordersDto.order_delivertime='+hhmm;
	}
	if(hhmm != ''){
		wooliservice.ajaxclient('/admin/updateOrderTime', param, wooliservice.reload);
	}
}

function addHtmlRow(k,v){
	var s = "";
	if(k=='고객메모' || k=='관리자메모' || k=='비번리스트' || k=='고객특이사항') 
		s+='<div class="activity-item one-half-responsive" style="height:100px;">';
	else 
		s+='<div class="activity-item one-half-responsive">';
	s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
	s+='</div>'; 
	return s;
}

function addHtmlRowTextArea(k,v){
	var s = "";
	if(v.trim() != ''){
		s+='<div class="activity-item one-half-responsive" style="height: auto;">';
		//s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
		//s+='<textarea cols="50" rows="4">'+v+'</textarea>';
		s+='<p style="padding-top:10px;">'+v+'</p>'
		s+='</div>'; 
	}
	
	return s;
}

function addHtmlNoneRow(v){
	var s = "";
	s+='<div class="activity-item one-half-responsive">';
	s+='	<strong>'+v+'</strong>';
	s+='</div>'; 
	return s;
}

function addHtmlRowTwo(k,v){
	var s = "";
	s+='<div class="activity-item one-half-responsive" style="height:100px;">';
	s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
	s+='</div>'; 
	return s;
}

var temp_barcode;
function addHtmlRowBW(k,v,q,b){ // 부분 배송
	var s = "";
	if(k=='고객메모' || k=='관리자메모' || k=='비번리스트' || k=='고객특이사항') 
		s+='<div class="activity-item one-half-responsive '+b+'" style="height:100px;" onclick="bwBarcode('+q+','+b+');">';
	else 
		s+='<div class="activity-item one-half-responsive '+b+'" onclick="bwBarcode('+q+','+b+');">';
	s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
	s+='</div>'; 
	return s;
}

function addHtmlRowTwoBW(k,v,q,b){ // 부분 배송
	var s = "";
	s+='<div class="activity-item one-half-responsive '+b+'" style="height:100px;" onclick="bwBarcode('+q+','+b+');">';
	s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
	s+='</div>'; 
	return s;
}

function bwBarcode(q,b){
	wooliservice.ajaxclient('/admin/bwBarcode', 'temp_seq='+q+'&temp_str='+b, bwBarcode_success);	
}

function bwBarcode_success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){		
		var b = ob.a_barcode;
		var barcode = b.barcode;
		var item = b.item;
		var isout = b.isout;
		var price = Number(b.price);
		var memo = b.memo==undefined? "":b.memo;
		
		$('.'+barcode).html('<strong>'+barcode+' : </strong><strong>'+'['+item+']['+price+']['+memo+']'+'</strong>');
	}else{
		modal_pop_dark(ob.code,ob.message);
	}	
}

function addHtmlText(k,v){
	var s = "";
	s+='	<strong>'+k+' : </strong><strong>'+v+'</strong>';
	return s;
}

function order_detail_admin(page,ob){         
	var s='';
	var yyyy = wooliservice.getYYYY();
	var list_A_ordersDto = ob.list_A_ordersDto;
	
	s+='<a href="javascript:view_tag();" class="button button-orange button-center">View Change</a>';
	s+='<div id="map" style="width:100%;height:400px;display:none;"></div>';     
	for (var i = 0; i < list_A_ordersDto.length; i++) {
		var o = list_A_ordersDto[i];
		var listA_barcode = o.listA_barcode;
		var listA_fileDto = o.listA_fileDto;
		var member = o.member;
		var a_paper = o.a_paper;
		
		var door_pwds = o.door_pwds;
		
		var seq = o.seq;				
		var shop_phone = o.shop_phone;
		var order_what = o.order_what;
		var order_what_name = order_what=='N'? '':'<b style="color:red;">신발/수선</b>';
		var order_what_name = '';
		if(order_what == 'N') order_what_name = '세탁/드라이';
		if(order_what == 'Y') order_what_name = '<b style="color:red;">세탁/드라이 + 신발</b>';
		if(order_what == 'A') order_what_name = '<b style="color:red;">세탁/드라이 + 수선</b>';
		if(order_what == 'B') order_what_name = '<b style="color:red;">세탁/드라이 + 신발/수선</b>';
		var order_luxury = o.order_luxury;
		var order_picupdate = o.order_picupdate;
		var order_picupdate_dis = o.order_picupdate.substring(5);
		var order_deliverdate = o.order_deliverdate;
		var order_deliverdate_dis = o.order_deliverdate.substring(5);
		var order_picuptime = o.order_picuptime;
		var order_delivertime = o.order_delivertime;
		var order_door = o.order_door;      
		var order_paymethod = o.order_paymethod;
		var order_paycash = o.order_paycash;
		var order_paycoupon = o.order_paycoupon;
		var order_bed = o.order_bed;	
		var order_doorpwd = o.order_doorpwd==undefined? "":o.order_doorpwd;;		      
		var order_memo = o.order_memo==undefined? "":o.order_memo;
		var admin_memo = o.admin_memo==undefined? "":o.admin_memo;
		var order_iscash = o.order_iscash==undefined? "":o.order_iscash;
		var order_coupon_uuid = o.order_coupon_uuid==undefined? "":o.order_coupon_uuid;
		var client_phone = o.client_phone;
		var client_name = o.client_name==undefined? "":o.client_name;
		var client_name_amember = o.client_name_amember==undefined? "":o.client_name_amember;
		var client_addr_new = o.client_addr_new;
		var client_addr_old = o.client_addr_old;
		var client_addr_detail = o.client_addr_detail;
		var client_lat = o.client_lat;
		var client_lng = o.client_lng;
		var status_code = o.status_code;
		var status_code_name = o.status_code_name;   
		var sugo_cnt = o.sugo_cnt;
		var cancel_date = o.cancel_date;
		var sw_date = o.sw_date;
		var tag_date = o.tag_date;
		var complate_date = o.complate_date;
		var pay_date = o.pay_date;
		var pay_key = o.pay_key;
		var bw_date = o.bw_date;
		var file_uuid = o.file_uuid;
		var reg_date = o.reg_date;
		var distance = o.distance;
		var myjob_distance = o.myjob_distance==undefined? "":o.myjob_distance;
		var client_pri_memo = o.client_pri_memo==undefined? "":o.client_pri_memo;
		if(client_name == '') client_name = client_name_amember;
		
		// 중복 건수 확인 
		var lineColor = "gold";
		var t_Cnt = 0;
		for (var j = 0; j < list_A_ordersDto.length; j++) {
			var tOrder = list_A_ordersDto[j];
			var t_client_addr_old = tOrder.client_addr_old;
			if(t_client_addr_old == client_addr_old) t_Cnt++;
		}
		if(t_Cnt == 2) lineColor = 'blue';
		if(t_Cnt == 3) lineColor = 'red';
		if(t_Cnt == 4) lineColor = 'black';
		if(t_Cnt == 5) lineColor = 'yellow';
		
		s+='<div class="content material-full-top full-top admin" style="border: 5px solid '+lineColor+';">';
		s+='    <div class="activity-page">';
		s+='<div class="activity-item one-half-responsive add_myjob">';
		s+='    <input type="hidden" value="'+seq+'" class="admin_orderseq">';
		var arr_addr = client_addr_old.split(' ');
		var re_addr_old = arr_addr[arr_addr.length-2] +' '+arr_addr[arr_addr.length-1];
		
		// [수거][태그][출고]
		var sto = ' ['+sugo_cnt+']['+get_real_barcode_cnt(listA_barcode)+']['+get_real_barcode_out_cnt(listA_barcode)+']';
		if(status_code == 'SD' || status_code == 'SDW' || status_code == 'SW'){
			s+='    	<strong>'+addHtmlText('['+seq+'] 수거',order_picupdate_dis +' ['+wooliservice.weekOfDayKor(order_picupdate)+']'+' ' +order_picuptime+' / '+re_addr_old)+' '+sto+'</strong>';
		}else if(status_code == 'CX' || status_code == 'SX'){
			s+='    	<strong>'+addHtmlText('['+seq+'] 취소',order_picupdate_dis +' ['+wooliservice.weekOfDayKor(order_picupdate)+']'+' ' +order_picuptime+' / '+re_addr_old)+' '+sto+'</strong>';
		}else{
			s+='    	<strong>'+addHtmlText('['+seq+'] 배송',order_deliverdate_dis +' ['+wooliservice.weekOfDayKor(order_deliverdate)+']'+' ' +order_delivertime+' / '+re_addr_old)+' '+sto+'</strong>';
		}	
		s+='</div>';
		
		// myjob 거리 표시 (언제나 배송)
		if(page == 'myjob' && myjob_distance != ''){
			s+='<div class="activity-item one-half-responsive">';
			s+='	<strong>'+myjob_distance+'</strong>';
			s+='</div>';
		}
		
		s+='<div class="menu-tab-bar light-tab-bar menu-tab-bar-five">';
		s+='    <a href="javascript:show_detail('+seq+');">상세</a>';
		s+='    <a href="javascript:show_pay('+seq+');">결제</a>';
		s+='    <a href="javascript:show_update('+seq+');">수정</a>';
		s+='    <a href="javascript:show_img('+seq+');">사진</a>';
		s+='    <a href="javascript:close_show('+seq+');">닫기</a>';
		s+='</div>';
		
		s+='<div class="dropdown-menu">';
		s+='    <div class="dropdown-content" id="'+seq+'_detail">'; 

		var main_info = '';
		if(order_door == 'Y') main_info+='[비대면 수거(천원할인)]';
		else main_info+='[대면 수거]';
		
		//if(order_paymethod == 'APP') main_info+='[앱 카드/무통장 입금]';
		//else main_info+='[<b style=\'color:red;\'>[배송시 카드/현금]</b>]';
		
		// 상태표시
		var status_display_text = '';
		status_display_text+=getstatename_patch_admin(status_code,order_paymethod);
		//status_display_text+=' ['+sugo_cnt+']['+get_real_barcode_cnt(listA_barcode)+']['+get_real_barcode_out_cnt(listA_barcode)+']';
		
		// 결제 상태 표시
		if(o.a_paymentDto != undefined){
			var lgd_paytype = o.a_paymentDto.lgd_paytype;
			var reg_date = o.a_paymentDto.reg_date;
			status_display_text+='['+paymentName(lgd_paytype)+']['+reg_date+']';
		}
		
		s+=addHtmlNoneRow(status_display_text);
		
		if(order_what_name != '') main_info+='['+order_what_name+']';
		s+=addHtmlNoneRow(main_info);
		
		if(order_paymethod == 'APP') s+=addHtmlRow('배송방식','비대면 배송(천원할인)');
		else s+=addHtmlRow('배송방식','<b style="color:red;">대면 (만남배송)</b>');
		
		//수거 : 01-23 [목] 13-15
		if(status_code == 'SD' || status_code == 'SDW' || status_code == 'SW') s+=addHtmlRow('수거','<b style="color:blue;">'+order_picupdate +' ['+wooliservice.weekOfDayKor(order_picupdate)+']'+ ' ' +order_picuptime+'</b>');
		else s+=addHtmlRow('수거',order_picupdate +' ['+wooliservice.weekOfDayKor(order_picupdate)+']'+' ' +order_picuptime);
		if(status_code == 'LW'|| status_code == 'BDW' || status_code == 'BW' || status_code == 'TW' || status_code == 'PD' || status_code == 'PW') s+=addHtmlRow('배송','<b style="color:blue;">'+order_deliverdate +' ['+wooliservice.weekOfDayKor(order_deliverdate)+']'+ ' ' +order_delivertime+'</b>');
		else s+=addHtmlRow('배송',order_deliverdate +' ['+wooliservice.weekOfDayKor(order_deliverdate)+']'+' ' +order_delivertime);
		
		//황진석 [ 3 / 153,450 ] 01068806380
		if(member != undefined){
			var orderCnt = Number(member.old_order_cnt) + Number(member.new_order_cnt);
			var orderTotal = Number(member.old_order_sum) + Number(member.new_order_sum);
			s+=addHtmlNoneRow(client_name+'['+member.grade+']['+member.cash+']['+orderCnt+']['+orderTotal+']');
		}else{
			s+=addHtmlNoneRow(client_name+'[비회원]');
		}
		
		//강남대로 238 / 도곡동 953-11 
		s+=addHtmlNoneRow('<a href="javascript:navi(\''+client_addr_new+'\',\''+client_lat+'\',\''+client_lng+'\','+seq+',\''+status_code+'\');">'+client_addr_new+'</a>');
		s+=addHtmlNoneRow('<a href="javascript:navi(\''+client_addr_old+'\',\''+client_lat+'\',\''+client_lng+'\','+seq+',\''+status_code+'\');">'+client_addr_old+'</a>');
		s+=addHtmlNoneRow(client_addr_detail);
		
		if(client_pri_memo.trim() != '') s+=addHtmlRow('고객특이사항','<b style="color:green;">'+client_pri_memo+'</b>');
		if(order_doorpwd.trim() != '') s+=addHtmlRow('사용자 주문 비번','<b style="color:blue;">'+order_doorpwd+'</b>');
		if(door_pwds != undefined){
			var tempS = '';
			for (var k = 0; k < door_pwds.length; k++) {
				tempS+='['+'<b>'+door_pwds[k]+'</b>'+']'
			}
			s+=addHtmlRow('비번리스트',tempS);
		}
		
		s+=addHtmlRow('전화번호','<a href="tel:'+client_phone+'">'+client_phone+'</a>');
		if(order_iscash == 'Y') s+=addHtmlRow('적립금사용','사용함');
		if(order_coupon_uuid != '') s+=addHtmlRow('쿠폰사용','사용함');
		if(order_memo.trim() != '') s+=addHtmlRowTextArea('고객메모','고객메모 : <b style="color:blue;">'+order_memo+'</b>');
		if(admin_memo.trim() != '') s+=addHtmlRowTextArea('관리자메모','관리자메모 : <b style="color:blue;">'+admin_memo+'</b>');
		if(page == 'main') s+='		<a href="javascript:addJob('+seq+');" class="button button-wooli button-center">MY JOB 등록</a>';
		if(page == 'myjob') s+='	<a href="javascript:deleteJob('+seq+');" class="button button-light button-center">MY JOB 삭제</a>';
		
		if(status_code == 'SD' || status_code =='SDW' || status_code =='SW'){
			s+='		<a href="javascript:cancelSx('+seq+');" class="button button-red button-center">주문 취소</a>';
		}		
		if(status_code =='TW'){
			s+='		<a href="javascript:sendMoney('+seq+');" class="button button-wooli button-center">계산서 발송</a>';
			s+='		<a href="javascript:realPay('+seq+');" class="button button-dark button-center">현장결제대기</a>';
		}else if(status_code == 'LW'){
			s+='		<a href="javascript:sendMoney('+seq+');" class="button button-wooli button-center">계산서 발송</a>';
		}else if(status_code == 'BDW'){
			s+='		<a href="javascript:sendMoney('+seq+');" class="button button-wooli button-center">계산서 발송</a>';
		}
			
		if(page == 'swbw'){
			if(status_code == 'SW')
				s+='		<a href="javascript:backProcess('+seq+',\'SDW\');" class="button button-wooli button-center">전단계이동</a>';
			else 
				s+='		<a href="javascript:backProcess('+seq+',\'BDW\');" class="button button-wooli button-center">전단계이동</a>';
		}
		
		s+='    </div>';
		s+='</div>';
		
		if(status_code == 'SD' || status_code == 'SDW' || status_code == 'SW')
			s+='<div style="display:none;" class="map_info" seq="'+seq+'" shop_phone="'+shop_phone+'" client_lat="'+client_lat+'" client_lng="'+client_lng+'" client_name="'+client_name+'" time="'+order_picuptime+'" status_code="'+status_code.substring(0,1)+'"></div>'; // 위치정보
		else
			s+='<div style="display:none;" class="map_info" seq="'+seq+'" shop_phone="'+shop_phone+'" client_lat="'+client_lat+'" client_lng="'+client_lng+'" client_name="'+client_name+'" time="'+order_delivertime+'" status_code="'+status_code.substring(0,1)+'"></div>'; // 위치정보
		
		if(page == 'myjob' && status_code == 'SDW'){
			s+='<div class="dropdown-menu">';
			s+='    <a href="#" class="dropdown-item dropdown-toggle bg-night-dark">';
			s+='    	<em>수거처리</em><i class="ion-android-add"></i>';
			s+='    </a>';
			s+='    <div class="dropdown-content" style="display: none;">';
			s+='		<div class="select-box">';
			s+='    		<select id="cnt_'+seq+'">';
			s+='				<option value="0">수거개수</option>';
			for (var k = 1; k < 100; k++) {
				s+='			<option value="'+k+'">'+k+'</option>';
			}
		    s+='     		</select>';
		    s+=' 		</div>';
		    s+='		<div class="select-box">';
			s+='    		<select id="bag1_'+seq+'">';
			s+='				<option value="0">가방1</option>';
			for (var k = 1; k < 150; k++) {
				s+='			<option value="'+k+'">'+k+'</option>';
			}
		    s+='     		</select>';
		    s+=' 		</div>';
		    s+='		<div class="select-box">';
			s+='    		<select id="bag2_'+seq+'">';
			s+='				<option value="0">가방2</option>';
			for (var k = 1; k < 150; k++) {
				s+='			<option value="'+k+'">'+k+'</option>';
			}
		    s+='     		</select>'; 
		    s+=' 		</div>';
		    s+='		<input type="file" accept="image/*" id="file_'+seq+'" onchange="fileUploadAdmin('+seq+')" file_uuid="'+file_uuid+'" filetype="sw" style="height:50px;">';  
			s+='		<a href="javascript:sw_complate('+seq+');" class="button button-wooli button-center">수거완료</a>'; 
			s+='	</div>';
			s+='</div>';
		}
		if(page == 'myjob' && status_code == 'BDW'){
			s+='<div class="dropdown-menu">';
			s+='    <a href="#" class="dropdown-item dropdown-toggle bg-night-dark">';
			s+='    	<em>베송처리</em><i class="ion-android-add"></i>';
			s+='    </a>';
			s+='    <div class="dropdown-content" style="display: none;">';
			if(order_paymethod == 'APP')
				s+='		<input type="file" accept="image/*" id="file_'+seq+'" onchange="fileUploadAdmin('+seq+')" file_uuid="'+file_uuid+'" filetype="bw" style="height:50px;">';  
			
			if(order_paymethod == 'APP'){
				s+='		<a href="javascript:order_complate('+seq+');" class="button button-wooli button-center">배송완료</a>'; 
			}else if(order_paymethod == 'RP'){
				// 현장결제
				s+='		<a href="javascript:order_pay_complate_card('+seq+');" class="button button-teal button-center">현장카드결제</a>';
				s+='		<a href="javascript:order_pay_complate_cash('+seq+');" class="button button-magenta button-center">현장현금결제</a>';
			} 
			s+='	</div>';
			s+='</div>';
		}
		
		var arr_addr = client_addr_old.split(' ');
		var re_addr_old = arr_addr[arr_addr.length-2] +' '+arr_addr[arr_addr.length-1];
		
		s+='<div class="dropdown-menu">';
		s+='    <div class="dropdown-content payment" id="'+seq+'_pay">';
		if(listA_barcode.length>0){
			var total = 0;
			for (var j = 0; j < listA_barcode.length; j++) {
				var b = listA_barcode[j];
			
				var q = b.order_seq;
				var barcode = b.barcode;
				var item = b.item;
				var isout = b.isout;
				var item_ori = b.item_ori;
				var size = b.size==undefined? "":b.size;
				var luxury = b.luxury==undefined? "":b.luxury;
				var extra = b.extra==undefined? "":b.extra;
				var price_ori = b.price_ori;
				var price_size = b.price_size;
				var price_luxury = b.price_luxury;
				var price_extra = b.price_extra;
				var price = Number(b.price);
				var memo = b.memo==undefined? "":b.memo;
				total+=price;
				
				// 할인이면 이름을 Key 말고 아이템에서 
				if(barcode == 'CP') item_ori = item;
					
				var remark_price = ''; 
				if(isout == 'Y'){
					if(barcode.length > 6) barcode = barcode.substring(0,barcode.length-1);
					remark_price+=barcode;
					remark_price+='['+item_ori+']';
					if(size != '') remark_price+='['+size+']';
					if(luxury != '') remark_price+='['+luxury+']';
					if(extra != '') remark_price+='['+extra+']';
					remark_price+='['+price+']';
					
					s+='<div class="invoice-item">';
					s+='    <h1>'+remark_price+'</h1>';
					if(memo != '') s+='	<h2>'+memo+'</h2>';
					s+='</div>';	 
				}else{
					if(barcode.length > 6) barcode = barcode.substring(0,barcode.length-1);
					remark_price+=barcode;
					remark_price+='['+item_ori+']';
					if(size != '') remark_price+='['+size+']';
					if(luxury != '') remark_price+='['+luxury+']';
					if(extra != '') remark_price+='['+extra+']';
					remark_price+='['+price+']';
					
					s+='<div class="invoice-item">';
					s+='    <h1><b style="color:red;">'+remark_price+'</b></h1>';
					if(memo != '') s+='	<h2>'+memo+'</h2>';
					s+='</div>';	
				}				
			}
			s+='<div class="invoice-total">';
			s+='    <h3>결제금액</h3>';
			s+='    <h4 class="color-green-dark">'+wooliservice.comma(total)+'</h4>';
			s+='</div>';
		}

		s+='    </div>';
		s+='</div>';
		
		s+='<div class="dropdown-menu">';
		s+='    <div class="dropdown-content" id="'+seq+'_update">';
		// 수거 배송 
		s+='		<input type="text" id="admin_memo_'+seq+'" class="input-text-box input-red-border" value="'+admin_memo+'" placeholder="관리자메모">';
		s+='		<input type="text" id="client_pri_memo_'+seq+'" class="input-text-box input-red-border" value="'+client_pri_memo+'" placeholder="고객특이사항">';
		s+='		<a href="javascript:updateOrderMemo('+seq+');" class="button button-dark button-center">메모수정</a>';
		s+='		<div class="select-box" style="margin-bottom:0px;">';
        s+='    		<select id="time_option_'+seq+'" class="optionzone" datakey="'+seq+'">';
        s+='				<option value="S">수거시간</option>';
        s+='				<option value="B">배송시간</option>';
        s+='    		</select>';
        s+='		</div>';
        s+='		<div class="select-box" style="margin-bottom:0px;">';
        s+='    		<select id="yyyy_'+seq+'" class="datezone">';
        s+='				<option value="'+yyyy+'">'+yyyy+'</option>';
        s+='    		</select>';
        s+='		</div>';
        s+='		<div class="select-box" style="margin-bottom:0px;">';
        s+='    		<select id="mm_'+seq+'" class="datezone">';
        for (var j = 1; j < 13; j++) {
        	if(j<10)
        		s+='        <option value="0'+j+'">0'+j+'</option>';
        	else
        		s+='        <option value="'+j+'">'+j+'</option>';
		}
        s+='    		</select>';
        s+='		</div>';
        s+='		<div class="select-box" style="margin-bottom:0px;">';
        s+='    		<select id="dd_'+seq+'" class="datezone">';
        for (var j = 1; j < 32; j++) {
        	if(j<10)
        		s+='        <option value="0'+j+'">0'+j+'</option>';
        	else
        		s+='        <option value="'+j+'">'+j+'</option>';
		}
        s+='    		</select>';
        s+='		</div>';
        s+='		<div class="select-box" style="margin-bottom:0px;">';
        s+='    		<select id="hhmm_'+seq+'" class="timezone">';
        var list_A_shop_optionDto = o.list_A_shop_optionDto;
        for (var j = 0; j < list_A_shop_optionDto.length; j++) {
        	var option = list_A_shop_optionDto[j];
        	var code = option.code;
        	s+='<option value="'+code+'">'+code+'</option>';
		}
        s+='    		</select>';
        s+='		</div>';
		s+='		<a href="javascript:updateOrderTime('+seq+');" class="button button-wooli button-center">주문수정</a>'; 
		s+='	</div>';
		s+='</div>';
		
		if(page == 'myjob'){
			s+='<div class="dropdown-menu">';
			s+='    <a href="#" class="dropdown-item dropdown-toggle bg-orange-dark">';
			s+='    	<em>잡보내기</em><i class="ion-android-add"></i>';
			s+='    </a>';
			s+='    <div class="dropdown-content" style="display: none;">';
			var list_A_employeeDto = ob.list_A_employeeDto;
			for (var j = 0; j < list_A_employeeDto.length; j++) {
				var em = list_A_employeeDto[j];
				if($.parseJSON(JsonMember).phone != em.phone) 
					s+='    <a href="javascript:_pushJob('+seq+',\''+em.phone+'\');" class="icon icon-ghost tumblr-color tumblr-bg">'+em.name+'</a>';
			}
			s+='	</div>';
			s+='</div>';
		}
		
		s+='<div class="dropdown-menu">';
		s+='    <div class="dropdown-content"  id="'+seq+'_img">';
		
		for (var j = 0; j < listA_fileDto.length; j++) {
			var f = listA_fileDto[j];
			var fileName = f.fileName;
			s+='<img src="/resources/web/img/no.jpg" style="width:100%;" realdata="/resources/files/'+fileName+'">';
		}
		s+='	</div>';
		s+='</div>';
		
		s+='    </div>';
		s+='</div>';	
	}
	
	s+='		<a href="javascript:logout();" class="button button-yellow button-center">로그아웃</a>';
	
	// 이미지 업로드 히든 필드
	s+='<div class="btn_wrap" id="imgDiv_test1" style="display: none;">';
    s+='	<span class="txt" align="center"><img id="img_test1" style="width: 97%;" /></span> &nbsp;<br>';
    s+='</div>';
    
	$('#list').html(s);
	
	for (var i = 0; i < list_A_ordersDto.length; i++) {
		var o = list_A_ordersDto[i];
		var listA_barcode = o.listA_barcode;		
		
		var seq = o.seq;
		var shop_phone = o.shop_phone;
		var order_what = o.order_what;
		var order_what_name = order_what=='N'? '일반':'<b style="color:red;">신발</b>'; 
		var order_luxury = o.order_luxury;
		var order_picupdate = o.order_picupdate;
		var order_deliverdate = o.order_deliverdate;
		var order_picuptime = o.order_picuptime;
		var order_delivertime = o.order_delivertime;
		var order_door = o.order_door;      
		var order_paymethod = o.order_paymethod;
		var order_paycash = o.order_paycash;
		var order_paycoupon = o.order_paycoupon;
		var order_bed = o.order_bed;	
		var order_doorpwd = o.order_doorpwd;		      
		var order_memo = o.order_memo;
		var admin_memo = o.admin_memo==undefined? "":o.admin_memo;
		var client_phone = o.client_phone;
		var client_name = o.client_name;
		var client_addr_new = o.client_addr_new;
		var client_addr_old = o.client_addr_old;
		var client_addr_detail = o.client_addr_detail;
		var client_lat = o.client_lat;
		var client_lng = o.client_lng;
		var status_code = o.status_code;
		var status_code_name = o.status_code_name;   
		var cancel_date = o.cancel_date;
		var sw_date = o.sw_date;
		var tag_date = o.tag_date;
		var complate_date = o.complate_date;
		var pay_date = o.pay_date;
		var pay_key = o.pay_key;
		var bw_date = o.bw_date;
		var file_uuid = o.file_uuid;
		var reg_date = o.reg_date;
		var distance = o.distance;
		
		// 주문 수정 이벤트
		if(status_code == 'SD' || status_code == 'SDW'){
			$('#time_option_'+seq).val('S');
			$('#yyyy_'+seq).val(wooliservice.getYYYYBeta(order_picupdate));
			$('#mm_'+seq).val(wooliservice.getMMBeta(order_picupdate));
			$('#dd_'+seq).val(wooliservice.getDDBeta(order_picupdate));
			$('#hhmm_'+seq).val(order_picuptime);
		}else{
			$('#time_option_'+seq).val('B');
			$('#yyyy_'+seq).val(wooliservice.getYYYYBeta(order_deliverdate));
			$('#mm_'+seq).val(wooliservice.getMMBeta(order_deliverdate));
			$('#dd_'+seq).val(wooliservice.getDDBeta(order_deliverdate));
			$('#hhmm_'+seq).val(order_delivertime);
		}
	}
	
	// 날짜변경에 근무 시간
	$('.datezone').change(function(){
		var year = $(this).parent().parent().find('.datezone').eq(0).val();
		var month = $(this).parent().parent().find('.datezone').eq(1).val();
		var day = $(this).parent().parent().find('.datezone').eq(2).val();
		var optionzone = $(this).parent().parent().find('.optionzone').eq(0).val();
		var date = year+'-'+month+'-'+day;
		datakey = $(this).parent().parent().find('.optionzone').eq(0).attr('datakey');
		
		wooliservice.ajaxclient('/admin/select_time', 'a_shop_optionDto.cdmaster_code='+wooliservice.getCodeWorkLabel(date), select_time_success);
	});
}

var datakey = "";
function select_time_success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){		
		var list_A_shop_optionDto = ob.list_A_shop_optionDto;
		for (var i = 0; i < list_A_shop_optionDto.length; i++) {
			var o = list_A_shop_optionDto[i];
			var code = o.code;
			s+='<option value="'+code+'">'+code+'</option>';
		}
		$("#hhmm_"+datakey).html(s);
	}else{
		modal_pop_dark(ob.code,ob.message);
	}
}

function fileUploadAdmin(seq){
	$('#img_test1').attr('src', URL.createObjectURL($('#file_'+seq)[0].files[0]));
	resizingImage('file_'+seq);
}

function fileUploadAdmin_Excute(fileid){ 
	var formData = new FormData();			
	formData.append('file_uuid',$('#'+fileid).attr('file_uuid'));
	formData.append('type',$('#'+fileid).attr('filetype'));
	formData.append('file',$('#'+fileid)[0].files[0]);			
	wooliservice.fileUploadUI('/superadmin/fileUpload', formData, fileUpload_Success);
}

function fileUpload_Success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){		
		console.log('upload success');
	}else{ 
		modal_pop_dark(ob.code,ob.message);
	}	
}

function cancelSx(seq){
	var con_test = confirm("주문 취소 하시겠어요?");
	if(con_test == true){
		var param = '';
		param+='a_ordersDto.seq='+seq;
		param+='&a_ordersDto.status_code=SX';
		wooliservice.ajaxclient('/admin/chgOrder', param, wooliservice.reload);
	}
}

var cancelSeq;
function cancelCx(seq){
	cancelSeq = seq;
	attention_pop('주문취소', "주문 취소 하시겠어요?", 'cancelCxExcute');	
}

function cancelCxExcute(){
	var param = '';
	param+='a_ordersDto.seq='+cancelSeq;
	wooliservice.ajaxclient('/mobile/order_cancel', param, order_cancel_success);
}

function order_cancel_success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){
		if(!isKakao){
			window.location='/mobile/?page_name=pages/main.jsp';
		}else {
			modal_pop_dark('알림','정상 주문 취소 되었습니다. 애용해 주셔서 감사합니다.');
		}
	}else{
		modal_pop_dark(ob.code,ob.message);
	}
}

//KAKAO 
var isKakao = false;
if(navigator.userAgent.indexOf("KAKAO")!= -1) isKakao = true;
if(navigator.userAgent.indexOf("kakao")!= -1) isKakao = true;
if(navigator.userAgent.indexOf("Kakao")!= -1) isKakao = true;

// 사용자 상세
function order_detail_client(page,ob){
	// OBJECT
	var o = ob.a_ordersDto;
	var listA_barcode = o.listA_barcode;
	var listA_fileDto = o.listA_fileDto;
	var s = '';
	
	// VALUE
	var seq = o.seq;				
	var shop_phone = o.shop_phone;
	var order_what = o.order_what;
	var order_what_name = '';
	if(order_what == 'N') order_what_name = '세탁/드라이';
	if(order_what == 'Y') order_what_name = '세탁/드라이 + 신발';
	if(order_what == 'A') order_what_name = '세탁/드라이 + 수선';
	if(order_what == 'B') order_what_name = '세탁/드라이 + 신발/수선'; 
	var order_luxury = o.order_luxury;
	var order_picupdate = o.order_picupdate;
	var order_deliverdate = o.order_deliverdate;
	var order_picuptime = o.order_picuptime;
	var order_delivertime = o.order_delivertime;
	var order_door = o.order_door;      
	var order_paymethod = o.order_paymethod;
	var order_paycash = o.order_paycash;
	var order_paycoupon = o.order_paycoupon;
	var order_bed = o.order_bed;	
	var order_doorpwd = o.order_doorpwd;		      
	var order_memo = o.order_memo==undefined? "":o.order_memo;
	var admin_memo = o.admin_memo==undefined? "":o.admin_memo;
	var order_iscash = o.order_iscash==undefined? "":o.order_iscash;
	var order_coupon_uuid = o.order_coupon_uuid==undefined? "":o.order_coupon_uuid;
	var client_phone = o.client_phone;
	var client_name = o.client_name;
	var client_addr_new = o.client_addr_new;
	var client_addr_old = o.client_addr_old;
	var client_addr_detail = o.client_addr_detail;
	var client_lat = o.client_lat;
	var client_lng = o.client_lng;
	var status_code = o.status_code;
	var status_code_name = o.status_code_name;   
	var cancel_date = o.cancel_date;
	var sw_date = o.sw_date;
	var tag_date = o.tag_date;
	var complate_date = o.complate_date;
	var pay_date = o.pay_date;
	var pay_key = o.pay_key;
	var bw_date = o.bw_date;
	var file_uuid = o.file_uuid;
	var reg_date = o.reg_date;
	var distance = o.distance;
	var sdw_employee_phone = o.sdw_employee_phone;			
	var bdw_employee_phone = o.bdw_employee_phone;
	
	// 프로그래스바
	var process_cnt = 0; 
	if(status_code == 'SD') process_cnt = 1;		
	if(status_code == 'SDW') process_cnt = 2;
	if(status_code == 'SW') process_cnt = 3;
	if(status_code == 'TW') process_cnt = 4;
	if(status_code == 'PW') process_cnt = 7;
	if(status_code == 'LW') process_cnt = 8;
	if(status_code == 'BDW') process_cnt = 9;
	if(status_code == 'BW') process_cnt = 10;
	for (var i = 0; i < process_cnt; i++) { 
		$('.decoration-lines.decoration-margins').append('<div class="deco-2"></div>');
	}
	$('#'+status_code).addClass('on');
	
	// 상세 디테일
	if(status_code == 'SDW' || status_code == 'BDW') s+='<div id="map" style="width:100%;height:400px;"></div>';	
	s+='<div class="content material-full-top full-top">';
	s+='    <div class="activity-page">';  
	
	s+='<div class="dropdown-menu">';
	s+='    <a href="#" class="dropdown-item dropdown-toggle bg-blue-dark">';
	s+='    	<i class="icon ion-information"></i>';
	s+='    	<em>주문 정보</em><i class="ion-android-add"></i>';
	s+='    </a>';
	s+='    <div class="dropdown-content" style="display: block;">';
	s+=addHtmlRow('주문번호',seq);
	s+=addHtmlRow('세탁물 종류',order_what_name);
	s+=addHtmlRow('현재상태',getstatename_patch(status_code, order_paymethod));
	if(order_door == 'Y') s+=addHtmlRow('수거방법','비대면 수거(천원할인)');
	else s+=addHtmlRow('수거방법','<b style="color:red;">대면 수거</b>');
	if(order_paymethod == 'APP') s+=addHtmlRow('배송방법','<b style="color:blue;">비대면 배송(천원할인)</b>');
	else s+=addHtmlRow('배송방법','대면 배송');
	s+=addHtmlRow('비번',order_doorpwd);
	if(order_paymethod == 'APP') s+=addHtmlRow('결제방식','앱카드,무통장');
	else s+=addHtmlRow('결제방식','앱카드,무통장');
	if(status_code == 'SD' || status_code == 'SDW' || status_code == 'SW') s+=addHtmlRow('수거일시','<b style="color:blue;">'+order_picupdate +'['+wooliservice.weekOfDayKor(order_picupdate)+']'+ ' ' +order_picuptime+'</b>');
	else s+=addHtmlRow('수거일시',order_picupdate +'['+wooliservice.weekOfDayKor(order_picupdate)+']'+' ' +order_picuptime);
	
	if(order_delivertime == '00-24') order_delivertime = "언제나 비대면 배송(천원할인)";
	if(status_code == 'LW'|| status_code == 'BDW' || status_code == 'BW' || status_code == 'TW' || status_code == 'PD' || status_code == 'PW'){
		s+=addHtmlRow('배송일시','<b style="color:blue;">'+order_deliverdate +'['+wooliservice.weekOfDayKor(order_deliverdate)+']'+ ' ' +order_delivertime+'</b>');
	}else{
		s+=addHtmlRow('배송일시',order_deliverdate +'['+wooliservice.weekOfDayKor(order_deliverdate)+']'+' ' +order_delivertime);
	} 
	
	s+=addHtmlRow('신 주소',client_addr_new);
	s+=addHtmlRow('구 주소',client_addr_old);
	s+=addHtmlRow('상세주소',client_addr_detail);
	s+=addHtmlRow('고객이름',client_name);
	s+=addHtmlRow('전화번호',client_phone);
	if(order_iscash == 'Y') s+=addHtmlRow('적립금사용','사용함');
	if(order_coupon_uuid != '') s+=addHtmlRow('쿠폰사용','사용함');
	//s+=addHtmlRow('고객메모','<b style="color:blue;">'+order_memo+'</b>');
	s+=addHtmlRowTextArea('고객메모',order_memo);
	
	var txt_card = '앱 카드결제';
	var txt_bank = '앱 계좌이체';
	var txt_cash = '무통장 입금';
	
	//if(order_paymethod == 'RP') txt_card += '(-1,000할인)';
	//if(order_paymethod == 'RP') txt_bank += '(-1,000할인)';
	//if(order_paymethod == 'RP') txt_cash += '(-1,000할인)';
	if(isKakao){
		if(status_code == 'SD'){
			s+='		<a href="javascript:cancelCx('+seq+');" class="button button-red button-center">주문 취소</a>';
			s+='		<a href="javascript:window.location=\'/openApp.jsp?type=payment\';" class="button button-wooli button-center">주문 변경</a>';
		}
		if(status_code == 'TW' || (status_code == 'LW' && order_paymethod == 'RP')){
			s+='<div class="pay_area">';
			s+='	<a href="javascript:window.location=\'/openApp.jsp?type=payment\';" class="button button-pay button-center" style="width: 100%;">'+txt_card+'</a>';	
		    s+='	<a href="javascript:window.location=\'/openApp.jsp?type=payment\';" class="button button-pay button-center" style="width: 100%;">'+txt_bank+'</a>';
		    s+='	<a href="javascript:sendBank('+seq+');" class="button button-pay button-center" style="width: 100%;">'+txt_cash+'</a>';
		    s+='</div>';
		    if(wooliservice.nowyyyy_mm_dd() == order_picupdate) s+='<a href="javascript:window.location=\'/openApp.jsp?type=payment\';" class="button button-wooli button-center">배송시간 변경</a>';
		}
		if(status_code == 'PW'){
			if(wooliservice.nowyyyy_mm_dd() == order_picupdate) s+='<a href="javascript:window.location=\'/openApp.jsp?type=payment\';" class="button button-wooli button-center">배송시간 변경</a>';
		}
	}else{
		if(status_code == 'SD'){
			s+='		<a href="javascript:cancelCx('+seq+');" class="button button-red button-center">주문 취소</a>';
			s+='		<a href="javascript:order_chg('+seq+');" class="button button-wooli button-center">주문 변경</a>';
		}
		if(status_code == 'TW' || (status_code == 'LW' && order_paymethod == 'RP')){
			s+='<div class="pay_area">';
			s+='	<a href="javascript:payment('+seq+');" class="button button-pay button-center" style="width: 100%;">'+txt_card+'</a>';	
		    s+='	<a href="javascript:paymentBank('+seq+');" class="button button-pay button-center" style="width: 100%;">'+txt_bank+'</a>';
		    s+='	<a href="javascript:sendBank('+seq+');" class="button button-pay button-center" style="width: 100%;">'+txt_cash+'</a>';
		    s+='</div>';
		    if(wooliservice.nowyyyy_mm_dd() == order_picupdate) s+='<a href="javascript:order_chg('+seq+');" class="button button-wooli button-center">배송시간 변경</a>';
		}
		if(status_code == 'PW'){
			if(wooliservice.nowyyyy_mm_dd() == order_picupdate) s+='<a href="javascript:order_chg('+seq+');" class="button button-wooli button-center">배송시간 변경</a>';
		}
	}
	
	s+='    </div>';
	s+='</div>';
	
	s+='<div class="dropdown-menu">';
	s+='    <a href="#" class="dropdown-item dropdown-toggle bg-magenta-dark">';
	s+='    	<i class="icon ion-star"></i>';
	s+='    	<em>세탁물 정보</em><i class="ion-android-add"></i>';
	s+='    </a>';
	s+='    <div class="dropdown-content" style="display: block;">';
	var total = 0;
	var isSubTotal = false;
	if(status_code != 'SW'){ // 수거완료 일때 입금 방지
		if(listA_barcode.length>0){
			for (var j = 0; j < listA_barcode.length; j++) {
				var b = listA_barcode[j];
			
				var q = b.order_seq;
				var barcode = b.barcode;
				var item = b.item;
				var isout = b.isout;
				var item_ori = b.item_ori;
				var size = b.size==undefined? "":b.size;
				var luxury = b.luxury==undefined? "":b.luxury;
				var extra = b.extra==undefined? "":b.extra;
				var price_ori = b.price_ori;
				var price_size = b.price_size;
				var price_luxury = b.price_luxury;
				var price_extra = b.price_extra;
				var price = Number(b.price);
				var memo = b.memo==undefined? "":b.memo;
				
				if(barcode == 'CP') item_ori = item; 
				
				if(price < 0 && !isSubTotal){
					isSubTotal = true;
					s+='<div class="invoice-total">';
					s+='    <h1 class="color-blue-dark">주문금액</h1>';
					s+='    <h2 class="color-blue-dark">'+wooliservice.comma(total)+'</h2>';
					s+='</div>'; 
				}
				
				total+=price;
				
				if(price < 0){
					s+='<div class="invoice-total">';
					s+='    <h1 class="color-orange-dark">'+item_ori+'</h1>';
					s+='    <h2 class="color-orange-dark">'+wooliservice.comma(price)+'</h2>';
					s+='</div>';
				}else{
					s+='<div class="invoice-item">';
					s+='    <h1>'+item+'</h1>';
					s+='	<h2>번호 : '+barcode+'</h2>';
					s+='	<h2>'+item_ori+' : '+price_ori+'</h2>';
					if(size != '') s+='	<h2>'+size+' : '+price_size+'</h2>';
					if(luxury != '') s+='	<h2>'+luxury+' : '+price_luxury+'</h2>';
					if(extra != '') s+='	<h2>'+extra+' : '+price_extra+'</h2>';
					if(memo != '') s+='	<h2>'+memo+'</h2>';
					s+='    <h3>'+price+'</h3>'; 
					s+='</div>';
				}
			}
			s+='<div class="invoice-total">';
			s+='    <h3>결제금액</h3>';
			s+='    <h4 class="color-green-dark">'+wooliservice.comma(total)+'</h4>';
			s+='</div>';
			s+='<div class="decoration decoration-margins"></div>';
			
		}
	}
	
	s+='    </div>';
	s+='</div>';
	
	s+='<div class="dropdown-menu">';
	s+='    <a href="#" class="dropdown-item dropdown-toggle bg-night-dark">';
	s+='    	<i class="icon ion-image"></i>';
	s+='    	<em>사진 정보</em><i class="ion-android-add"></i>';
	s+='    </a>';
	s+='    <div class="dropdown-content" style="display: block;">';
	var listA_fileDto = o.listA_fileDto;
	for (var j = 0; j < listA_fileDto.length; j++) {
		var f = listA_fileDto[j];
		var fileName = f.fileName;
		var iidx = listA_fileDto.length-1;
		
		if(j == iidx) s+='';
		else s+='<img src="/resources/files/thum_'+fileName+'" style="width:100%;">';
	}          
	s+='	</div>';
	s+='</div>';
	
	
	s+='    </div>';
	s+='</div>';
	
	$('#detail').html(s);
	
	// 없는 드랍다운은 가리기 
	$('.dropdown-content').each(function(){
		if($(this).html().trim() == ''){
			$(this).parent().hide();
		}
	});
	
	if(status_code == 'SDW' || status_code == 'BDW'){
		// 수거 배송 지도 실시간 뷰
		if(status_code == 'SDW') start_location(sdw_employee_phone, client_lat, client_lng);
		if(status_code == 'BDW') start_location(bdw_employee_phone, client_lat, client_lng);
	} 
	
	// 결제 금액이 0원이면
	if(status_code == 'TW' || (status_code == 'LW' && order_paymethod == 'RP')){
		if(wooliservice.comma(total) == 0){
			$('.pay_area').hide();
		}
	}
}

function updateOrderMemo(seq){
	var param = 'a_ordersDto.seq='+seq;
	param+='&a_ordersDto.admin_memo='+$('#admin_memo_'+seq).val();
	param+='&a_ordersDto.client_pri_memo='+$('#client_pri_memo_'+seq).val();
	wooliservice.ajaxclient('/admin/updateOrderMemo', param, wooliservice.reload);
}

function logout(){
	localStorage.removeItem('wooli_id');
	localStorage.removeItem('wooli_pwd');
	window.location = '/admin/logout';
}

var viewType="1";
function view_tag(){
	if(viewType == "1"){// 기본 뷰 => 태그 뷰
		$('#map').hide();
		/*$('#list .activity-page').each(function(){
			$(this).find('.dropdown-item.dropdown-toggle.bg-magenta-dark').trigger('click');
			var itemCnt = $(this).find('.dropdown-menu').eq(1).find('.dropdown-content > .activity-item').length;
			if(itemCnt == 0) $(this).parent().hide();
			$(this).find('.dropdown-menu').eq(0).hide();
			$(this).find('.dropdown-menu').eq(2).hide();
			$(this).find('.dropdown-menu').eq(3).hide();
		});*/
		$('.dropdown-content').hide();
		$('.payment').show();
		viewType = "2";
	}else if(viewType == "2"){// 태그 뷰 => 지도 뷰
		wooliservice.ajaxclient('/admin/select_my_shop', '', viewType2_success);
		viewType = "3";
	}else if(viewType == "3"){// 지도 뷰 => 기본 뷰
		$('#map').hide();
		$('#list .activity-page').each(function(){
			$(this).find('.dropdown-item.dropdown-toggle.bg-magenta-dark').trigger('click');
			$(this).parent().show();
			$(this).find('.dropdown-menu').eq(0).show();
			$(this).find('.dropdown-menu').eq(2).show();
			$(this).find('.dropdown-menu').eq(3).show();
		});
		$('.payment').hide();
		viewType = "1";
	}
}

var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

var map;
var marker_admin;
var loc_admin_phone;
var timerId = null;

function start_location(admin_phone,lat, lng){
	loc_admin_phone = admin_phone;
	// 1. 지도 생성
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
	    level: 7 // 지도의 확대 레벨
	};
	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 사용자 마커
	var imageSrc = 'https://clean-nara.com/resources/web/img/map_client.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	// 기사 마커
	var imageSrc = 'https://clean-nara.com/resources/web/img/map_deliver.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	marker_admin = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker_admin.setMap(map); 
	getLocation(); 
	timerId = setInterval(getLocation, 10000);
}

function getLocation() {
	wooliservice.ajaxclient_none('/mobile/admin_location', 'temp_str='+loc_admin_phone, getLocationSuccess);
	// 2. 10초 타임을 주고 맵을 다시 그린다
}

function getLocationSuccess(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){	
		if(ob.l.list.length > 0){
			var lat = ob.l.list[0].move_lat;
			var lng = ob.l.list[0].move_lng;
			var clickPosition = new daum.maps.LatLng(lat, lng);
			// 상태를 true로, 선이 그리고있는 상태로 변경합니다
		    drawingFlag = true;
		    
		    // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		    deleteClickLine();
		    
		    // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		    deleteDistnce();

		    // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		    deleteCircleDot();
		    
		     // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		    clickLine = new daum.maps.Polyline({
		        map: map, // 선을 표시할 지도입니다 
		        path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		        strokeWeight: 3, // 선의 두께입니다 
		        strokeColor: '#db4040', // 선의 색깔입니다
		        strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'solid' // 선의 스타일입니다
		    });
		    
		    // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
		    moveLine = new daum.maps.Polyline({
		        strokeWeight: 3, // 선의 두께입니다 
		        strokeColor: '#db4040', // 선의 색깔입니다
		        strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'solid' // 선의 스타일입니다    
		    });

		    // 클릭한 지점에 대한 정보를 지도에 표시합니다
		    displayCircleDot(clickPosition, 0, '');
		}

		for (var i = 0; i < ob.l.list.length; i++) {
			var o = ob.l.list[i];
			var move_lat = o.move_lat;
			var move_lng = o.move_lng;
			var markerPosition = new kakao.maps.LatLng(move_lat, move_lng); // 마커가 표시될 위치입니다
			if(ob.l.list.length-1 == i) marker_admin.setPosition(markerPosition);
			
			// 그려지고 있는 선의 좌표 배열을 얻어옵니다
        	var path = clickLine.getPath();
    		
            clickPosition = new daum.maps.LatLng(move_lat, move_lng);
            
            // 좌표 배열에 클릭한 위치를 추가합니다
            path.push(clickPosition);
            
            // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
            clickLine.setPath(path);

            //var distance = Math.round(clickLine.getLength());
            //displayCircleDot(clickPosition, distance, seq);
		}
	}else{
		$('#map').hide();
		clearInterval(timerId);
	}
}

function viewType2_success(data){
	var ob = $.parseJSON(data);
	var s = '';
	if(ob.code == '0000'){		
		var o = ob.a_shopsDto;
		var move_lat = ob.move_lat==undefined? '':ob.move_lat;
		var move_lng = ob.move_lng==undefined? '':ob.move_lng;
		
		$('#map').show();
		var lat = o.lat;
		var lng = o.lng;
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
		    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		    level: 7 // 지도의 확대 레벨
		};
		
		map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 크린나와 나의 위치
		if(move_lat != ''){
			// 기사 마커
			var imageSrc = 'https://clean-nara.com/resources/web/img/map_deliver.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new kakao.maps.LatLng(move_lat, move_lng); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			marker_admin = new kakao.maps.Marker({
			    position: markerPosition, 
			    image: markerImage // 마커이미지 설정 
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker_admin.setMap(map); 
		}
		
		$('#list .activity-page').each(function(){
			$(this).parent().hide();
			var client_lat = $(this).find('.map_info').attr('client_lat');
			var client_lng = $(this).find('.map_info').attr('client_lng');
			var client_name = $(this).find('.map_info').attr('client_name');
			var time = $(this).find('.map_info').attr('time').substring(0,2);
			var seq = $(this).find('.map_info').attr('seq');
			var status_code = $(this).find('.map_info').attr('status_code');
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(client_lat, client_lng); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
		
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			//var iwContent = '<div style="padding:0px;width: 150px;">['+seq+']['+client_name+']['+time+']</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwContent = '<div style="padding:0px;width: 80px;" class="map_child">['+seq+']['+status_code+']['+time+']</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(client_lat, client_lng); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		});
		
		setTimeout(function(){ 
			$('.map_child').each(function(){
				$(this).parent().parent().css('width','100px');
				var left_px = $(this).parent().parent().css('left');
				left_px = Number(left_px.replace('px',''));
				
				
				$(this).parent().parent().css('left',left_px+50);
				$(this).parent().css('left','10px');
			});
		}, 1000);
		
		
		// 라인 그리기
		// #### 출발점 공장 ####
		/*var clickPosition = new daum.maps.LatLng(lat, lng);
		// 상태를 true로, 선이 그리고있는 상태로 변경합니다
        drawingFlag = true;
        
        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
        deleteClickLine();
        
        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
        deleteDistnce();

        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
        deleteCircleDot();
        
         // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
        clickLine = new daum.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
        moveLine = new daum.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다    
        });
    
        // 클릭한 지점에 대한 정보를 지도에 표시합니다
        displayCircleDot(clickPosition, 0, '');
        
        // #### 반복 그리기 ####
        var s = '';		
        $('#list .activity-page').each(function(){
        	$(this).parent().hide();
			var client_lat = $(this).find('.map_info').attr('client_lat');
			var client_lng = $(this).find('.map_info').attr('client_lng');
			var client_name = $(this).find('.map_info').attr('client_name');
			var seq = $(this).find('.map_info').attr('seq');
			
			// 그려지고 있는 선의 좌표 배열을 얻어옵니다
        	var path = clickLine.getPath();
    		
            clickPosition = new daum.maps.LatLng(client_lat, client_lng);
            
            // 좌표 배열에 클릭한 위치를 추가합니다
            path.push(clickPosition);
            
            // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
            clickLine.setPath(path);

            var distance = Math.round(clickLine.getLength());
            displayCircleDot(clickPosition, distance, seq);      
		});  
     	// #### 반복 그리기 ####	
*/	}else{ 
		modal_pop_dark(ob.code,ob.message);
	}
}

//클릭으로 그려진 선을 지도에서 제거하는 함수입니다
function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

//그려지고 있는 선의 총거리 정보와 
// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

//선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
function displayCircleDot(position, distance, seq) {

    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
    var circleOverlay = new daum.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // 지도에 표시합니다
    circleOverlay.setMap(map);

    if (distance > 0) {
        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
        var distanceOverlay = new daum.maps.CustomOverlay({
            content: '<div class="dotOverlay">거리 <span class="number">['+seq+']' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // 지도에 표시합니다
        distanceOverlay.setMap(map);
    }

    // 배열에 추가합니다
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

var clear_client_addr_old;
function clearPaper(client_addr_old){
	clear_client_addr_old = client_addr_old;
	attention_pop('전단지 클리어?', '꼼꼼히 돌리셨어요?', 'excutePaper');
}

function excutePaper(){
	wooliservice.ajaxclient('/admin/excutePaper', 'a_membersDto.addr_old='+clear_client_addr_old, excutePaper_success);
}

function deletePaper(client_addr_old){
	clear_client_addr_old = client_addr_old;
	attention_pop('전단지 삭제?', '전단지 정보 삭제 합니다?', 'excutedelPaper');
}

function excutedelPaper(){
	wooliservice.ajaxclient('/admin/excutedelPaper', 'a_membersDto.addr_old='+clear_client_addr_old, excutePaper_success);
}

function excutePaper_success(data){
	var ob = $.parseJSON(data);
	if(ob.code == '0000'){			
		location.reload();
	}else{ 
		modal_pop_dark(ob.code,ob.message);
	}
}

var bill_seq;
function sendMoney(seq){
	bill_seq = seq;
	attention_pop('계산서 발송', '계산서 발송 하시겠어요?', 'sendMoney_excute');
}

function sendMoney_excute(){
	wooliservice.ajaxclient('/admin/sendMoney', 'a_ordersDto.seq='+bill_seq, sendMoney_success);
}

function sendMoney_success(data){
	var ob = $.parseJSON(data);
	var s = '';		
	if(ob.code == '0000'){		
		info_pop('발송완료', '계산서 메지시를 발송 하였습니다'); 
	}else{ 
		modal_pop_dark(ob.code,ob.message);
	}
}

function realPay(seq){
	bill_seq = seq;
	attention_pop('현장결제', '현장결제로 진행 하시겠어요?', 'realPay_excute');
}

function realPay_excute(){
	wooliservice.ajaxclient('/admin/realPay', 'a_ordersDto.seq='+bill_seq, realPay_success);
}

function realPay_success(data){
	var ob = $.parseJSON(data);
	var s = '';		
	if(ob.code == '0000'){		
		location.reload(); 
	}else{ 
		modal_pop_dark(ob.code,ob.message);
	}
}

function isLoginMove(url){
	var phone = $.parseJSON(JsonMember).phone;
	if(phone == undefined){
		modalMainConfirm('로그인', '회원 전용입니다. 로그인 하시겠어요?', move_login);
	}else{
		window.location = url;
	}
}

function ForceMove(url){
	window.location = url;
}

function move_login(){
	window.location = '/mobile/?page_name=pages/login.jsp&head=none';
}

function getCntBarcode(listA_barcode){
	var cnt = 0;
	for (var i = 0; i < listA_barcode.length; i++) {
		var b = listA_barcode[i];
		var barcode = b.barcode;
		if($.isNumeric(barcode)) cnt++;
	}
	
	return cnt;
}

function getCntOnBarcode(listA_barcode){
	var cnt = 0;
	for (var i = 0; i < listA_barcode.length; i++) {
		var b = listA_barcode[i];
		var barcode = b.barcode;
		var isout = b.isout;
		if(isout == 'Y') if($.isNumeric(barcode)) cnt++;
	}
	
	return cnt;
}

function show_detail(seq){
	hidden_all(seq);
	if($('#'+seq+'_detail:visible').length == 0)
	{
		$('#'+seq+'_detail').show();
	}else{
		$('#'+seq+'_detail').hide();
	}
}

function show_pay(seq){
	hidden_all(seq);
	if($('#'+seq+'_pay:visible').length == 0)
	{
		$('#'+seq+'_pay').show();
	}else{
		$('#'+seq+'_pay').hide();
	}
}

function show_update(seq){
	hidden_all(seq);
	if($('#'+seq+'_update:visible').length == 0)
	{
		$('#'+seq+'_update').show();
	}else{
		$('#'+seq+'_update').hide();
	}
}

function show_img(seq){
	hidden_all(seq);
	if($('#'+seq+'_img:visible').length == 0)
	{
		$('#'+seq+'_img').show();
	}else{
		$('#'+seq+'_img').hide();
	}
	
	$('#'+seq+'_img img').each(function(){
		var realdata = $(this).attr('realdata');
		$(this).attr('src',realdata);
	});
}

function hidden_all(seq){
	$('#'+seq+'_detail').hide();
	$('#'+seq+'_pay').hide();
	$('#'+seq+'_update').hide();
	$('#'+seq+'_img').hide();
}

function close_show(seq){
	hidden_all(seq);
}

function get_real_barcode_cnt(listA_barcode){
	var cnt = 0;
	for (var j = 0; j < listA_barcode.length; j++) {
		var b = listA_barcode[j];
		var barcode = b.barcode;
		var isout = b.isout;
		if(barcode.length > 4) cnt++;
	}
	return cnt;
}

function get_real_barcode_out_cnt(listA_barcode){
	var cnt = 0;
	for (var j = 0; j < listA_barcode.length; j++) {
		var b = listA_barcode[j];
		var barcode = b.barcode;
		var isout = b.isout;
		if(barcode.length > 4 && isout == 'Y') cnt++;
	}
	return cnt;
}

Date.prototype.YYYYMMDDHHMMSS = function () {
    var yyyy = this.getFullYear().toString();
    var MM = pad(this.getMonth() + 1,2);
    var dd = pad(this.getDate(), 2);
    var hh = pad(this.getHours(), 2);
    var mm = pad(this.getMinutes(), 2)
    var ss = pad(this.getSeconds(), 2)

    return yyyy + MM + dd+  hh + mm + ss;
};

function pad(number, length) {
    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }
    return str;
}

// --------------------------------- 이미지 리사이즈 관련 --------------------------------------- //
(function() {

	var matched, browser;

	// Use of jQuery.browser is frowned upon.

	// More details: http://api.jquery.com/jQuery.browser

	// jQuery.uaMatch maintained for back-compat

	jQuery.uaMatch = function(ua) {

		ua = ua.toLowerCase();

		var match = /(chrome)[ \/]([\w.]+)/.exec(ua) ||

		/(webkit)[ \/]([\w.]+)/.exec(ua) ||

		/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(ua) ||

		/(msie) ([\w.]+)/.exec(ua) ||

		ua.indexOf("compatible") < 0
				&& /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua) ||

				[];

		return {

			browser : match[1] || "",

			version : match[2] || "0"

		};

	};

	matched = jQuery.uaMatch(navigator.userAgent);

	browser = {};

	if (matched.browser) {

		browser[matched.browser] = true;

		browser.version = matched.version;

	}

	// Chrome is Webkit, but Webkit is also Safari.

	if (browser.chrome) {

		browser.webkit = true;

	} else if (browser.webkit) {

		browser.safari = true;

	}

	jQuery.browser = browser;

})();

// html5의 Canvas를 사용해서 이미지 리사이징이 가능한지 판별하는 메소드
function isImageResizable() {
	var isCanvasUsable = !!document.createElement('canvas').getContext;
	var isLowerIE = false;

	if ($.browser.msie) {
		if ($.browser.version < 10) { // IE9은 Canvas는 쓸 수 있지만 file input에서 file Object를 가져오지 못해 제외
			isLowerIE = true;
		}
	}

	return isCanvasUsable && !isLowerIE;
}

// fileInput Object에 값이 변경될 때

function resizingImage(fileId){

	// 이미지 리사이즈가 브라우저단에서 가능하다면 html5 사용...

    if(isImageResizable()) {

        var file = $('#'+fileId)[0].files[0]; // file Object get...

        if(file.type.match(/image.*/)) {

            // Load the image

            var reader = new FileReader();

            reader.onload = function (readerEvent) {

                var image = new Image();

                image.onload = function (imageEvent) {

 

                    // Resize the image

                    var canvas = document.createElement('canvas'),

                    max_size = 320,

                    width = image.width,

                    height = image.height;

 

                    if (width > height) {

                        if (width > max_size) {

                            height *= max_size / width;

                            width = max_size;

                        }

                    } else {

                        if (height > max_size) {

                            width *= max_size / height;

                            height = max_size;

                        }

                    }

                    canvas.width = width;

                    canvas.height = height;

                    canvas.getContext('2d').drawImage(image, 0, 0, width, height);

                    var dataUrl = canvas.toDataURL('image/jpeg');

                    //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

                    //var resizedImage = dataURLToBlob(dataUrl);  // 이미지를 바이너리 형태로 변환?

                     

	                // 이미지가 리사이즈 되었으면 파일 업로드하는 메소드 호출 시작

	                //변환된 사진 attribute 변경

				$("#img_"+fileId).attr('src', dataUrl);

				fileUploadAdmin_Excute(fileId);

					// 이미지가 리사이즈 되었으면 파일 업로드하는 메소드 호출 끝

                    return false;

                }

                image.src = readerEvent.target.result;

            }

            reader.readAsDataURL(file);

        }

    }

    return false;

}


function paymentName(t){
	if(t == 'CARD') return '앱카드';
	if(t == 'BANK') return '앱계좌이체';
	if(t == 'BANKC') return '무통장';
	if(t == 'CARDRP') return '현장카드';
	if(t == 'CASHRP') return '현장현금';
	if(t == 'POINT') return '포인트결제';
	if(t == 'CARDA') return '자동결제';
	return '알수없는 결제';
} 