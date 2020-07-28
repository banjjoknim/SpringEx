<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
width: 100%;
background-color: gray;
}
.uploadResult li {

display: flex;
flex-flow: row;
justify-content: center;
align-items: center;
}

.uploadResult ul li {
list-style: none;
padding: 10px;
}

.uploadResult ul li img{
width: 20px;
}
</style>
</head>
<body>
<h1>Upload with Ajax</h1>


<div class="uploadDiv">
<input type="file" name="uploadFile" multiple>
</div>

<div class="uploadResult">
<ul>

</ul>
</div>

<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert('해당 종류의 파일은 업로드할 수 없습니다.');
			return false;
		}
		return true;
	};

	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		//add filedate to formdata
		for(var i =0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				//alert("Uploaded");
				console.log(result);
				
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
				
			}
		}); //$.ajax
		
	});
	
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData();
		
	})
	
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr) {
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			if(!obj.image) {
				str += "<li><img src='/resources/img/davidrussell.jpg'>" + obj.fileName + "</li>";
			} else {
			//str += "<li>" + obj.fileName + "</li>";
			
			var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
			
			str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
			}
		});
		
		uploadResult.append(str);
		
	}
	
	
	
	
	
	
	
	
	
	
});



</script>

</body>
</html>