<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAOImpl" %>
<%@ page import="com.entity.Staff" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhân Viên</title>
    <style>
        h2 {
            padding: 20px;
            font-size:20px;
        }

        .history-table {
            margin-top: 100px;
            margin-left: 50px;
        }

        .history-table table {
            width: 70%;
            border-collapse: collapse;
        }

        .history-table table, .history-table th, .history-table td {
            border: 1px solid #ddd;
        }

        .history-table th, .history-table td {
            padding: 10px;
            text-align: left;
            font-size: 16px;
        }

        .history-table th {
            background-color: #f2f2f2;
        }

        .history-table {
            white-space: nowrap; /* Không ngắt dòng */
            width: 200px; /* Điều chỉnh chiều rộng theo ý muốn */
        }

        /*button  */
        .button{
            font-size: 14px;
            font-weight: bold;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-approve {
            background-color: #4CAF50;
            color: white;
        }

        .btn-approve:hover {
            background-color: #45a049;
        }

        .btn-reject {
            background-color: #f44336;
            color: white;
        }

        .btn-reject:hover {
            background-color: #d32f2f;
            
            button:hover {
    background-color: #45a049;
}
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<% if ("1".equals(success)) { %>
    <div style="color: green; text-align: center;">Thao tác thành công!</div>
<% } else if ("1".equals(error)) { %>
    <div style="color: red; text-align: center;">Có lỗi xảy ra!</div>
<% } %>

<div class="history-table">
    <h2>Danh sách nhân viên</h2>
<form action="staff_list.jsp" method="get" 
      style="display: flex; align-items: center; justify-content: flex-start; gap: 10px; padding: 10px; max-width: 100%; margin: 20px 0;">

    <!-- Ô nhập tìm kiếm -->
    <input type="text" name="searchKey" placeholder="Nhập từ khóa tìm kiếm"
           value="<%= request.getParameter("searchKey") != null ? request.getParameter("searchKey") : "" %>"
           style="flex: 3; padding: 10px 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; background-color: #f9f9f9; outline: none;">

    <!-- Bộ lọc -->
    <select name="filter" 
            style="flex: 1; padding: 10px 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; background-color: #f9f9f9; outline: none;">
        <option value="id" <%= "id".equals(request.getParameter("filter")) ? "selected" : "" %>>ID</option>
        <option value="timecreate" <%= "timecreate".equals(request.getParameter("filter")) ? "selected" : "" %>>Thời gian tạo</option>
    </select>

    <!-- Nút tìm kiếm -->
    <button type="submit" 
            style="padding: 10px 20px; border: none; border-radius: 5px; background-color: #4CAF50; color: white; font-size: 14px; font-weight: bold; cursor: pointer; transition: background-color 0.3s;">
        Tìm kiếm
    </button>
</form>


    <br>

  <%
        StaffDAOImpl staffDAO = new StaffDAOImpl();
        String searchKey = request.getParameter("searchKey");
        String filter = request.getParameter("filter");

        List<Staff> staffList;
        if (searchKey == null || searchKey.trim().isEmpty()) {
            staffList = staffDAO.getAllStaff();
        } else {
            staffList = staffDAO.searchStaff(searchKey, filter != null && !filter.isEmpty() ? filter : "all");
        }
    %>

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
                if (staffList != null && !staffList.isEmpty()) {
                    for (Staff staff : staffList) {
            %>
            <tr>
                <td><%= staff.getId() %></td>
                <td><%= staff.getName() %></td>
                <td><%= staff.getPhone() %></td>
                <td><%= staff.getRole() %></td>
                <td><%= staff.getCreatedAt() != null ? staff.getCreatedAt().toString() : "N/A" %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/admin/edit_staff.jsp?id=<%= staff.getId() %>" class="button btn-approve">Chỉnh sửa</a>
                    <a href="<%= request.getContextPath() %>/admin/delete_staff.jsp?id=<%= staff.getId() %>" class="button btn-reject">Xóa</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6" style="text-align:center;">Không tìm thấy nhân viên nào.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
