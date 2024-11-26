<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục mới</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Đảm bảo form được đặt từ trên xuống */
            min-height: 100vh; /* Chiều cao tối thiểu của body */
            background-color: #f4f4f4; /* Màu nền dễ nhìn */
            font-family: Arial, sans-serif;
        }

        .form-container {
            margin-top: 80px; /* Đẩy form xuống một chút để không bị khuất */
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 24px;
            color: #333;
        }

        form div {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="file"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: none; /* Không cho phép thay đổi kích thước ô mô tả */
        }

        button {
            width: 100%;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
        }

        .message.success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="form-container">
        <h2>Thêm danh mục mới</h2>

        <!-- Hiển thị thông báo -->
        <c:if test="${not empty succMsg}">
            <div class="message success">${succMsg}</div>
            <c:remove var="succMsg" scope="session" />
        </c:if>
        <c:if test="${not empty failMsg}">
            <div class="message error">${failMsg}</div>
            <c:remove var="failMsg" scope="session" />
        </c:if>

        <!-- Form thêm danh mục -->
        <form action="../add_category" method="POST" enctype="multipart/form-data">

            <div>
                <label for="id">Mã danh mục:</label>
                <input type="text" id="id" name="id" placeholder="Nhập mã danh mục" required />
            </div>

            <div>
                <label for="category">Tên danh mục:</label>
                <input type="text" id="category" name="category" placeholder="Nhập tên danh mục" required />
            </div>

            <div>
                <label for="thumbnail">Hình ảnh:</label>
                <input type="file" id="thumbnail" name="thumbnail" accept="image/*" required />
            </div>

            <div>
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4" placeholder="Nhập mô tả danh mục"></textarea>
            </div>

            <button type="submit">Thêm danh mục</button>
        </form>
    </div>
</body>
</html>
