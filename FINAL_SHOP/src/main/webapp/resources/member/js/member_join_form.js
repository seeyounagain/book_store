/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){

		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){
	
		goJoin = function() {
			
			var pw = $('#pw').val();
			var checkPw = $('#checkPw').val();
			
			alert(pw);
			alert(checkPw);
			
			if (pw != checkPw) {
				
				alert('비밀번호를 확인해주세요');
				$('input[type="password"]').val('');
				$('#pw').focus();
				
			}
			
			else {
				
				$('form').submit();
				
			}
			
		}

	})(jQuery);