<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<%@include file="header.jsp"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">Board Modify Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<form role="form" action="/board/modify" method="POST">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" /> <input type="hidden" name="pageNum"
							value='<c:out value="${cri.pageNum }"/>'> <input
							type="hidden" name="amount"
							value='<c:out value="${cri.amount }"/>'> <input
							type="hidden" name="type" value="<c:out value="${cri.type }"/>" />
						<input type="hidden" name="keyword"
							value="<c:out value="${cri.keyword }"/>" />

						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno"
								value="<c:out value='${board.bno }'/>" readonly="readonly">
						</div>

						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title"
								value="<c:out value='${board.title }'/>">
						</div>

						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name="content">
					<c:out value='${board.content }' />
					</textarea>
						</div>

						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer"
								value="<c:out value='${board.writer }'/>" readonly="readonly">
						</div>

						<%-- <div class="form-group">
					<label>RegDate</label> <input class="form-control" name="regDate" 
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate }" />' readonly="readonly">
					</div>
					
					<div class="form-group">
					<label>Update Date</label> <input class="form-control" name="updateDate" 
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate }" />' readonly="readonly">
					</div> --%>
						<sec:authentication property="principal" var="pinfo" />
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq board.writer }">

								<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>

								<button type="submit" data-oper="remove" class="btn btn-danger">remove</button>

							</c:if>
						</sec:authorize>

						<button type="submit" data-oper="list" class="btn btn-info">List</button>

					</form>

				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>

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
	display: inline-block;
}

.uploadResult ul li img {
	width: 100px;
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
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Files</div>
				<!-- panel-heading end -->
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name="uploadFile" multiple="multiple">
					</div>

					<div class="uploadResult">
						<ul>

						</ul>
					</div>
					<!-- end uploadResult -->
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- end row  -->




	<%@include file="footer.jsp"%>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var formObj = $("form");

							$('button')
									.on(
											"click",
											function(e) {

												e.preventDefault();

												var operation = $(this).data(
														"oper");

												console.log(operation);

												if (operation === 'remove') {
													formObj.attr("action",
															"/board/remove");
												} else if (operation === "list") {
													//move to list
													formObj.attr("action",
															"/board/list")
															.attr("method",
																	"get");
													//formObj.empty();
													var pageNumTag = $(
															"input[name='pageNum']")
															.clone();
													var amountTag = $(
															"input[name='amount']")
															.clone();
													var keywordTag = $(
															"input[name='keyword']")
															.clone();
													var typeTag = $(
															"input[name='type]")
															.clone();

													formObj.empty();

													formObj.append(pageNumTag);
													formObj.append(amountTag);
													formObj.append(keywordTag);
													formObj.append(typeTag);

												} else if (operation === 'modify') {
													//debugger;
													console
															.log("submit clicked");

													var str = "";

													$(".uploadResult ul li")
															.each(
																	function(i,
																			obj) {

																		var jobj = $(obj);

																		console
																				.dir(jobj);

																		str += "<input type='hidden' name='attachList["
																				+ i
																				+ "].fileName' value='"
																				+ jobj
																						.data("filename")
																				+ "'>";
																		str += "<input type='hidden' name='attachList["
																				+ i
																				+ "].uuid' value='"
																				+ jobj
																						.data("uuid")
																				+ "'>";
																		str += "<input type='hidden' name='attachList["
																				+ i
																				+ "].uploadPath' value='"
																				+ jobj
																						.data("path")
																				+ "'>";
																		str += "<input type='hidden' name='attachList["
																				+ i
																				+ "].fileType' value='"
																				+ jobj
																						.data("type")
																				+ "'>";
																	});
													formObj.append(str)
															.submit();
												}
												formObj.submit();

											});

						}); //end $(document).ready
	</script>
	<script>
		$(document)
				.ready(
						function() {
							(function() {
								var bno = '<c:out value="${board.bno}"/>';

								$
										.getJSON(
												"/board/getAttachList",
												{
													bno : bno
												},
												function(arr) {

													console.log(arr);

													var str = "";

													$(arr)
															.each(
																	function(i,
																			attach) {

																		//image type
																		if (attach.fileType) {
																			var fileCallPath = encodeURIComponent(attach.uploadPath
																					+ "/s_"
																					+ attach.uuid
																					+ "_"
																					+ attach.fileName);

																			str += "<li data-path='"+attach.uploadPath+
"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+
"' data-type='"+attach.fileType+"'><div>";

																			str += "<span>"
																					+ attach.fileName
																					+ "</span>";
																			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";

																			str += "<img src='/display?fileName="
																					+ fileCallPath
																					+ "'>";
																			str += "</div>";
																			str += "</li>";
																		} else {

																			str += "<li data-path='"+attach.uploadPath+
"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+
"' data-type='"+attach.fileType+"'><div>";

																			str += "<span>"
																					+ attach.fileName
																					+ "</span><br>";
																			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";

																			str += "<img src='/resources/img/attach.png'>";
																			str += "</div>";
																			str += "</li>";

																		}
																	});

													$(".uploadResult ul").html(
															str);

												});//end getjson

							})();//end function

							$(".uploadResult").on(
									"click",
									"button",
									function(e) {

										console.log("delete file");

										if (confirm("Remove this file?")) {

											var targetLi = $(this)
													.closest("li");
											targetLi.remove();
										}
									})

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

							var csrfHeaderName = "${_csrf.headerName}";
							var csrfTokenValue = "${_csrf.token}";
							
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

													formData.append(
															"uploadFile",
															files[i]);
												}
												$
														.ajax({
															url : '/uploadAjaxAction',
															processData : false,
															contentType : false,
															data : formData,
															type : 'post',
															beforeSend: function(xhr){
																xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
															},
															dataType : 'json',
															success : function(
																	result) {
																//alert("Uploaded");
																debugger;
																console
																		.log(result);
																showUploadResult(result);
																//$(".uploadDiv").html(cloneObj.html());
															}
														}); //ajax
											}); //파일을 선택이 발생한 이벤트 리스너

							function showUploadResult(uploadResultArr) {
								if (!uploadResultArr
										|| uploadResultArr.length == 0) {
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
																+ "/s_"
																+ obj.uuid
																+ "_"
																+ obj.fileName);

														str += "<li data-path='"+obj.uploadPath+"'";
												str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'";
												str +="><div>";
														str += "<span> "
																+ obj.fileName
																+ "</span>";
														str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
														str += "<img src='/display?fileName="
																+ fileCallPath
																+ "'>";
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

														var fileCallPath = encodeURIComponent(obj.uploadPath
																+ "/"
																+ obj.uuid
																+ "_"
																+ obj.fileName);
														var fileLink = fileCallPath
																.replace(
																		new RegExp(
																				/\\/g),
																		"/");

														str += "<li ";
																		str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
														str += "<span> "
																+ obj.fileName
																+ "</span>";
														str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
														str += "<img src='/resources/img/attach.png'>";
														str += "</div>";
														str += "</li>";

													}

												});
								uploadUL.append(str);
								//debugger;
							}

						});
	</script>


</body>

</html>
