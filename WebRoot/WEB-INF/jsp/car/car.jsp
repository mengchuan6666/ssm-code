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
    ><a href="#" class="c_66">我的购物车</a>
</div>
<div class="width1200 hidden_yh center_yh font20">全部商品<font class="red">（${fn:length(list)}）</font> </div>
<div class="width1198 hidden_yh center_yh" style="border: 1px solid #ddd;margin-top: 18px;min-height: 300px;">
    <div class="width100 hidden_yh font14" style="height: 32px;line-height: 32px;
    background: #f0f0f0;text-indent: 21px;color: #000; font-weight: 600;border-bottom: 1px solid #ddd;">商品详情</div>
    <div class="width100 hidden_yh fon14" style="height: 42px;line-height: 42px;border-bottom: 1px solid #ddd;">
        <div class="left_yh tcenter font14" style="width: 486px;">商品</div>
        <div class="left_yh tcenter font14" style="width: 175px;">价格</div>
        <div class="left_yh tcenter font14" style="width: 175px;">数量</div>
        <div class="left_yh tcenter font14" style="width: 175px;">小计</div>
        <div class="left_yh tcenter font14" style="width: 175px;">操作</div>
    </div>
    <c:forEach items="${list}" var="data" varStatus="l">
        <div class="speCific" data-id="${data.id}">
            <div class="xzWxz">
                <b><img src="${ctx}/resource/user/images/xzwxz.png"></b>
            </div>
            <div class="xzSp">
                <img src="${data.item.url1}">
                <div class="xzSpIn">
                    <h3 class="font16 c_33 font100">${data.item.name}</h3>
                </div>
            </div>
            <div class="xzJg">
                ￥<font>${data.price}</font>
            </div>
            <div class="xzSl">
                <div class="xzSlIn">
                    <b class="Amin">减</b>
                    <input type="text" value="${data.num}" readonly class="cOnt">
                    <b style="border-right: none;border-left:1px solid #ddd;" class="Aadd">加</b>
                </div>
            </div>
            <div class="xzXj">￥<font></font></div>
            <div class="xzSz">
                <div class="xzCzIn">
                    <a href="javascript:void(0)" class="Dels" data-id="${data.id}">删除</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div class="width1198 center_yh" style="height: 60px;background: #f0f0f0;border:1px solid #ddd;margin-top:40px;">
    <div class="center_yh hidden_yh" style="width: 1178px;height: 60px;margin-left: 20px;">
        <div class="ifAll"><b><img src="${ctx}/resource/user/images/xzwxz.png"></b><font>全选</font></div>
        <div class="ifDel">删除</div>
        <div class="sXd">
            <div class="sXd1">已选商品（<font style="color: #cb1c20">0</font> ）</div>
            <div class="sXd2">合计（不含运费）：￥<font style="color: #cb1c20" id="zjJg">0</font> </div>
            <a href="javascript:void(0)" class="ifJs" onclick="ifJs()">结算</a>
        </div>
    </div>
</div>
<script>
    //总的子项数量
    var es = $(".speCific").length;
    //给小计赋值
    (function cx() {
        for(var a=0;a<es;a++){
            var lt = $(".xzJg").eq(a).find("font").html();
            var num = $(".xzSl").eq(a).find("input").val();
            var xj = lt*num;
            $(".xzXj").eq(a).find("font").html(xj);
        }
    })();


    //选择或不选择一项
    $(".xzWxz").click(function () {
        if($(this).hasClass("on")){
            $(this).removeClass("on");
        }else{
            $(this).addClass("on");
        }
        var ty = $(".xzWxz.on").length;
        $(".sXd1").find("font").html(ty);
        if(ty==es){
            $(".ifAll").addClass("on");
        }else{
            $(".ifAll").removeClass("on");
        }
        jsZj();
    });

    //计算总计
    function jsZj(){
        var total = 0;
        $(".xzWxz.on").each(function () {
           var price = $(this).parent().find(".xzJg").find("font").html();
            var num = $(this).parent().find(".xzSl").find("input").val();
            total += price*num;
        });
        $("#zjJg").html(sswr(total));
    }

    //保留两位小数
    function sswr(num) {
        return num.toFixed(2);
    }

    $(".Aadd").click(function () {
       var t = $(this).siblings(".cOnt").val()*1;
       var price = $(this).parent().parent().siblings(".xzJg").find("font").html()*1;
       t++;
        $(this).siblings(".cOnt").val(t);
        $(this).parent().parent().siblings(".xzXj").find("font").html(sswr(price*t));
        jsZj();
    });

    $(".Amin").click(function () {
        var t = $(this).siblings(".cOnt").val()*1;
        var price = $(this).parent().parent().siblings(".xzJg").find("font").html()*1;
        t--;
        if(t<1){
            t=1;
        }
        $(this).siblings(".cOnt").val(t);
        $(this).parent().parent().siblings(".xzXj").find("font").html(sswr(price*t));
        jsZj();
    });

    $(".ifAll").click(function () {
       if($(".ifAll").hasClass("on")){
           $(this).removeClass("on");
           $(".xzWxz").removeClass("on");
           $(".sXd1").find("font").html(0);
       }else{
           $(this).addClass("on");
           $(".xzWxz").addClass("on");
           $(".sXd1").find("font").html(es);
       }
       jsZj();
    });

    //单项删除
    $(".Dels").click(function () {
       var id = $(this).attr("data-id");
       $.ajax({
           type:"POST",
           url:"${ctx}/car/delete?id="+id,
           contentType:"application/json",
           success:function (result) {
           }
       });
        alert("删除成功");
        $(this).parent().parent().parent().remove();
        jsZj();
    });

    //批量删除
    $(".ifDel").click(function () {
        $(".xzWxz.on").each(function () {
            var id = $(this).parent().attr("data-id");
            $.ajax({
                type:"POST",
                url:"${ctx}/car/delete?id="+id,
                contentType:"application/json",
                success:function (result) {
                }
            });
        });
        alert("删除成功");
        $(".xzWxz.on").parent().remove();
        jsZj();
    });

    /**
     * 结算--进入购买流程
     */
    function ifJs() {
        var arr = new Array();
        $(".xzWxz.on").each(function () {
           var $id = $(this).parent().attr("data-id");
           var $num = $(this).parent().find(".xzSl").find("input").val();
           var obj = new Object();
           obj.id = $id;
           obj.num = $num;
           arr.push(obj);
        });
        if(arr.length==0){
            alert("请至少选择一个商品结算");
            return false;
        }
        $.ajax({
            type:"POST",
            url:"${ctx}/itemOrder/exAdd",
            data:JSON.stringify(arr),
            contentType:"application/json",
            success:function (result) {
                if(result.res == 0){
                    alert("请登录");
                    window.location.href="${ctx}/login/uLogin";
                }else if(result.res == 2){
                    alert("请编辑地址");
                }else{
                    alert("购买成功");
                    window.location.reload();
                }
            }
        });
    }
</script>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>



















