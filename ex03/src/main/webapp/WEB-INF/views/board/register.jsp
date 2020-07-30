<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!-- ================================================== -->
<style>
.uploadResult {
	width: 100%;
	background-color: #FFF5CF;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align :center;
}

.uploadResult ul li img {
	width: 60px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	bakcground: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture image {
	width: 600px;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows='3' name='content'></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'>
					</div>
					<button type="submit" class="btn btn-primary">Submit
						Button</button>
					<button type="reset" class="btn btn-danger">Reset Button</button>
				</form>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">File Attach</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- /.row -->


<%@include file="footer.jsp"%>
<script>
	function showUploadResult(uploadResultArr) {
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}
		var uploadUL = $(".uploadResult ul");
		var str = "";
		$(uploadResultArr)
				.each(
						function(i, obj) {
							if (obj.image) {
								//todo
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_" + obj.uuid + "_" + obj.fileName);

								str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'";
			str +="><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/display?fileName="
										+ fileCallPath + "'>";
								str += "</div></li>";

							} else {
								/* var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/" + obj.uuid + "_" + obj.fileName);
								var fileLink = fileCallPath.replace(new RegExp(
										/\\/g), "/");
								str += "<li ";
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/resources/img/attach1.png'></a>";
								str += "</div></li>"; */
								
								var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+obj.uuid+"_"+obj.fileName);
									var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
									
									str += "<li ";
									str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
									str += "<span> " + obj.fileName+"</span>";
									str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
									str += "<img src='/resources/img/attach.png'>";
									str += "</div>";
									str += "</li>";

							}

						});
		uploadUL.append(str);
		debugger;
	}
</script>
<script>
	$(document)
			.ready(
					function(e) {
						var formObj = $("form[role='form']");
						$("button[type='submit']")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("submit clicked");
											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj);
																console
																		.dir(jobj);
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName' value='"
																str += jobj
																		.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid' value='"
																str += jobj
																		.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath' value='"
																str += jobj
																		.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType' value='"
																str += jobj
																		.data("type")
																		+ "'>";
															});
											formObj.append(str).submit();
										});

						//check Extension
						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
						var maxSize = 5242880;
						//var maxSize = 10;
						function checkExtension(fileName, fileSize) {
							//debugger;
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}
							if (regex.test(fileName)) {
								alert("해당종류의 파일은 업로드 불가");
								return false;
							}
							return true;
						} // checkExtension ends here..

						$("input[type='file']")
								.change(
										function(e) {
											//debugger;
											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											console.log(files);
											for (var i = 0; i < files.length; i++) {

												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}

												formData.append("uploadFile",
														files[i]);
											}
											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												type : 'post',
												dataType : 'json',
												success : function(result) {
													//alert("Uploaded");
													console.log(result);
													showUploadResult(result);
													//$(".uploadDiv").html(cloneObj.html());
												}
											}); //ajax
										}); //파일을 선택이 발생한 이벤트 리스너

						$(".uploadResult").on("click", "button", function(e) {
							console.log("delete file");
							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							var targetLi = $(this).closest("li");
							$.ajax({
								url : '/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'text',
								type : 'post',
								success : function(result) {
									alert(result);
									targetLi.remove();
								}
							}); //ajax

						}); //uploadResult event listener
					});  //document ready function ends
</script>