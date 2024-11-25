package com.admin.servlet;


import com.DAO.StaffDAO;
import com.DAO.StaffDAOImpl;
import com.entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/AddStaffServlet")

public class AddStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        // Debug: In thông tin ra console để kiểm tra
        System.out.println("Name: " + name);
        System.out.println("Phone: " + phone);
        System.out.println("Role: " + role);

        Staff staff = new Staff();
        staff.setName(name);
        staff.setPhone(phone);
        staff.setRole(role);

        StaffDAO staffDAO = new StaffDAOImpl();
        boolean isAdded = staffDAO.addStaff(staff);

        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/admin/staff_list.jsp?success=1");
        } else {
            System.out.println("Thêm nhân viên thất bại!");
            response.sendRedirect(request.getContextPath() + "/admin/add_staff.jsp?error=1");
        }
        
        

        
    }

}


