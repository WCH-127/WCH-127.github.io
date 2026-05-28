<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>书籍列表 - 图书管理系统</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
            color: #495057;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: all 0.3s;
        }
        .badge-stock {
            font-size: 0.85rem;
            padding: 5px 12px;
        }
        .btn-add {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 8px 20px;
            border-radius: 8px;
        }
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-icon {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            padding: 20px;
            color: white;
        }

        /* ========== 新增：搜索框样式 ========== */
        .search-box {
            background: white;
            border-radius: 50px;
            padding: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            display: flex;
        }
        .search-box .form-control {
            border: none;
            border-radius: 50px 0 0 50px;
            padding: 12px 20px;
            flex: 1;
        }
        .search-box .form-control:focus {
            box-shadow: none;
        }
        .search-box .btn-search {
            border-radius: 0 50px 50px 0;
            padding: 8px 25px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            transition: all 0.3s;
        }
        .search-box .btn-search:hover {
            opacity: 0.9;
            transform: scale(1.02);
        }
        .clear-search {
            position: absolute;
            right: 100px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            text-decoration: none;
            font-size: 18px;
            z-index: 10;
        }
        .clear-search:hover {
            color: #dc3545;
        }
        .search-wrapper {
            position: relative;
            flex: 1;
        }
        .search-result-badge {
            background-color: #e7f3ff;
            color: #0066cc;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
        }
        /* ========== 新增样式结束 ========== */
    </style>
</head>
<body>
<!-- 导航栏 -->
<nav class="navbar navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="fas fa-book me-2"></i>图书管理系统
        </a>
        <div>
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-light btn-sm">
                <i class="fas fa-home me-1"></i>返回首页
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <!-- 统计卡片和添加按钮 -->
    <div class="row mb-4">
        <div class="col-md-8">
            <div class="stats-card">
                <div class="row align-items-center">
                    <div class="col">
                        <h5 class="mb-2"><i class="fas fa-chart-line me-2"></i>藏书统计</h5>
                        <h2 class="mb-0">
                            <%-- ========== 修改：支持搜索结果统计 ========== --%>
                            <c:choose>
                                <c:when test="${empty selectAllBooks && empty books1}">
                                    0 本
                                </c:when>
                                <c:when test="${not empty books1}">
                                    ${books1.size()} 本
                                </c:when>
                                <c:otherwise>
                                    ${selectAllBooks.size()} 本
                                </c:otherwise>
                            </c:choose>
                            <%-- ========== 修改结束 ========== --%>
                        </h2>
                        <small>总计藏书数量</small>
                    </div>
                    <div class="col">
                        <h5 class="mb-2"><i class="fas fa-boxes me-2"></i>库存统计</h5>
                        <h2 class="mb-0">
                            <%-- ========== 修改：支持搜索结果统计 ========== --%>
                            <c:set var="bookList" value="${not empty books1 ? books1 : selectAllBooks}" />
                            <c:if test="${not empty bookList}">
                                <c:set var="totalCounts" value="0" />
                                <c:forEach var="book" items="${bookList}">
                                    <c:set var="totalCounts" value="${totalCounts + book.bookCounts}" />
                                </c:forEach>
                                ${totalCounts} 册
                            </c:if>
                            <c:if test="${empty bookList}">
                                0 册
                            </c:if>
                            <%-- ========== 修改结束 ========== --%>
                        </h2>
                        <small>总库存数量</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 text-end">
            <a href="${pageContext.request.contextPath}/books/toaddBook" class="btn btn-add btn-lg">
                <i class="fas fa-plus me-2"></i>添加新书籍
            </a>
        </div>
    </div>

    <!-- ========== 新增：搜索框区域 ========== -->
    <div class="row mb-4">
        <div class="col-md-6 mx-auto">
            <form action="${pageContext.request.contextPath}/books/selectBookByName" method="post" class="search-box">
                <div class="search-wrapper">
                    <input type="text"
                           class="form-control"
                           name="bookName"
                           placeholder="请输入书名进行搜索..."
                           value="${param.bookName}">
                    <%-- 如果有搜索关键词，显示清除按钮 --%>
                    <c:if test="${not empty param.bookName}">
                        <a href="${pageContext.request.contextPath}/books/selectAllBook" class="clear-search">
                            <i class="fas fa-times-circle"></i>
                        </a>
                    </c:if>
                </div>
                <button type="submit" class="btn-search">
                    <i class="fas fa-search me-1"></i>搜索
                </button>
            </form>
        </div>
    </div>
    <!-- ========== 搜索框区域结束 ========== -->

    <!-- 书籍列表卡片 -->
    <div class="card">
        <div class="card-header bg-white py-3">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="card-title mb-0">
                    <i class="fas fa-list me-2 text-primary"></i>书籍信息列表
                </h5>
                <%-- ========== 新增：显示搜索结果的提示 ========== --%>
                <c:if test="${not empty param.bookName}">
                    <span class="search-result-badge">
                        <i class="fas fa-search me-1"></i>搜索结果: "${param.bookName}"
                    </span>
                </c:if>
                <%-- ========== 新增代码结束 ========== --%>
            </div>
        </div>
        <div class="card-body p-0">
            <%-- ========== 修改：支持搜索结果判断 ========== --%>
            <c:choose>
                <c:when test="${empty selectAllBooks && empty books1}">
                    <%-- ========== 修改结束 ========== --%>
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fas fa-book-open"></i>
                        </div>
                        <h4 class="text-muted">暂无书籍数据</h4>
                        <p class="text-muted mb-3">点击上方按钮添加您的第一本书籍</p>
                        <a href="${pageContext.request.contextPath}/books/toaddBook" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>添加书籍
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th style="width: 80px">ID</th>
                                <th>书名</th>
                                <th style="width: 120px">库存数量</th>
                                <th>详情描述</th>
                                <th style="width: 150px">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%-- ========== 修改：根据是否有搜索结果显示不同的数据 ========== --%>
                            <c:forEach var="book" items="${not empty books1 ? books1 : selectAllBooks}">
                                <%-- ========== 修改结束 ========== --%>
                                <tr>
                                    <td class="fw-bold">${book.bookId}</td>
                                    <td>
                                        <i class="fas fa-book text-primary me-2"></i>
                                            ${book.bookName}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${book.bookCounts > 50}">
                                                        <span class="badge bg-success badge-stock">
                                                            <i class="fas fa-check-circle me-1"></i>${book.bookCounts} 册
                                                        </span>
                                            </c:when>
                                            <c:when test="${book.bookCounts > 10}">
                                                        <span class="badge bg-warning text-dark badge-stock">
                                                            <i class="fas fa-exclamation-triangle me-1"></i>${book.bookCounts} 册
                                                        </span>
                                            </c:when>
                                            <c:otherwise>
                                                        <span class="badge bg-danger badge-stock">
                                                            <i class="fas fa-times-circle me-1"></i>${book.bookCounts} 册
                                                        </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${empty book.detail}">
                                                <span class="text-muted">暂无详情描述</span>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-align-left me-1 text-muted"></i>
                                                ${book.detail}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <!-- 修改按钮 - 跳转到修改页面，传递bookId -->
                                            <a href="${pageContext.request.contextPath}/books/toupdateBook?bookId=${book.bookId}"
                                               class="btn btn-warning btn-sm">
                                                <i class="fas fa-edit me-1"></i>修改
                                            </a>
                                            <!-- 删除按钮 - 直接删除，弹出确认框 -->
                                            <a href="${pageContext.request.contextPath}/books/deleteBook?bookId=${book.bookId}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('确定要删除《${book.bookName}》这本书吗？')">
                                                <i class="fas fa-trash-alt me-1"></i>删除
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>