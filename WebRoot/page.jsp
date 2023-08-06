<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="pages">
    <span class="a1">total:${page.totalRows} rows，${page.totalPages} pages,per page ${page.pageSize} rows</span>

    <c:choose>
        <c:when test="${page.IsPrev()}">
            <a href="${page.prevPage}">previous page</a>
        </c:when>
        <c:otherwise>
            <a href="javascript:;" class="disabled">previous page</a>
        </c:otherwise>
    </c:choose>

    <c:forEach items="${page.pageNums}" var="p">
        <c:choose>
            <c:when test="${page.currentPage == p.page}">
                <a href="javascript:;" class="active">${p.page}</a>
            </c:when>
            <c:otherwise>
                <a href="${p.url}">${p.page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${page.IsNext()}">
            <a href="${page.nextPage}">next page</a>
        </c:when>
        <c:otherwise>
            <a href="javascript:;" class="disabled">next page</a>
        </c:otherwise>
    </c:choose>
</div>
