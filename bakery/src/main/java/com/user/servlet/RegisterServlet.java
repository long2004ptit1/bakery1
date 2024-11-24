package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        HttpSession session = request.getSession();

        // Kiểm tra mật khẩu và xác nhận mật khẩu
        if (!password.equals(confirmPassword)) {
            session.setAttribute("errorMsg", "Mật khẩu không trùng khớp");
            response.sendRedirect("register.jsp");
            return;
        }

        // Tạo đối tượng người dùng
        User user = new User();
        user.setName(name);
        user.setUserName(username); // Giả sử username là email, tùy chỉnh nếu cần
        user.setPhone(phone);
        user.setPassword(password);

        try {
            UserDAO dao = new UserDAOImpl(DBConnect.getConn());
            boolean userRegistered = dao.userRegister(user);

            if (userRegistered) {
                // Thông báo thành công và chuyển hướng đến login.jsp
                session.setAttribute("successMsg", "Đăng ký thành công! Bạn sẽ được chuyển hướng đến trang đăng nhập sau 3 giây.");
                response.sendRedirect("register.jsp");
            } else {
                session.setAttribute("errorMsg", "Đăng ký thất bại. Vui lòng thử lại.");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Có lỗi xảy ra trong quá trình đăng ký.");
            response.sendRedirect("register.jsp");
        }
    }
}
