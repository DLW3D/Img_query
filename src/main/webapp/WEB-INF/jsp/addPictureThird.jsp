<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="header.jsp"%>
<title>添加图片</title>
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
    var nameCheck = false;
    function checkName(callback){
        $.post(
            "isNameExist",
            {"name":$("#name").val()},
            function(result){
                if("success"==result)
                    result = true;
                else
                    result = false;
                callback(result);
            }
        );
    }

    $(function(){
        $("#addForm").submit(function(){
            if(!checkEmpty("name","图片名称"))
                return false;
            if(!nameCheck)
                return false;
            if(!checkEmpty("image","上传图片"))
                return false;
            var name = $("#name").val();
            var uid = $("#uid").val();
            var url;
            var formData = new FormData();
            formData.append("smfile",$("#image")[0].files[0]);
            //交由第三方处理
            $.ajax({
                url: "https://sm.ms/api/upload",
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function(){
                    var but = $("button.btn-success");
                    but.attr("disabled",true);
                    but[0].innerHTML = "上传中...";
                },
                success : function (result) {
                    //将处理数据返回数据库
                    if (result.code == "success"){
                        url = result.data.url;
                        $.post(
                            "addPicThird",
                            {"name":name,"uid":uid,"url":url},
                            function (result) {
                                location.href="editPicture?pid="+result;
                            }
                        );
                    }
                }
            });
            return false;
        });
        //实时检测重名问题
        $("#name").blur(function(){
            var check = $("#check");
            if ($(this).val() == "") {
                check.text("")
                return;
            }
            nameCheck = false;
            check.text("检测中...");
            checkName(function (result) {
                if(result){
                    nameCheck = true;
                    check.html("<div style='color: green'>名称可用✔</div>");
                }else {
                    nameCheck = false;
                    check.html("<div style='color: red'>重名✖</div>");
                }
            })
        });
    });
</script>

<body>

<ol class="breadcrumb">
    <li><a href="/search">图片搜索</a></li>
    <li class="active">添加图片</li>
    <%@include file="userTop.jsp"%>
</ol>

<div class="container">
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">添加图片</div>
        <div class="panel-body">
            <form method="post" action="" enctype="multipart/form-data" id="addForm">
                <table class="table table-bordered">
                    <tr>
                        <td>图片名称</td>
                        <td>
                            <input name="name" type="text" placeholder="不可修改" id="name" />
                            <div id="check" style="font-size: 12px"></div>
                        </td>
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
                                <input type="hidden" name="uid" value="${user.uid}" id="uid">
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