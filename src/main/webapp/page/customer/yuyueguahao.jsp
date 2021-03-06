
<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>预约挂号</title>

<link href="${contextPath}/css/bootstrap.min14ed.css" rel="stylesheet">
<link href="${contextPath}/css/font-awesome.min93e3.css"
	rel="stylesheet">
<link href="${contextPath}/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="${contextPath}/css/plugins/clockpicker/clockpicker.css"
	rel="stylesheet">
<link href="${contextPath}/css/animate.min.css" rel="stylesheet">
<link href="${contextPath}/css/style.min862f.css" rel="stylesheet">
<link href="${contextPath}/css/plugins/iCheck/custom.css"
	rel="stylesheet">


</head>

<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-2">
				<div class="ibox float-e-margins">
					<div class="ibox-content mailbox-content">
						<div class="file-manager">
							<a class="btn btn-block btn-primary compose-mail" href="${contextPath}/page/customer/customerMain.jsp">用户</a>
							<div class="space-25"></div>
							<ul class="folder-list m-b-md" style="padding: 0">
								<li><a href="${contextPath}/page/customer/UserInfo.jsp">
										<i class="fa fa-user "></i> 用户信息
								</a></li>
								<li><a href="${contextPath}/page/customer/department.jsp">
										<i class="fa fa-hospital-o"></i> 科室查询
								</a></li>
								<li><a href="${contextPath}/page/customer/doctor.jsp">
										<i class="fa fa-user-md"></i> 医生查询
								</a></li>
								<li><a href="${contextPath}/page/customer/yuyueguahao.jsp">
										<i class="fa fa-calendar"></i> 预约挂号
								</a></li>
								<li><a href="${contextPath}/page/customer/yyManage.jsp"> <i class="fa fa-cog"></i>
										预约管理
								</a></li>
							</ul>

							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-10">
				<div class="ibox">
					<div class="ibox-content">
						<div class="row m-b-sm m-t-sm">
							<div class="col-md-12">
								<div class="input-group">
									<input type="text" placeholder="请输入医生姓名"
										class="input-sm form-control" id="doctorname"
										style="margin-left: 10px;"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary"
											onclick="searchDoctor()">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="project-list">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td class="project-completion">
											<div id="data_1">
												<div class="input-group date">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input type="text"
														class="form-control" value="" id="choosedate"
														placeholder="请选择日期">
												</div>
											</div>
										</td>
										<td class="project-completion">
											<div class="input-group clockpicker" data-autoclose="true">
												<input type="text" class="form-control" value=""
													id="chooseclock" placeholder="请选择时间"> <span
													class="input-group-addon"> <span
													class="fa fa-clock-o"></span>
												</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="yuyueguahaoTable"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${contextPath}/js/jquery.min.js"></script>
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script src="${contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${contextPath}/js/content.min.js?v=1.0.0"></script>
	<script
		src="${contextPath}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/js/plugins/clockpicker/clockpicker.js"></script>
	<script src="${contextPath}/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${contextPath}/js/demo/form-advanced-demo.min.js"></script>
	<script src="${contextPath}/js/demo/layer-demo.min.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

	<script>
    	
    var contextPath="<%=contextPath%>";

		$(function() {

			$.ajax({
				url : contextPath + "/Customer/yuyueguahao",
				type : "POST",
				dataType : "text",
				success : function(datas) {
					$("#yuyueguahaoTable").html(datas);

				}
			});
		});

		function searchDoctor() {

			var dname = $("#doctorname").val();

			$.ajax({
				url : contextPath + "/Customer/yuyueSearchDoctor",
				type : "POST",
				data : {
					"dname" : dname
				},
				dataType : "text",
				success : function(datas) {
					$("#yuyueguahaoTable").html(datas);
				}
			});
		}
		
		function yuyue(a){
			
			var jnumber=a;
			var ydate=$("#choosedate").val();
			var ytime=$("#chooseclock").val();
			
			$.ajax({
				url : contextPath + "/Customer/yuyue",
				type : "POST",
				data : {
					"jnumber" : jnumber,"ydate":ydate,"ytime":ytime
				},
				dataType : "text",
				success : function(datas) {
					if(datas==1){
						parent.layer.msg('预约成功！');
						$("#"+a).html('已预约');
					}
					if(datas==0){
						parent.layer.msg('请完善个人信息后再预约！');
					}
					if(datas==2){
						parent.layer.msg('请选择日期和时间！');
					}
				}
			});
			
		}
	</script>

</body>

</html>
