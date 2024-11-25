<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAO, com.DAO.StaffDAOImpl, com.entity.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật nhân viên</title>
</head>
<body>
<%
    // Lấy thông tin từ form
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String role = request.getParameter("role");

    // Cập nhật nhân viên
    StaffDAO staffDAO = new StaffDAOImpl();
    Staff staff = new Staff();
    staff.setId(id);
    staff.setName(name);
    staff.setPhone(phone);
    staff.setRole(role);

    boolean isUpdated = staffDAO.updateStaff(staff); // Gọi phương thức DAO để cập nhật

    if (isUpdated) {
        response.sendRedirect("staff_list.jsp?success=1");
    } else {
        response.sendRedirect("edit_staff.jsp?id=" + id + "&error=1");
    }
%>
</body>
</html>
