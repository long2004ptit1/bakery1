<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAO, com.DAO.StaffDAOImpl" %>

<%
    String id = request.getParameter("id");
    if (id != null && !id.isEmpty()) {
        StaffDAO staffDAO = new StaffDAOImpl();
        boolean isDeleted = staffDAO.deleteStaff(Integer.parseInt(id));

        if (isDeleted) {
            response.sendRedirect("staff_list.jsp?success=1");
        } else {
            response.sendRedirect("staff_list.jsp?error=1");
        }
    } else {
        response.sendRedirect("staff_list.jsp?error=1");
    }
%>
