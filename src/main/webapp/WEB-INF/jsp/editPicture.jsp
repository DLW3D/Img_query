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
    function checkEmpty(id){
        var value = $("#"+id).val();
        if(value.length==0){
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    $(function(){
        $("#addName").submit(function(){
            if(!checkEmpty("name"))
                return false;
            return true;
        });
        $("#addType").submit(function(){
            if(!checkEmpty("type"))
                return false;
            return true;
        });
    });
</script>

<body>

    <ol class="breadcrumb">
        <li><a href="/search">图片搜索</a></li>
        <li class="active">编辑图片</li>
    </ol>

    <div class="container">
        <div class="panel panel-warning editDiv" style="width:400px;margin:0px auto;">
            <div class="panel-heading">编辑图片</div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <td>图片</td>
                        <td><img width="40px" src="img/small/${p.pid}.jpg"></td>
                    </tr>
                    <tr>
                        <td>图片名称</td>
                        <td>${p.name}</td>
                    </tr>
                    <tr>
                        <td>图片别名</td>
                        <td>
                            <c:forEach items="${p.picNicknames}" var="n">
                                <a href="/search?keyword=${n.nickname}">${n.nickname}(<a href="/deleteNickname?nid=${n.nid}">删除</a>);</a>
                            </c:forEach>
                            <form method="post" action="/addNickname" id="addName">
                                <input name="nickname" value="" type="text" class="form-control" placeholder="添加别名..." id="name">
                                <input type="hidden" name="pid" value="${p.pid}">
                                <button class="btn btn-success" type="submit">添加</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>图片分类</td>
                        <td>
                            <c:forEach items="${p.picTypes}" var="t">
                                <a href="/search?keyword=${t.type_name}">${t.type_name}(<a href="/deleteType?tid=${t.tid}">删除</a>);</a>
                            </c:forEach>
                            <form method="post" action="/addType" id="addType">
                                <input name="type_name" value="" type="text" class="form-control" placeholder="添加分类..." id="type">
                                <input type="hidden" name="pid" value="${p.pid}">
                                <button class="btn btn-success" type="submit">添加</button>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>