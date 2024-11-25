<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Nhân Viên</title>
    <!-- Link CSS -->
    <link rel="stylesheet" href="all_component/style.css">
    <!-- Boxicons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- Custom Style -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background: white;
            width: 40%;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        .form-container .back-link {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .form-container .back-link:hover {
            text-decoration: underline;
        }
        .form-container select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f9f9f9;
    appearance: none; /* Xóa mũi tên mặc định */
    background-image: url('data:image/svg+xml;base64,PHN2ZyB...'); /* Hình mũi tên */
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 12px;
    cursor: pointer;
}

.form-container select:focus {
    border-color: #007bff;
    outline: none;
}
        
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="form-container">
        <h2>Thêm Nhân Viên</h2>
        <%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
    if ("1".equals(error)) {
%>
        <p style="color: red; text-align: center;">Thêm nhân viên thất bại. Vui lòng kiểm tra lại!</p>
<%
    } else if ("1".equals(success)) {
%>
        <p style="color: green; text-align: center;">Thêm nhân viên thành công!</p>
<%
    }
%>
        
        <form action="<%= request.getContextPath() %>/admin/AddStaffServlet" method="post">

            <label for="name">Họ tên:</label>
            <input type="text" id="name" name="name" placeholder="Nhập họ tên nhân viên" required>

            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" required>

            <label for="role">Vai trò:</label>
<select id="role" name="role" required>
    <option value="Nhân viên">Nhân viên</option>
    <option value="Quản lý">Quản lý</option>
    <option value="Giám sát">Giám sát</option>
    
</select>


            <button type="submit">Thêm Nhân Viên</button>
        </form>
        <a href="<%= request.getContextPath() %>/admin/staff_list.jsp" class="back-link">Quay lại danh sách</a>
    </div>
</body>
</html>
