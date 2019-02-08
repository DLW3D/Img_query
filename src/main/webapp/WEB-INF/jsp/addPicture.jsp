<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script>
    $(function() {
        $("#editForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
//			if (!checkEmpty("subTitle", "小标题"))
//				return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
</script>

<body>

    <ol class="breadcrumb">
        <li><a href="/search">图片搜索</a></li>
        <li class="active">添加图片</li>
    </ol>

    <div class="container">
        <div class="panel panel-warning editDiv">
            <div class="panel-heading">编辑图片</div>
            <div class="panel-body">
                <form method="post" id="editForm" action="editPicture">
                    <table class="editTable">
                        <tr>
                            <td>图片名称</td>
                            <td><input id="name" name="name" value="${p.name}"
                                       type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>产品小标题</td>
                            <td><input id="subTitle" name="subTitle" type="text"
                                       value="${p.subTitle}"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>原价格</td>
                            <td><input id="originalPrice" value="${p.originalPrice}" name="originalPrice" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>优惠价格</td>
                            <td><input id="promotePrice"  value="${p.promotePrice}" name="promotePrice" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>库存</td>
                            <td><input id="stock"  value="${p.stock}" name="stock" type="text"
                                       class="form-control"></td>
                        </tr>

                        <tr class="submitTR">
                            <td colspan="2" align="center">
                                <input type="hidden" name="id" value="${p.id}">
                                <input type="hidden" name="cid" value="${p.category.id}">
                                <button type="submit" class="btn btn-success">提 交</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>