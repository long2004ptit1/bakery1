<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.CategoryDAOImpl" %>
<%@ page import="com.entity.Category" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh mục sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            padding: 20px;
            font-size: 24px;
            color: #333;
        }
        table {
            width: 90%;
            height: 60px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .button {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }
        .btn-approve {
            background-color: #4CAF50;
        }
        .btn-reject {
            background-color: #f44336;
        }
        .btn-approve:hover {
            background-color: #45a049;
        }
        .btn-reject:hover {
            background-color: #d32f2f;
        }
        .message {
            text-align: center;
            margin: 20px 0;
            font-size: 16px;
            font-weight: bold;
        }
        .message.success {
            color: green;
        }
        .message.error {
            color: red;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <h2>Danh mục sản phẩm</h2>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty succMsg}">
        <div class="message success">${succMsg}</div>
        <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failMsg}">
        <div class="message error">${failMsg}</div>
        <c:remove var="failMsg" scope="session"/>
    </c:if>
	<form action="CategorySearchServlet" method="get" style="display: flex; align-items: center; margin-bottom: 20px;">
	<form action="${pageContext.request.contextPath}/admin/CategorySearchServlet" method="get">

	
    <!-- Ô tìm kiếm -->
    <label for="keyword" style="margin-right: 10px;">Tìm kiếm:</label>
    <input type="text" id="keyword" name="keyword" placeholder="Nhập mã danh mục hoặc tên danh mục"
           value="${keyword}" style="padding: 8px; width: 250px; margin-right: 15px;">

    <!-- Dropdown sắp xếp -->
    <label for="sort">Sắp xếp theo:</label>
    <select id="sort" name="sort" style="padding: 8px; margin-left: 10px; margin-right: 15px;">
        <option value="all" ${sort == 'all' ? 'selected' : ''}>Tất cả</option>
        <option value="name_asc" ${sort == 'name_asc' ? 'selected' : ''}>Tên (A-Z)</option>
        <option value="name_desc" ${sort == 'name_desc' ? 'selected' : ''}>Tên (Z-A)</option>
        <option value="date_newest" ${sort == 'date_newest' ? 'selected' : ''}>Mới nhất</option>
        <option value="date_oldest" ${sort == 'date_oldest' ? 'selected' : ''}>Cũ nhất</option>
    </select>

    <!-- Nút tìm kiếm -->
    <button type="submit" style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;">
        Tìm kiếm
    </button>
</form>


	
    <!-- Hiển thị bảng danh mục -->
    <table>
        <thead>
            <tr>
                <th>Mã danh mục</th>
                <th>Tên danh mục</th>
                <th>Hình ảnh</th>
                <th>Mô tả</th>
                <th>Thời gian tạo</th>
                <th>Thời gian cập nhật</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${categories}">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>
                <c:if test="${not empty category.thumbnail}">
                    <img src="${pageContext.request.contextPath}/uploads/category/${category.thumbnail}" alt="${category.name}" style="width: 50px; height: 50px;">
                </c:if>
            </td>
            <td>${category.description}</td>
            <td>${category.createdAt}</td>
            <td>${category.updatedAt}</td>
            <td>
                <a href="update_category.jsp?id=${category.id}" class="button btn-approve">Sửa</a>
                <a href="delete_category?id=${category.id}" class="button btn-reject">Xóa</a>
            </td>
        </tr>
    </c:forEach>
            <!-- Lấy danh sách từ database -->
            <%
                CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
                List<Category> categories = dao.getAllCategories();
                for (Category category : categories) {
            %>
                <tr>
                    <td><%= category.getId() %></td>
                    <td><%= category.getName() %></td>
                    <td>
                        <img src="${pageContext.request.contextPath}/uploads/category/<%= category.getThumbnail() %>" alt="<%= category.getName() %>" style="width: 50px; height: 50px;">

                    </td>
                    <td><%= category.getDescription() %></td>
                    <td><%= category.getCreatedAt() %></td>
                    <td><%= category.getUpdatedAt() %></td>
                    <td>
                        <a href="update_category.jsp?id=<%= category.getId() %>" class="button btn-approve">Sửa</a>
                        <a href="delete_category?id=<%= category.getId() %>" class="button btn-reject">Xóa</a>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <!-- Nút thêm danh mục -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="add_category.jsp" class="button btn-approve" style="font-size: 16px; padding: 10px 20px;">Thêm danh mục</a>
    </div>
</body>
</html>
