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
        try {
            // Đọc dữ liệu từ form
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String username = request.getParameter("username");  // Mới thêm cột username
            String password = request.getParameter("password");  // Mới thêm cột password

            // Xác thực dữ liệu đầu vào
            if (name == null || name.isEmpty() || phone == null || phone.isEmpty() || role == null || role.isEmpty() || username == null || username.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("edit_staff.jsp?id=" + id).forward(request, response);
                return;
            }

            // Kiểm tra định dạng số điện thoại (có thể thay đổi theo yêu cầu của bạn)
            if (!phone.matches("^[0-9]{10,11}$")) {  // Kiểm tra số điện thoại có từ 10 đến 11 chữ số
                request.setAttribute("error", "Số điện thoại không hợp lệ!");
                request.getRequestDispatcher("edit_staff.jsp?id=" + id).forward(request, response);
                return;
            }

            // Tạo đối tượng Staff
            Staff staff = new Staff();
            staff.setId(id);
            staff.setName(name);
            staff.setPhone(phone);
            staff.setRole(role);
            staff.setUsername(username);  // Thêm username
            staff.setPassword(password);  // Thêm password

            // Gọi DAO để cập nhật
            StaffDAO staffDAO = new StaffDAOImpl();
            boolean isUpdated = staffDAO.updateStaff(staff);

            if (isUpdated) {
                // Cập nhật thành công
                request.setAttribute("success", "Cập nhật nhân viên thành công!");
                request.getRequestDispatcher("staff_list.jsp").forward(request, response);
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
