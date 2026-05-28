<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加书籍 - 图书管理系统</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 图标库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 0;
        }
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 20px 20px 0 0 !important;
            padding: 20px;
        }
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #e0e0e0;
            padding: 10px 15px;
            transition: all 0.3s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .btn-back {
            border-radius: 10px;
            padding: 8px 20px;
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
        }
        .required-field::after {
            content: "*";
            color: red;
            margin-left: 4px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">
                            <i class="fas fa-plus-circle me-2"></i>添加新书籍
                        </h4>
                        <a href="${pageContext.request.contextPath}/books/selectAllBook" class="btn btn-light btn-back">
                            <i class="fas fa-arrow-left me-1"></i>返回列表
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/books/addBook" method="post">
                        <div class="mb-4">
                            <label for="bookName" class="form-label required-field">
                                <i class="fas fa-heading me-1"></i>书名
                            </label>
                            <input type="text"
                                   class="form-control"
                                   id="bookName"
                                   name="bookName"
                                   required
                                   placeholder="请输入书籍名称">
                            <div class="form-text text-muted">例如：《Java编程思想》、《Spring实战》等</div>
                        </div>

                        <div class="mb-4">
                            <label for="bookCounts" class="form-label required-field">
                                <i class="fas fa-cubes me-1"></i>库存数量
                            </label>
                            <input type="number"
                                   class="form-control"
                                   id="bookCounts"
                                   name="bookCounts"
                                   required
                                   min="0"
                                   placeholder="请输入库存数量">
                            <div class="form-text text-muted">请输入大于等于0的数字</div>
                        </div>

                        <div class="mb-4">
                            <label for="detail" class="form-label">
                                <i class="fas fa-align-left me-1"></i>详情描述
                            </label>
                            <textarea class="form-control"
                                      id="detail"
                                      name="detail"
                                      rows="4"
                                      placeholder="请输入书籍的详细信息，包括作者、出版社、内容简介等..."></textarea>
                            <div class="form-text text-muted">选填项，可以详细描述书籍信息</div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-submit text-white">
                                <i class="fas fa-save me-2"></i>立即添加
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>