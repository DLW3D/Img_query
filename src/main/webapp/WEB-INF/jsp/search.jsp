<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script>
    $(function(){
        $("button.checkComment").click(function(){
            var pid = $(this).attr("pid");
            $("tr.CommentTR[pid="+pid+"]").toggle();
        });
    });

</script>
<body>

    <ol class="breadcrumb">
        <li><a href="admin_category_list">图片搜索</a></li>
        <li class="active">搜索</li>
    </ol>

    <div class="container">
        <div class="searchDiv">
            <form method="get" action="">
                <div class="input-group">
                    <input id="keyword" name="keyword"
                           value="<%String keyword = request.getParameter("keyword");%>${param.keyword}" type="text"
                           class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">搜索</button>
                    </span>
                </div>
            </form>
        </div>
        <div class="resultDiv">
            <table class="table table-striped table-bordered table-hover  table-condensed">
                <caption>基本的表格布局</caption>
                <thead>
                <tr>
                    <th>pid</th>
                    <th>图片</th>
                    <th>名称</th>
                    <th>分类</th>
                    <th>提供者</th>
                    <th>上传日期</th>
                    <th>使用次数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ps}" var="p">
                    <tr>
                        <td>${p.pid}</td>
                        <td>
                            <img width="40px" src="img/productSingle/${p.pid}.jpg">
                        </td>
                        <td>${p.name}</td>
                        <td><c:forEach items="${p.picTypes}" var="t"><a>${t.type_name}</a>;</c:forEach></td>
                        <td>${p.user.nickname}</td>
                        <td><fmt:formatDate value="${p.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${p.used}</td>
                        <td>
                            <button pid="${p.pid}" class="checkComment btn btn-primary btn-xs">查看评论</button>
                        </td>
                    </tr>
                    <tr class="CommentTR" pid="${p.pid}" style="display: none;">
                        <td colspan="10" align="center">
                            <div style="padding:20px;">
                            <table align="center">
                                <thead>
                                    <tr>
                                        <td style="padding:5px">态度</td>
                                        <td style="padding:5px">评论者</td>
                                        <td style="padding:5px">评价</td>
                                        <td style="padding:5px">评论时间</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${p.picComments}" var="c">
                                    <tr>
                                        <td align="left">
                                            ${c.attitude}
                                        </td>
                                        <td align="left">
                                            ${c.user.nickname}
                                        </td>
                                        <td>
                                            ${c.comment}
                                        </td>
                                        <td align="right">
                                            <fmt:formatDate value="${c.comm_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="pageDiv">
            <%@include file="page.jsp" %>
        </div>
    </div>
</body>
</html>
