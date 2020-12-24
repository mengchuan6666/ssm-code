<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户登录</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
<div class="width100 hidden_yh" style="height: 573px;background: url('${ctx}/resource/user/images/bj.jpg') no-repeat center">
    <div class="width1200 hidden_yh center_yh" style="margin-top: 75px">
        <div class="right_yh bj_fff" style="width:408px;height: 438px;">
            <form action="${ctx}/login/utoLogin" method="post">
                <h3 class="tcenter font30 c_33" style="font-weight: 100;margin-top: 36px;margin-bottom: 36px;">账户登录</h3>
                <div class="center_yh hidden_yh" style="width: 336px;">
                    <div class="width100 box-sizing hidden_yh" style="height: 44px;border:1px solid #c9c9c9;margin-bottom: 34px;">
                        <img src="${ctx}/resource/user/images/rw.jpg" alt="" class="left_yh" width="42" height="42">
                        <input type="text" placeholder="请输入用户名或手机号" name="userName" value="" style="border: 0;width: 292px;height: 42px; font-size: 16px;text-indent: 22px;">
                    </div>
                    <div class="width100 box-sizing hidden_yh" style="height: 44px;border:1px solid #c9c9c9;margin-bottom: 34px;">
                        <img src="${ctx}/resource/user/images/pass.jpg" alt="" class="left_yh" width="42" height="42">
                        <input type="password" placeholder="请输入密码" name="passWord" value="" style="border: 0;width: 292px;height: 42px; font-size: 16px;text-indent: 22px;">
                    </div>
                    <input type="submit" value="登录" class="center_yh" style="width: 100%;height: 43px;font-size: 16px;background: #dd4545;outline: none;border: 0;color: #fff; cursor:pointer;">
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>



















