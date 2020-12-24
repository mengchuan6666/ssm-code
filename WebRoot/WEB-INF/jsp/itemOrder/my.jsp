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
    ><a href="#" class="c_66">我的订单</a>
</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipNav">
            <a href="${ctx}/user/view">个人信息</a>
            <a href="${ctx}/itemOrder/my" class="on">我的订单</a>
            <a href="${ctx}/sc/findBySql">商品收藏</a>
            <a href="${ctx}/login/pass">修改密码</a>
        </div>
        <div id="vipRight">
            <div style="width: 938px;border:1px solid #ddd;background: #fff;">
                <div class="width100 hidden_yh" style="height: 74px;line-height: 74px;background: #f5f8fa;border-bottom: 1px solid #ddd;" id="navLt">
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange slect">全部订单（${fn:length(all)}）</span>
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange">已取消（${fn:length(yqx)}）</span>
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange">待发货（${fn:length(dfh)}）</span>
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange">待收货（${fn:length(dsh)}）</span>
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange">已收货（${fn:length(ysh)}）</span>
                </div>
                <!--全部订单-->
                <div class="allGoods width100 hidden_yh hhD" style="display: block;">
                    <c:forEach items="${all}" var="data" varStatus="l">
                        <div class="width100 hidden_yh">
                            <div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
                                <fmt:formatDate value="${data.addTime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
                                <c:if test="${data.status==0}">待发货</c:if>
                                <c:if test="${data.status==1}">已取消</c:if>
                                <c:if test="${data.status==2}">待收货</c:if>
                                <c:if test="${data.status==3}">已收货</c:if>
                            </div>
                            <c:forEach items="${data.details}" var="chil" varStatus="l">
                                <div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
                                    <img src="${chil.item.url1}" width="100" height="100" class="left_yh" style="padding-right: 10px">
                                    <div class="left_yh" style="width: 580px;">
                                        <h3 class="font18 c_33 font100">${chil.item.name}</h3>
                                        <p class="c_66 font16" style="margin-top: 16px;">折扣：${chil.item.zk}</p>
                                        <p class="red" style="margin-top: 10px;">￥${chil.item.price}</p>
                                    </div>
                                    <div class="right_yh">
                                        <c:if test="${data.status==3}">
                                            <a href="${ctx}/itemOrder/pj?id=${chil.itemId}" class="onfff block_yh tcenter font16 onHoverr" style="margin-top: 10px;padding-right: 6px;">
                                                去评价
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
                                <font class="font24">总金额</font>
                                <font class="font24 red">￥${data.total}</font>
                                <c:if test="${data.status==0}">
                                    <a href="${ctx}/itemOrder/qx?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        取消订单
                                    </a>
                                </c:if>
                                <c:if test="${data.status==1}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已取消
                                    </a>
                                </c:if>
                                <c:if test="${data.status==2}">
                                    <a href="${ctx}/itemOrder/sh?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        去收货
                                    </a>
                                </c:if>
                                <c:if test="${data.status==3}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已收货
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--已取消-->
                <div class="allGoods width100 hidden_yh hhD" style="display: none;">
                    <c:forEach items="${yqx}" var="data" varStatus="l">
                        <div class="width100 hidden_yh">
                            <div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
                                <fmt:formatDate value="${data.addTime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
                                <c:if test="${data.status==0}">待发货</c:if>
                                <c:if test="${data.status==1}">已取消</c:if>
                                <c:if test="${data.status==2}">待收货</c:if>
                                <c:if test="${data.status==3}">已收货</c:if>
                            </div>
                            <c:forEach items="${data.details}" var="chil" varStatus="l">
                                <div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
                                    <img src="${chil.item.url1}" width="100" height="100" class="left_yh" style="padding-right: 10px">
                                    <div class="left_yh" style="width: 580px;">
                                        <h3 class="font18 c_33 font100">${chil.item.name}</h3>
                                        <p class="c_66 font16" style="margin-top: 16px;">折扣：${chil.item.zk}</p>
                                        <p class="red" style="margin-top: 10px;">￥${chil.item.price}</p>
                                    </div>
                                    <div class="right_yh">
                                        <c:if test="${data.status==3}">
                                            <a href="${ctx}/itemOrder/pj?id=${chil.itemId}" class="onfff block_yh tcenter font16 onHoverr" style="margin-top: 10px;padding-right: 6px;">
                                                去评价
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
                                <font class="font24">总金额</font>
                                <font class="font24 red">￥${data.total}</font>
                                <c:if test="${data.status==0}">
                                    <a href="${ctx}/itemOrder/qx?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        取消订单
                                    </a>
                                </c:if>
                                <c:if test="${data.status==1}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已取消
                                    </a>
                                </c:if>
                                <c:if test="${data.status==2}">
                                    <a href="${ctx}/itemOrder/sh?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        去收货
                                    </a>
                                </c:if>
                                <c:if test="${data.status==3}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已收货
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <!--待发货-->
                <div class="allGoods width100 hidden_yh hhD" style="display: none;">
                    <c:forEach items="${dfh}" var="data" varStatus="l">
                        <div class="width100 hidden_yh">
                            <div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
                                <fmt:formatDate value="${data.addTime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
                                <c:if test="${data.status==0}">待发货</c:if>
                                <c:if test="${data.status==1}">已取消</c:if>
                                <c:if test="${data.status==2}">待收货</c:if>
                                <c:if test="${data.status==3}">已收货</c:if>
                            </div>
                            <c:forEach items="${data.details}" var="chil" varStatus="l">
                                <div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
                                    <img src="${chil.item.url1}" width="100" height="100" class="left_yh" style="padding-right: 10px">
                                    <div class="left_yh" style="width: 580px;">
                                        <h3 class="font18 c_33 font100">${chil.item.name}</h3>
                                        <p class="c_66 font16" style="margin-top: 16px;">折扣：${chil.item.zk}</p>
                                        <p class="red" style="margin-top: 10px;">￥${chil.item.price}</p>
                                    </div>
                                    <div class="right_yh">
                                        <c:if test="${data.status==3}">
                                            <a href="${ctx}/itemOrder/pj?id=${chil.itemId}" class="onfff block_yh tcenter font16 onHoverr" style="margin-top: 10px;padding-right: 6px;">
                                                去评价
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
                                <font class="font24">总金额</font>
                                <font class="font24 red">￥${data.total}</font>
                                <c:if test="${data.status==0}">
                                    <a href="${ctx}/itemOrder/qx?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        取消订单
                                    </a>
                                </c:if>
                                <c:if test="${data.status==1}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已取消
                                    </a>
                                </c:if>
                                <c:if test="${data.status==2}">
                                    <a href="${ctx}/itemOrder/sh?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        去收货
                                    </a>
                                </c:if>
                                <c:if test="${data.status==3}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已收货
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <!--待收货-->
                <div class="allGoods width100 hidden_yh hhD" style="display: none;">
                    <c:forEach items="${dsh}" var="data" varStatus="l">
                        <div class="width100 hidden_yh">
                            <div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
                                <fmt:formatDate value="${data.addTime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
                                <c:if test="${data.status==0}">待发货</c:if>
                                <c:if test="${data.status==1}">已取消</c:if>
                                <c:if test="${data.status==2}">待收货</c:if>
                                <c:if test="${data.status==3}">已收货</c:if>
                            </div>
                            <c:forEach items="${data.details}" var="chil" varStatus="l">
                                <div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
                                    <img src="${chil.item.url1}" width="100" height="100" class="left_yh" style="padding-right: 10px">
                                    <div class="left_yh" style="width: 580px;">
                                        <h3 class="font18 c_33 font100">${chil.item.name}</h3>
                                        <p class="c_66 font16" style="margin-top: 16px;">折扣：${chil.item.zk}</p>
                                        <p class="red" style="margin-top: 10px;">￥${chil.item.price}</p>
                                    </div>
                                    <div class="right_yh">
                                        <c:if test="${data.status==3}">
                                            <a href="${ctx}/itemOrder/pj?id=${chil.itemId}" class="onfff block_yh tcenter font16 onHoverr" style="margin-top: 10px;padding-right: 6px;">
                                                去评价
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
                                <font class="font24">总金额</font>
                                <font class="font24 red">￥${data.total}</font>
                                <c:if test="${data.status==0}">
                                    <a href="${ctx}/itemOrder/qx?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        取消订单
                                    </a>
                                </c:if>
                                <c:if test="${data.status==1}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已取消
                                    </a>
                                </c:if>
                                <c:if test="${data.status==2}">
                                    <a href="${ctx}/itemOrder/sh?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        去收货
                                    </a>
                                </c:if>
                                <c:if test="${data.status==3}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已收货
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--已收货-->
                <div class="allGoods width100 hidden_yh hhD" style="display: none;">
                    <c:forEach items="${ysh}" var="data" varStatus="l">
                        <div class="width100 hidden_yh">
                            <div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
                                <fmt:formatDate value="${data.addTime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
                                <c:if test="${data.status==0}">待发货</c:if>
                                <c:if test="${data.status==1}">已取消</c:if>
                                <c:if test="${data.status==2}">待收货</c:if>
                                <c:if test="${data.status==3}">已收货</c:if>
                            </div>
                            <c:forEach items="${data.details}" var="chil" varStatus="l">
                                <div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
                                    <img src="${chil.item.url1}" width="100" height="100" class="left_yh" style="padding-right: 10px">
                                    <div class="left_yh" style="width: 580px;">
                                        <h3 class="font18 c_33 font100">${chil.item.name}</h3>
                                        <p class="c_66 font16" style="margin-top: 16px;">折扣：${chil.item.zk}</p>
                                        <p class="red" style="margin-top: 10px;">￥${chil.item.price}</p>
                                    </div>
                                    <div class="right_yh">
                                        <c:if test="${data.status==3}">
                                            <a href="${ctx}/itemOrder/pj?id=${chil.itemId}" class="onfff block_yh tcenter font16 onHoverr" style="margin-top: 10px;padding-right: 6px;">
                                                去评价
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
                                <font class="font24">总金额</font>
                                <font class="font24 red">￥${data.total}</font>
                                <c:if test="${data.status==0}">
                                    <a href="${ctx}/itemOrder/qx?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        取消订单
                                    </a>
                                </c:if>
                                <c:if test="${data.status==1}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已取消
                                    </a>
                                </c:if>
                                <c:if test="${data.status==2}">
                                    <a href="${ctx}/itemOrder/sh?id=${data.id}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        去收货
                                    </a>
                                </c:if>
                                <c:if test="${data.status==3}">
                                    <a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
                                        已收货
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#navLt span").click(function () {
        var t = $(this).index();
        $(this).addClass("slect").siblings().removeClass("slect");
        $(".hhD").eq(t).css({display:"block"}).siblings(".hhD").css({display:"none"});
    });
</script>

<%@include file="/common/ufooter.jsp"%>
</body>
</html>



















