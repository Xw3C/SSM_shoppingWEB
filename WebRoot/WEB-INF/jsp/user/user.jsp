<%@ taglib prefix="pa" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
    <form action="${ctx}/user/findBySql" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px">
                <li>
                    <input type="text" ,placeholder="请输入用户名" name="userName" class="input" value="${obj.userName}"
                           style="width: 250px;line-height: 17px;display: inline-block"/>
                    <a href="javascript:void(0);" onclick="changeSearch()" class="button border-main icon-search">搜索</a>
                </li>
            </ul>
        </div>
    </form>

    <table class="table table-hover text-center">
        <tr>
            <th>用户名</th>
            <th>用户密码</th>
            <th>手机号</th>
            <th>真实姓名</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${pagers.datas}" var="data" varStatus="1">
            <tr>
                <td>${data.userName}</td>
                <td>${data.passWord}</td>
                <td>${data.phone}</td>
                <td>${data.realName}</td>
                <td>${data.sex}</td>
                <td>${data.email}</td>
                <td>${data.address}</td>
                <td>
                    <a class="button border-main" href="${ctx}/user/update?id=${data.id}"><span class="icon-edit">修改用户信息</span> </a>
                </td>

            </tr>
        </c:forEach>
        <tr>

            <td colspan="8">
                <div class="pagelist">
                    <%--分页开始--%>
                    <pg:pager url="${ctx}/user/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="15" export="curPage=pageNumber">
                        <pa:last>
                            共${pagers.total}记录，共${pageNumber}页
                        </pa:last>
                        当前第${curPage}页
                        <pa:first>
                            <a href="${pageUrl}">首页</a>
                        </pa:first>
                        <pg:prev>
                            <a href="${pageUrl}上一页"
                        </pg:prev>
                        <pg:pages>
                            <c:choose>
                                <c:when test="${curPage eq pageNumber}">
                                    <font color="red">[${pageNumber}]</font>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageUrl}">${pageNumber}</a>
                                </c:otherwise>
                            </c:choose>
                        </pg:pages>
                        <pa:next>
                            <a href="${pageUrl}">下一页</a>
                        </pa:next>
                        <pa:last>
                            <c:choose>
                                <c:when test="${curPage eq pageNumber}">
                                    <font color="red">尾页</font>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageUrl}">尾页</a>
                                </c:otherwise>
                            </c:choose>
                        </pa:last>
                    </pg:pager>
                </div>
            </td>
        </tr>
    </table>
</div>

</body>

<script>
    function changeSearch() {
        $("#listform").submit();
    }
</script>
</html>