<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAO, com.DAO.StaffDAOImpl, com.entity.Staff" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhân Viên</title>
    <style>
        h2 {
            padding: 20px;
            font-size: 20px;
            text-align: center;
        }

        .staff-table {
            margin: 50px auto;
            width: 90%;
        }

        .staff-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .staff-table th, .staff-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .staff-table th {
            background-color: #f2f2f2;
        }

        .btn-edit, .btn-delete {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #4CAF50;
            color: white;
        }

        .btn-edit:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<%-- Thông báo kết quả --%>
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<% if ("1".equals(success)) { %>
    <div style="color: green; text-align: center;">Thao tác thành công!</div>
<% } else if ("1".equals(error)) { %>
    <div style="color: red; text-align: center;">Có lỗi xảy ra!</div>
<% } %>

<div class="staff-table">
    <h2>Danh sách nhân viên</h2>
    <a href="add_staff.jsp" style="float: right; margin-bottom: 10px; padding: 10px; background: #007BFF; color: white; text-decoration: none; border-radius: 5px;">Thêm Nhân Viên</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Vai trò</th>
                <th>Thời gian tạo</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                StaffDAO staffDAO = new StaffDAOImpl();
                List<Staff> staffList = staffDAO.getAllStaff();
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

                for (Staff staff : staffList) {
            %>
            <tr>
                <td><%= staff.getId() %></td>
                <td><%= staff.getName() %></td>
                <td><%= staff.getPhone() %></td>
                <td><%= staff.getRole() %></td>
                <td><%= (staff.getCreatedAt() != null) ? sdf.format(staff.getCreatedAt()) : "N/A" %></td>
                <td>
                    <a href="edit_staff.jsp?id=<%= staff.getId() %>" class="btn-edit">Chỉnh sửa</a>
                    <a href="delete_staff.jsp?id=<%= staff.getId() %>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
