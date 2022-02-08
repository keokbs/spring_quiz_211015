<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1><b>즐겨찾기 추가하기</b></h1>
		<div class="form-group mt-3">
			<span>제목</span>
			<input type="text" id="name" class="form-control" name="name" placeholder="제목을 입력하세요">
		</div>
		
		<div class="form-group mt-3">
			<span>주소</span>
			<input type="text" id="url" class="form-control" name="url" placeholder="주소를 입력하세요">
		</div>
		<input type="button" id="addBtn" class="btn btn-success w-100 mt-2" value="추가">
	</div>
</body>

<script>
$(document).ready(function() {
	$('#addBtn').on('click', function(e) {
		// alert("ok?");
		let name = $('#name').val().trim();
		let url = $('#url').val().trim();
		
		if(name == '') {
			alert("제목을 입력하세요");
			return;
		}
		
		if(url == '') {
			alert("주소를 입력하세요");
			return;
		}
		
		$.ajax({
			type: 'GET'
			, url: "/lesson06/add_book_mark"
			, data: {'name':name, 'url':url}
			, success: function(data) {
				location.href = "/lesson06/book_mark_list_veiw"
			}
			, error : function(e) {
				alert("error : " + e);
			}
		});
	});
});

</script>

</html>