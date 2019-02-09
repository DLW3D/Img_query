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
    function checkEmpty(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    $(function(){
        $("#addForm").submit(function(){
            if(!checkEmpty("name","图片名称"))
                return false;
            if(!checkEmpty("image","上传图片"))
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
            <div class="panel-heading">添加图片</div>
            <div class="panel-body">
                <form method="post" action="addPic" enctype="multipart/form-data" id="addForm">
                    <table class="table table-bordered">
                        <tr>
                            <td>图片名称</td>
                            <td><input name="name" type="text" placeholder="不可修改" id="name" /></td>
                        </tr>
                        <tr>
                            <td>上传图片</td>
                            <td>
                                <input name="image" accept="image/*" type="file" id="image" />
                            </td>
                        </tr>
                        <tr class="submitTR">
                            <td colspan="2" align="center">
                                <c:if test="${!empty user}">
                                    <input type="hidden" name="uid" value="${user.uid}">
                                </c:if>
                                <button type="submit" class="btn btn-success">提 交</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>