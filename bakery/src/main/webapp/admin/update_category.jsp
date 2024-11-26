<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.entity.Category" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .form-container {
            width: 50%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        img {
            margin-top: 10px;
            width: 100px;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Chỉnh sửa danh mục</h2>

        <c:if test="${empty category}">
            <p class="error">Không tìm thấy danh mục hoặc danh mục không hợp lệ.</p>
        </c:if>

        <c:if test="${not empty category}">
            <form action="CategoryUpdateServlet" method="post" enctype="multipart/form-data">
                <!-- Mã danh mục -->
                <label for="id">Mã danh mục:</label>
                <input type="text" id="id" name="id" value="${category.id}" readonly>

                <!-- Tên danh mục -->
                <label for="name">Tên danh mục:</label>
                <input type="text" id="name" name="name" value="${category.name}" required>

                <!-- Hình ảnh -->
                <label for="thumbnail">Hình ảnh:</label>
                <input type="file" id="thumbnail" name="thumbnail">
                <c:if test="${not empty category.thumbnail}">
                    <img src="${pageContext.request.contextPath}/uploads/category/${category.thumbnail}" alt="Thumbnail">
                </c:if>

                <!-- Mô tả -->
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4">${category.description}</textarea>

                <!-- Nút Cập Nhật -->
                <button type="submit">Lưu Thay Đổi</button>
            </form>
        </c:if>
    </div>
</body>
</html>
