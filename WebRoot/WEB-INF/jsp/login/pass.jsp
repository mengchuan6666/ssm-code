<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
    <%@include file="/common/utop.jsp"%>
<!--导航条-->
<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
            <a href="${ctx}/login/uIndex">首页</a>
            <a href="${ctx}/news/list">公告</a>
            <a href="${ctx}/message/add">留言</a>
        </div>
    </div>
</div>

<div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    <span>当前位置：</span><a href="${ctx}/login/uIndex" class="c_66">首页</a>
    ><a href="#" class="c_66">个人中心</a>
    ><a href="#" class="c_66">修改密码</a>
</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipNav">
            <a href="${ctx}/user/view">个人信息</a>
            <a href="${ctx}/itemOrder/my">我的订单</a>
            <a href="${ctx}/sc/findBySql">商品收藏</a>
            <a href="${ctx}/login/pass" class="on">修改密码</a>
        </div>
        <div id="vipRight">
            <div class="fon24" style="height: 60px;line-height: 60px;text-indent: 50px;background: #f5f8fa;border-bottom: 1px solid #ddd;">
                修改密码
            </div>
            <input type="hidden" id="yuan" value="${obj.passWord}">
            <div class="bj_fff hidden_yh" style="width: 838px;border:1px solid #ddd; margin-top: 30px;padding: 50px;">
                <div class="width100" style="height: 32px;line-height: 32px;">
                    <div class="left_yh font16 tright" style="width: 120px;">
                        <font class="red">*</font>旧密码：
                    </div>
                    <input type="password" id="jiu" style="width: 243px;border: 1px solid #ddd; outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                    <div class="left_yh font16 tright" style="width: 120px;">
                        <font class="red">*</font>新密码：
                    </div>
                    <input type="password" id="xin" style="width: 243px;border: 1px solid #ddd; outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                    <div class="left_yh font16 tright" style="width: 120px;">
                        <font class="red">*</font>确认新密码：
                    </div>
                    <input type="password" id="que" style="width: 243px;border: 1px solid #ddd; outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                    <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 con" style="width: 244px;height: 33px;line-height: 33px;margin-left:120px;">
                        保存
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/common/ufooter.jsp"%>
</body>
<script>
    $(".con").click(function(){
        var yuan = $("#yuan").val();
        var jiu = $("#jiu").val();
        var xin = $("#xin").val();
        var que = $("#que").val();
        if(jiu==null||jiu==''){
            alert("旧密码不能为空");
            return false;
        }
        if(xin==null||xin==''){
            alert("新密码不能为空");
            return false;
        }
        if(que==null||que==''){
            alert("确认密码不能为空");
            return false;
        }
        if(jiu!=yuan){
            alert("旧密码输入不正确");
            return false;
        }
        if(xin==yuan){
            alert("新密码和旧密码不能一样");
            return false;
        }
        if(xin!=que){
            alert("新密码和确认密码输入不一致");
            return false;
        }
        $.ajax({
           type:"POST",
           url:"${ctx}/login/upass.do",
           data:{
               "password":xin
           },
            success:function (result) {
                if(result.res==0){
                    alert("请登录");
                }else{
                    alert("修改成功,请重新登录");
                }
                top.location.href = "${ctx}/login/uLogin";
            }
        });
    });
</script>
</html>



















