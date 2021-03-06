<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			
				<div class="panel-heading">Board Read Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				
					<div class="form-group">
					<label>Bno</label> <input class="form-control" name="bno" 
					value="<c:out value='${board.bno }'/>" readonly="readonly">
					</div>
					
					<div class="form-group">
					<label>Title</label> <input class="form-control" name="title" 
					value="<c:out value='${board.title }'/>" readonly="readonly">
					</div>
					
					<div class="form-group">
					<label>Text area</label> 
					<textarea class="form-control" rows="3" name="content" readonly="readonly">
					<c:out value='${board.content }'/>
					</textarea>
					</div>
					
					<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer" 
					value="<c:out value='${board.writer }'/>" readonly="readonly">
					</div>
					
					<%-- <button data-oper="modify" class="btn btn-default"
					onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'"
					>Modify</button>
					
					<button data-oper="list" class="btn btn-info"
					onclick="location.href='/board/list'"
					>List</button> --%>
					
					<button data-oper="modify" class="btn btn-default">Modify</button>
					<button data-oper="list" class="btn btn-info">List</button>
					
					<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>
					<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount }"/>'>
					<input type="hidden" name="type" value="<c:out value="${cri.type }"/>"/>
						<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>"/>
					</form>
					
					
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
	<div class="row">
	<div class="col-lg-12">
	
	<!-- /panel -->
	<div class="panel panel-default">
	<div class="panel-heading">
	<i class="fa fa-comments fa-fw"></i> Reply
	<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
	</div>
	
	<!-- /panel-heading -->
	<div class="panel-body">
	
	<ul class="chat">
	<!-- start reply -->
	<li class="left clearfix" data-rno="12"> 
	<div>
	<div class="header">
	<strong class="primary-font">user00</strong>
	<small class="pull-right text-muted">2018-01-01 13:13</small>
	</div>
	<p>Good job!</p>
	</div>
	</li>
	<!-- end reply -->
	</ul>
	<!-- end ul -->
	</div>
	<!-- end /panel .chat-panel -->
	
	<div class="panel-footer">
	
	</div>
	
	
	
	
	
	
	
	
	
	</div>
	</div>
	<!-- end row -->
	</div>
	
	<%@include file="footer.jsp"%>
	
	<!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                                        </div>
                                        <div class="modal-body">
                                        <div class="form-group">
                                        <label>Reply</label>
                                        <input class="form-control" name="reply" value="New Reply!!!!!">
                                        </div>
                                        <div class="form-group">
                                        <label>Replyer</label>
                                        <input class="form-control" name="replyer" value="replyer">
                                        </div>
                                        <div class="form-group">
                                        <label>Reply Date</label>
                                        <input class="form-control" name="replyDate" value="">
                                        </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                                            <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                                            <button id="modalRegisterBtn" type="button" class="btn btn-info" data-dismiss="modal">Register</button>
                                            <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		
		operForm.attr("action", "/board/modify").submit();
		
	});
	
	$("button[data-oper='list']").on("click", function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list");
		operForm.submit();
	});
	
	console.log(replyService);
});
</script>

<script>

console.log("=================");
console.log("JS TEST");

$(document).ready(function(){
	

var bnoValue = '<c:out value="${board.bno}"/>';
var replyUL = $(".chat");

showList(1);

function showList(page) {
	
	
	/* 댓글 목록만 가져오는 getList
	replyService.getList({bno:bnoValue, page:page||1}, function(list){
	
		var str="";
		if(list == null || list.length == 0){
			replyUL.html("");
			
			return;
		}
		for(var i = 0, len = list.length||0; i < len; i++) {
			str = str + "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			str = str + "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
			str = str + "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
			str = str + "<p>"+list[i].reply+"</p></div></li>";
		}  */
		
		//새로 추가한 getList
		console.log("show list :"+page);
		
		replyService.getList({bno:bnoValue, page: page || 1}, function(replyCnt, list){
		
		console.log("replyCnt: "+replyCnt);
		console.log("list: "+list);
		console.log(list);
		
		if(page == -1) {
			pageNum = Math.ceil(replyCnt/10.0);
			showList(pageNum);
			return;
		}
		
		var str="";
		
		if(list == null || list.length ==0){
			return;
		}
		
		for(var i = 0, len = list.length || 0; i< len; i++) {
			str = str + "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			str = str + "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
			str = str + "<small class='pull-right text-muted'>"+
			replyService.displayTime(list[i].replyDate)+"</small></div>";
			str = str + "<p>"+list[i].reply+"</p></div></li>";
		}
		
		
		replyUL.html(str);
		
		showReplyPage(replyCnt);
	}); //end function
	}
};//end showList

var pageNum = 1;
var replyPageFooter = $(".panel-footer");

function showReplyPage(replyCnt){
	
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum - 9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt){
		endNum = Math.ceil(replyCnt/10.0);
		}
	
	if(endNum * 10 < replyCnt){
		next = true;
	}
	
	var str = "<ul class='pagination pull-right'>";
	
	if(prev){
		str = str + "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	}
	
	for(var i = stratNum; i<= endNum; i++){
		
		var active = pageNum == i? "active":"";
		
		str = str + "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next){
		str = str + "<li class='page-item'><a class='page-link' href='"+(encNum+1)"'>Next</a></li>"; 
	}
	
	str = str + "</ul></div>";
	
	console.log(str);
	
	replyPageFooter.html(str);
	
	}

var modal = $(".modal");
var modalInputReply = modal.find("input[name='reply']");
var modalInputReplyer = modal.find("input[name='replyer']");
var modalInputReplyDate = modal.find("input[name='replyDate']");

var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");
var modalCloseBtn = $("#modalCloseBtn");

$("#addReplyBtn").on("click", function(e){
	
	modal.find("input").val("");
	modalInputReplyDate.closest("div").hide();
	modal.find("button[id != 'modalCloseBtn']").hide();
	
	modalRegisterBtn.show();
	modalCloseBtn.show();
	
	$(".modal").modal("show");
	
})

modalRegisterBtn.on("click", function(e){
	
	var reply = {
			reply : modalInputReply.val(),
			replyer : modalInputReplyer.val(),
			bno : bnoValue
	};
	
	replyService.add(reply, function(result){
		
		alert(result);
		
		modal.find("input").val("");
		modal.modal("hide");
		
		//showList(1);
		showList(-1);
	})
	
})

$(".chat").on("click", "li", function(e){
	
	var rno = $(this).data("rno");
	
	replyService.get(rno, function(reply){
		
		modalInputReply.val(reply.reply);
		modalInputReplyer.val(reply.replyer);
		modalInputReplyDate.val(replyService.displayTime(reply.relyDate)).attr("readonly", "readonly");
		modal.data("rno", reply.rno);
		
		modal.find("button[id !='modalCloseBtn']").hide();
		modalModBtn.show();
		modalRemoveBtn.show();
		
		$(".modal").modal("show");
		
	});
	
	
	console.log(rno);
	
});

modalModBtn.on("click", function(e){
	
	var reply = {rno:modal.data("rno"), reply : modalInputReply.val()};
	
	replyService.update(reply, function(result){
		
		alert(result);
		modal.modal("hide");
		showList(1);
		
	});
	
});

modalRemoveBtn.on("click", function(e){
	
	var rno = modal.data("rno");
	
	replyService.remove(rno, function(result){
		
		alert(result);
		modal.modal("hide");
		showList(1);
		
	});
	
});



replyPageFooter.on("click", "li a", function(e){
	
	e.preventDefault();
	console.log("page click");
	
	var targetPageNum = $(this).attr("href");
	
	console.log("targetPageNum: "+targetPageNum);
	
	pageNum = targetPageNum;
	
	showList(pageNum);
	})


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//replyService getList

/* replyService.getList({bno:bnoValue, page:1}, function(list){
	
	for(var i = 0, len = list.length||0; i< len; i++){
		console.log(list[i]);
	}
}) */

//for replyService add test

/* replyService.add(
		{reply:"JS Test", replyer:"tester", bno:bnoValue},
		function(result){
			alert("RESULT : "+ result);
		}
		); */

//replyService remove

/* replyService.remove(27, function(count) {
	
	console.log(count);
	
	if(count === "success") {
		alert('REMOVED');
	}
}, function(err) {
	alert('ERROR...');
}); */

//replyService update

/* replyService.update({
	rno : 61,
	bno : bnoValue,
	reply : "Modified Reply...."
}, function(result){
	alert('수정 완료......');
}); */

//replyService get

/* replyService.get(81, function(data){
	console.log(data);
}) */

});
</script>
<!-- <script>

$(document).ready(function(){
	

var replyUL = $(".chat");

showList(1);

function showList(page) {
	
	replyService.getList({bno:bnoValue, page:page||1}, function(list){
	
		var str="";
		if(list == null || list.length == 0){
			replyUL.html("");
			
			return;
		}
		for(var i = 0, len = list.length||0; i < len; i++) {
			str = str + "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			str = str + "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
			str = str + "<small class='pull-right text-muted'>"+list[i].replyDate+"</small></div>";
			str = str + "<p>"+list[i].reply+"</p></div></li>";
		}
		
		replyUL.html(str);
	}); //end function
	
}//end showList

});
</script> -->


</body>

</html>
