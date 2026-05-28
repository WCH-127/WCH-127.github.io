<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>图书管理系统 - 首页</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome 图标库 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.3);
      transition: transform 0.3s;
    }
    .card:hover {
      transform: translateY(-10px);
    }
    .btn-gradient {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 12px 40px;
      border-radius: 50px;
      font-weight: bold;
      transition: all 0.3s;
    }
    .btn-gradient:hover {
      transform: scale(1.05);
      color: white;
      box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
    .icon-large {
      font-size: 4rem;
      color: #667eea;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card text-center p-5">
        <div class="card-body">
          <i class="fas fa-book-open icon-large"></i>
          <h1 class="card-title mb-3">图书管理系统</h1>
          <p class="card-text text-muted mb-4">欢迎使用图书管理系统，管理您的藏书信息</p>
          <a href="${pageContext.request.contextPath}/books/selectAllBook" class="btn btn-gradient">
            <i class="fas fa-arrow-right me-2"></i>进入书籍管理
          </a>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>