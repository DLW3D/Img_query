<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="header.jsp"%>
<title>注册</title>
<script>
    $(function(){
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility","visible");
        </c:if>
        $(".registerForm").submit(function(){
            if(0==$("#name").val().length){
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            return true;
        });
    })
</script>

<body>

    <ol class="breadcrumb">
        <li><a href="/search">图片搜索</a></li>
        <li class="active">登录</li>
    </ol>

    <div class="container">
        <div class="panel panel-warning editDiv">
            <div class="panel-heading">登录</div>
            <div class="panel-body">
                <form method="post" action="/login" enctype="multipart/form-data" class="registerForm">

                    <div class="registerErrorMessageDiv" style="visibility: hidden;">
                        <div class="alert alert-danger" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                            <span class="errorMessage"></span>
                        </div>
                    </div>

                    <table class="table table-bordered">
                        <tr>
                            <td>用户名</td>
                            <td><input name="name" type="text" id="name" /></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input name="password" type="password" id="password" /></td>
                        </tr>
                        <tr class="submitTR">
                            <td colspan="2" align="center">
                                <button type="submit" class="btn btn-success">登  录</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>