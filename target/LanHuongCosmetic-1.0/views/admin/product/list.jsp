<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Danh sách sản phẩm</title>
</head>

<body>
	<div class="main-content">
	<form action="<c:url value='/admin-product'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="<c:url value="/admin-home"></c:url>">Trang chủ</a>
						</li>
					</ul>
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty messageResponse}">
								<div class="alert alert-${alert}">
									${messageResponse}
								</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
											   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
											   title='Thêm sản phẩm' href='<c:url value="/admin-product?type=edit"/>'>
													<span>
														<i class="fa fa-plus-circle bigger-110 purple"></i>
													</span>
											</a>
											<button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
													data-toggle="tooltip" title='Xóa sản phẩm'>
													<span>
														<i class="fa fa-trash-o bigger-110 pink"></i>
													</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"></th>
													<th>Tên sản phẩm</th>
													<th>Hình ảnh</th>
													<th>Giá</th>
													<th>Mô tả</th>
													<th>Chi tiết</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="checkbox_${item.product_id}" value="${item.product_id}"></td>
														<td>${item.product_name}</td>
														<td><img src="<c:url value="${item.product_image}"/>" alt="" style="height: 100px"></td>
														<td>${item.product_price}</td>
														<td>${item.product_description}</td>
														<td>${item.product_detail}</td>
														<td>
															<c:url var="editURL" value="/admin-product">
																<c:param name="type" value="edit"/>
																<c:param name="product_id" value="${item.product_id}"/>
															</c:url>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật sản phẩm" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page"/>
										<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
										<input type="hidden" value="" id="sortName" name="sortName"/>
										<input type="hidden" value="" id="sortBy" name="sortBy"/>
										<input type="hidden" value="" id="type" name="type"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>
	</div>
	<!-- /.main-content -->
	<script>
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = 10;
		$(function () {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPages,
				visiblePages: 10,
				startPage: currentPage,
				onPageClick: function (event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('product_name');
						$('#sortBy').val('asc');
						$('#type').val('list');
						$('#formSubmit').submit();
					}
				}
			});
		});

		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			deleteNew(data);
		});

		function deleteNew(data) {
			$.ajax({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					window.location.href = "${ProductURL}?type=list&maxPageItem=10&page=1&message=delete_success";
				},
				error: function (error) {
					window.location.href = "${ProductURL}?type=list&maxPageItem=10&page=1&message=error_system";
				}
			});
		}
	</script>
</body>

</html>