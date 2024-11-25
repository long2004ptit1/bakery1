package com.admin.servlet;

import com.DAO.StaffDAO;
import com.DAO.StaffDAOImpl;
import com.entity.Staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditStaffServlet")
public class EditStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đọc dữ liệu từ form
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");

            // Xác thực dữ liệu đầu vào
            if (name == null || name.isEmpty() || phone == null || phone.isEmpty() || role == null || role.isEmpty()) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("edit_staff.jsp?id=" + id).forward(request, response);
                return;
            }

            // Tạo đối tượng Staff
            Staff staff = new Staff();
            staff.setId(id);
            staff.setName(name);
            staff.setPhone(phone);
            staff.setRole(role);

            // Gọi DAO để cập nhật
            StaffDAOImpl staffDAOImpl = new StaffDAOImpl();
            boolean isUpdated = staffDAOImpl.updateStaff(staff);

            if (isUpdated) {
                // Cập nhật thành công
                request.setAttribute("success", "Cập nhật nhân viên thành công!");
                response.sendRedirect("staff_list.jsp?success=1");
            } else {
                // Lỗi cập nhật
                request.setAttribute("error", "Cập nhật thất bại. Vui lòng thử lại!");
                request.getRequestDispatcher("edit_staff.jsp?id=" + id).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Gửi lỗi nếu có ngoại lệ xảy ra
            request.setAttribute("error", "Có lỗi xảy ra. Vui lòng kiểm tra lại!");
            request.getRequestDispatcher("edit_staff.jsp").forward(request, response);
        }
    }
}
