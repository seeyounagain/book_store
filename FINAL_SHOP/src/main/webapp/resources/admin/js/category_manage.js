/* 페이지 로딩 후(jsp 내용 모두 실행) 실행 */
	$(document).ready(function(){
		
		$(document).on('click','.deleteBtn', function() {
			
			var cateCode = $(this).attr('data-code');
			
			var result = confirm('카테고리 및 상품을 삭제 하시겠습니까?')
			
			if (result) {
			
				location.href = '/admin/deleteCate?cateCode=' + cateCode;
				
			}
			
			
		});
		
		
	});

/* 함수선언 영역

	순서 주의 !
	함수명 = 함수선언(){};

*/
	(function($){

	})(jQuery);