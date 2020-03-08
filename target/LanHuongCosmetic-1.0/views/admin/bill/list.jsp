<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-bill"/>
<c:url var="BillURL" value="/admin-bill"/>
<c:url var="BillDetailURL" value="/api-admin-billDetail"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách sản phẩm</title>
</head>

<body>
<div class="main-content">
    <form action="<c:url value='/admin-bill'/>" id="formSubmit" method="get">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="<c:url value="/admin-home"/>">Trang chủ</a>
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
                                        <button id="btnDelete" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa đơn hàng'>
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
                                            <th>Tên khách hàng</th>
                                            <th>Tổng hóa đơn</th>
                                            <th>Địa chỉ nhận hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Ngày đặt đơn</th>
                                            <th>Tình trạng đơn hàng</th>
                                            <th>Xem chi tiết</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${model.listResult}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${item.bill_id}" value="${item.bill_id}"/></td>
                                                <td>${item.full_name}</td>
                                                <td>${item.total} &#8363;</td>
                                                <td>${item.address}</td>
                                                <td>${item.phone}</td>
                                                <td>${item.date}</td>
                                                <td>
                                                    <c:if test="${item.status == false}">
                                                        <a class="confirmBtn btn btn-danger btn-edit" data-toggle="tooltip" title="Xác nhận đơn hàng" style="width: 120px;">
                                                            <i class="fa fa-pencil-square-o" aria-hidden="true"> Xác nhận</i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${item.status == true}">
                                                        <a class="confirmBtn btn btn-success btn-edit" data-toggle="tooltip"
                                                           title="Đơn hàng đã xác nhận" style="width: 120px;">
                                                            <i class="fa fa-check" aria-hidden="true"> Đã xác nhận</i>
                                                        </a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <a href="<c:url value="${BillDetailURL}?bill_id=${item.bill_id}"/>"
                                                        data-toggle="modal" class="btn btn-sm btn-primary billDetail">
                                                        <i class="fa fa-info-circle"></i>
                                                    </a>
                                                    <%--<a href="${BillURL}?type=list&bill_id=${item.bill_id}&maxPageItem=10&page=1&sortBy=asc&sortName=full_name"
                                                       id="btnBillDetail" data-toggle="modal" class="btn btn-sm btn-primary billDetail">
                                                        <i class="fa fa-info-circle"></i>
                                                    </a>--%>
                                                    <!-- Modal -->
                                                    <div class="modal fade billDetailModal" id="billDetailModal" role="dialog">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content" style="margin-top: 100px;">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <table class="table table-bordered">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Tên sản phẩm</th>
                                                                                <th>Giá</th>
                                                                                <th>Số lượng</th>
                                                                                <th>Tổng</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tBody"></tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a class="btn btn-success btn-edit btnConfirm" title="Xác nhận đơn hàng"
                                                                       href="<c:url value="${APIurl}?bill_id=${item.bill_id}"/>" style="width: 120px;" id="btnConfirm">
                                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"> Xác nhận</i>
                                                                    </a>
                                                                    <button type="button" class="btn btn-danger" title="Đóng" data-dismiss="modal">Đóng</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
<script>
	$(document).ready(function () {
		$('.billDetail').click(function (e) {
		    e.preventDefault();
			$('#billDetailModal').modal();
		});
	});

    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    var limit = 10;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('full_name');
                    $('#sortBy').val('asc');
                    $('#type').val('list');
                    $('#formSubmit').submit();
                }
            }
        });
    });

    $("#btnDelete").click(function () {
        var data = {};
        data['ids'] = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBill(data);
    });

    function deleteBill(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&message=error_system";
            }
        });
    }

    $('.billDetail').click(function (e) {
        e.preventDefault();
        $('#tBody').empty();
        let url = $(this).attr("href");
        $.get(url, function (data) {
            data.map(item=>{
                $('#tBody').append("<tr>" +
                    "<td>"+item.product_name+"</td>" +
                    "<td>"+item.product_price+"&#8363;</td>" +
                    "<td>"+item.quantity+"</td>" +
                    "<td>"+item.total+"&#8363;</td>" +
                    "</tr>");
                $('.btnConfirm').attr('href', "${APIurl}?bill_id="+item.bill_id+"")
            });
        });
    });

    $('#btnConfirm').click(function (e) {
        e.preventDefault();
        let url = $(this).attr("href");
        updateBill(url);
    });

    function updateBill(url) {
        $.ajax({
            url: url,
            type: 'PUT',
            contentType: 'application/json',
            success: function (result) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&sortName=date&sortBy=desc&message=update_success";
            },
            error: function (error) {
                window.location.href = "${BillURL}?type=list&maxPageItem=10&page=1&sortName=date&sortBy=desc&message=error_system";
            }
        });
    }

</script>
</body>
</html>