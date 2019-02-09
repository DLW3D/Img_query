<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="header.jsp"%>
<title>搜索图片</title>
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
        <li><a href="/search">图片搜索</a></li>
        <li class="active">主页</li>
        <span class="pull-right">
            <c:if test="${!empty user}">
                这是你的用户名:
                <a href="login">${user.name}</a>
                你不喜欢也没办法,反正不能改
                <a href="logout">退出</a>
            </c:if>
            <c:if test="${empty user}">
                你可以:
                <a href="login">登录</a>
                <a href="register">注册</a>
            </c:if>
        </span>
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
                            <img width="40px" src="img/small/${p.pid}.jpg">
                        </td>
                        <td>${p.name}</td>
                        <td>
                            <c:forEach items="${p.picTypes}" var="t"><a href="/search?keyword=${t.type_name}">
                                    ${t.type_name}</a>;
                            </c:forEach>
                        </td>
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
                            <table align="center" class="table table-bordered">
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
