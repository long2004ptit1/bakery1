<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAO, com.DAO.StaffDAOImpl, com.entity.Staff" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin nhân viên</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .form-container {
            width: 40%;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"], input[type="password"], select {
            padding: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus, select:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        .back-button {
            text-align: center;
            margin-top: 10px;
        }

        .back-button a {
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
        }

        .back-button a:hover {
            text-decoration: underline;
        }

        .password-container {
            position: relative;
        }

        .password-container i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #555;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                margin: 20px auto;
            }

            h2 {
                font-size: 20px;
            }

            button {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    StaffDAO staffDAO = new StaffDAOImpl();
    Staff staff = staffDAO.getStaffById(id);
    if (staff == null) {
        response.sendRedirect("staff_list.jsp");
        return;
    }
%>

<div class="form-container">
    <h2>Chỉnh sửa thông tin nhân viên</h2>

    <form action="update_staff.jsp" method="post">  <!-- Sử dụng POST để gửi dữ liệu -->
        <input type="hidden" name="id" value="<%= staff.getId() %>">

        <label for="name">Họ tên:</label>
        <input type="text" id="name" name="name" value="<%= staff.getName() %>" required>

        <label for="phone">Số điện thoại:</label>
        <input type="text" id="phone" name="phone" value="<%= staff.getPhone() %>" required>

        <label for="role">Vai trò:</label>
        <select id="role" name="role">
            <option value="employee" <%= staff.getRole().equals("employee") ? "selected" : "" %>>Nhân viên</option>
            <option value="manager" <%= staff.getRole().equals("manager") ? "selected" : "" %>>Quản lý</option>
            <option value="supervisor" <%= staff.getRole().equals("supervisor") ? "selected" : "" %>>Giám sát</option>
        </select>

        <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" value="<%= staff.getUsername() != null ? staff.getUsername() : "" %>" required>

        <label for="password">Mật khẩu:</label>
        <div class="password-container">
            <input type="password" id="password" name="password" value="<%= staff.getPassword() != null ? staff.getPassword() : "" %>" required>
            <i id="togglePassword" class="fas fa-eye"></i>
        </div>

        <button type="submit">Lưu thay đổi</button>
    </form>

    <div class="back-button">
        <a href="staff_list.jsp">Quay lại danh sách nhân viên</a>
    </div>
</div>

<script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordField = document.getElementById('password');

    togglePassword.addEventListener('click', () => {
        // Toggle giữa text và password
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);

        // Đổi biểu tượng
        togglePassword.classList.toggle('fa-eye');
        togglePassword.classList.toggle('fa-eye-slash');
    });
</script>

</body>
</html>
