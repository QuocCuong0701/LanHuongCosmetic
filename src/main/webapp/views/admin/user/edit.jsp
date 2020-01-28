<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value="/admin-home"></c:url>">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa thông tin sản phẩm</li>
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
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="category_id" name="category_id">
                                        <c:if test="${empty model.category_id}">
                                            <option value="">Chọn loại sản phẩm</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.category_id}">${item.category_name}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty model.category_id}">
                                            <option value="">Chọn loại sản phẩm</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.category_id}" <c:if test="${item.category_id == model.category_id}">selected="selected"</c:if>>
                                                        ${item.category_name}
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <br/><br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="product_name" name="product_name" value="${model.product_name}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình ảnh</label>
                                <div class="col-sm-9" style="margin-bottom: 15px">
                                    <input type="file" value="${model.product_image}" id="product_image" name="product_image" onchange="chooseImage(event)" accept=".png, .jpg, .jpeg"
                                           size="50" style="width: 200px; display: inline"/>
                                    <img id="show_image" src="${model.product_image}" alt=""  style="width: 100px; border: solid 1px #d5d5d5" />
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                <div class="col-sm-9">
                                    <c:if test="${model.product_id != 0}">
                                        <input type="text" class="form-control" id="product_price" name="product_price" value="${model.product_price}"/>
                                    </c:if>
                                    <c:if test="${model.product_id == 0}">
                                        <input type="text" class="form-control" id="product_price" name="product_price" value=""/>
                                    </c:if>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                <div class="col-sm-9">
                                    <textarea rows="" cols="" id="product_description" name="product_description" style="width: 820px;height: 175px">${model.product_description}</textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Chi tiết</label>
                                <div class="col-sm-9">
                                    <textarea rows="" cols="" id="product_detail" name="product_detail" style="width: 820px;height: 175px">${model.product_detail}</textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <c:if test="${model.product_id != 0}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật sản phẩm" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${model.product_id == 0}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm sản phẩm" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                </div>
                            </div>
                            <input type="hidden" value="${model.product_id}" id="product_id" name="product_id"/>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	var editor = '';
	var editor1 = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'product_description');
	});
    $(document).ready(function(){
        editor1 = CKEDITOR.replace( 'product_detail');
    });

    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        $('#product_image').attr('value', document.getElementById('product_image').defaultValue);
        data["product_image"] = document.getElementById('product_image').defaultValue;
        data["product_description"] = editor.getData();
        data["product_detail"] = editor1.getData();
        var product_id = $('#product_id').val();
        if (product_id == "0") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });
    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${ProductURL}?type=edit&id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${ProductURL}?type=list&maxPageItem=10&page=1&message=error_system";
            }
        });
    }

    function chooseImage(evt) {
        evt.stopPropagation();
        evt.preventDefault();
        var files = evt.target.files;
        var file = files[0];
        var fileReader = new FileReader();

        fileReader.onload = function(progressEvent) {
            var url = fileReader.result;
            var myImg = document.getElementById("product_image");
            $('#show_image').attr('src', progressEvent.target.result);
            $('#product_image').attr('value', url);
            myImg.src = url;
        }
        fileReader.readAsDataURL(file);
    };

    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${ProductURL}?type=edit&product_id="+result.product_id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${ProductURL}?type=list&maxPageItem=10&page=1&message=error_system";
            }
        });
    }

    /*function toDataURL(url, callback) {
        var httpRequest = new XMLHttpRequest();
        httpRequest.onload = function() {
            var fileReader = new FileReader();
            fileReader.onloadend = function() {
                callback(fileReader.result);
            }
            fileReader.readAsDataURL(httpRequest.response);
        };
        httpRequest.open('GET', url);
        httpRequest.responseType = 'blob';
        httpRequest.send();
    }
    toDataURL('https://www.tutorialspoint.com/videotutorials/images/tutor_connect_home.jpg', function(dataUrl) {
        document.write('Result in string:', dataUrl)
    });*/


</script>
</body>
</html>
