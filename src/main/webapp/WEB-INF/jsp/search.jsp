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
        $("button.commButton").click(function(){
            var pid = $(this).attr("pid");
            var attitude = $("label[pid='"+pid+"'].active").attr("attitude");
            var comment = $("textarea[pid='"+pid+"']").val();
            //alert(attitude + "|||" + comment);
            $.post(
                "addComment",
                {"pid":pid,"attitude":attitude,"comment":comment},
                function(result){
                    if("success"==result)
                        location.reload();
                }
            );
        });
        $("a.get-picture").click(function () {
            $.post(
                "addUsed",{"pid":$(this).attr("pid")}
            )
        })
    });

</script>
<body>

    <ol class="breadcrumb">
        <li><a href="/search">图片搜索</a></li>
        <li class="active">主页</li>
        <%@include file="userTop.jsp"%>
    </ol>

    <div class="container">
        <div class="searchDiv">
            <form method="get" action="">
                <div class="input-group">
                    <input id="keyword" name="keyword"
                           value="<%String keyword = request.getParameter("keyword");%>${param.keyword}" type="text"
                           class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default btn-primary" type="submit">搜索</button>
                        <a class="btn btn-default" href="addPictureThird">上传图片</a>
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
                            <c:choose>
                                <c:when test="${empty p.url or p.url==''}">
                                    <img width="40px" src="img/small/${p.pid}.jpg">
                                </c:when>
                                <c:otherwise>
                                    <img width="40px" src="${p.url}">
                                </c:otherwise>
                            </c:choose>
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
                            <a href="editPicture?pid=${p.pid}" class="btn btn-primary btn-xs">编辑</a>
                            <a
                            <c:choose>
                                <c:when test="${empty p.url or p.url==''}">
                                    href="img/original/${p.pid}.jpg"
                                </c:when>
                                <c:otherwise>
                                    href="${p.url}"
                                </c:otherwise>
                            </c:choose>
                                    class="btn btn-success get-picture" pid="${p.pid}">查看大图</a>
                            <button pid="${p.pid}" class="checkComment btn btn-success">查看评论</button>
                        </td>
                    </tr>
                    <tr class="CommentTR" pid="${p.pid}" style="display: none;">
                        <td colspan="10" align="center">
                            <div style="padding:20px;">
                            <table align="center" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td>态度</td>
                                        <td>评论者</td>
                                        <td>评价</td>
                                        <td>评论时间</td>
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
                                <tr>
                                    <td align="left">
                                        <div class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-default" pid="${p.pid}" attitude="1">
                                                <input type="radio">赞
                                            </label>
                                            <label class="btn btn-default" pid="${p.pid}" attitude="-1">
                                                <input type="radio">踩
                                            </label>
                                            <label class="btn btn-default active " pid="${p.pid}" attitude="0">
                                                <input type="radio">无可奉告
                                            </label>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <textarea pid="${p.pid}" rows="1" class="form-control"></textarea>
                                    </td>
                                    <td align="right">
                                        <button class="btn commButton" pid="${p.pid}">提交评论</button>
                                    </td>
                                </tr>
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
