<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="nav/head.jsp">
		<jsp:param name="static" value="/moa/static" />
	</jsp:include>
</head>

<script>	
	$(function(){
		$('#btn_save').click(function(){
			// 아이디 중복체크 확인
			//$('#btn_dupl_vali').show();
			
			// 이름 공백 체크
			if($('#name').val().trim() == ''){
				$('#btn_name_vali').show();
				return false;
			}
			
			// 비밀번호 공백 체크
			if($('#pwd').val().trim() == ''){
				$('#btn_pwd_vali').show();
				return false;
			}
			
			// 비밀번호 확인 공백 체크
			if($('#pwd2').val().trim() == ''){
				$('#btn_pwd2_vali').show();
				return false;
			}
			
			// 저장
			$.ajax({
	            url:'./time2.php',
	            type:'post',
	            data:$('form').serialize(),
	            success:function(data){
	                $('#time').text(data);
	            }
	        })
		});
		
		$('#btn_dupl').click(function(){
			alert(2);
		});
				
	});
</script>

<style>
	.help-block{
		color: red;
	}
</style>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <jsp:include page="nav/top.jsp">
				<jsp:param name="pageName" value="회원가입" />
			</jsp:include>           

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<jsp:include page="nav/left.jsp">
							<jsp:param name="active" value="join" />
						</jsp:include>                                                                     
                    </ul>
                </div>                
            </div>           
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원가입</h1>
                </div>                
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원 정보를 입력하세요
                        </div>
                        <div class="panel-body">
                        	<form id="frm">
                        		<div class="row">
	                                <div class="col-lg-6">                                    
	                                    <div class="form-group">
	                                        <label>아이디</label>
	                                        <div class="row">
	                                        	<div class="col-lg-8">
	                                        		<input id="id" name="id" class="form-control"/>
	                                        	</div> 
	                                        	<div class="col-lg-4">
	                                        		<button id="btn_dupl" type="button" class="btn btn-success">아이디중복</button>
	                                        	</div>                                        	
	                                        </div>                                                                                                                                                             
		                                    <p class="help-block" id="btn_dupl_vali" style="display: none;">아이디 중복체크를 해주세요</p>                                                        
	                                    </div>
	                                    <div class="form-group">
	                                        <label>이름</label>
	                                        <input id="name" name="name" class="form-control"/>                                                                                                                                                             
		                                    <p class="help-block" id="btn_name_vali" style="display: none;">아이디 중복체크를 해주세요</p>                                                        
	                                    </div>
	                                    
	                                    <div class="form-group">
	                                        <label>비밀번호</label>
	                                        <input id="pwd" name="pwd" type="password" class="form-control"/>                                                                                                                                                             
		                                    <p class="help-block" id="btn_pwd_vali" style="display: none;">아이디 중복체크를 해주세요</p>                                                        
	                                    </div>
	                                    
	                                    <div class="form-group">
	                                        <label>비밀번호 확인</label>
	                                        <input id="pwd2" name="pwd2" type="password" class="form-control"/>                                                                                                                                                             
		                                    <p class="help-block" id="btn_pwd2_vali" style="display: none;">아이디 중복체크를 해주세요</p>                                                        
	                                    </div>    
	                                    	                                                                   
	                                    <button id="btn_save" type="button" class="btn btn-default">저장</button>                                                                           
	                                </div>
	                                
	                                <div class="col-lg-6">
	                                    
	                                </div>                                
	                            </div>
                        	</form>                                                      
                        </div>                        
                    </div>                    
                </div>                
            </div>           
        </div>
    </div>
</body>

</html>
