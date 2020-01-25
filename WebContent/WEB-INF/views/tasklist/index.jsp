<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url= "../layout/app.jsp">
    <c:param name="content">
        <h2>タスクリスト</h2>
        <ul>
            <c:forEach var="tasklist" items="${tasklist}">
                <li>
                    <a href="${pageContext.request.contextPath}/show?id=${tasklist.id}">
                        <c:out value="${tasklist.id}" />
                    </a>
                    :<c:out value="${tasklist.content}"></c:out>
                </li>
            </c:forEach>
        </ul>

        <div id="pagination">
            (全 ${tasklist_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((tasklist_count -1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="${pageContext.request.contextPath}/new">新規タスクの追加</a></p>
    </c:param>
</c:import>