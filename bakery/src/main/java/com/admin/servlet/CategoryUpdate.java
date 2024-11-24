package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.CategoryDAOImpl;
import com.DB.DBConnect;
import com.entity.Category;

@WebServlet("/update_category")
@MultipartConfig(
)
public class CategoryUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads"; // Đường dẫn thư mục lưu trữ file ảnh

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String id = request.getParameter("id");
        String name = request.getParameter("category");
        String description = request.getParameter("description");
        Part filePart = request.getPart("thumbnail");

        // Kiểm tra file ảnh
        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            // Lưu file vào thư mục uploads
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Khởi tạo DAO và đối tượng Category
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl(DBConnect.getConn());
        Category category = new Category();
        category.setId(id);
        category.setName(name);
        category.setThumbnail(fileName);
        category.setDescription(description);

        // Cập nhật danh mục
        boolean isUpdated = categoryDAO.updateCategory(category);

        // Thông báo kết quả
        if (isUpdated) {
            request.getSession().setAttribute("succMsg", "Cập nhật danh mục thành công!");
        } else {
            request.getSession().setAttribute("failMsg", "Cập nhật danh mục thất bại! Vui lòng kiểm tra lại.");
        }

        // Điều hướng trở lại trang chỉnh sửa
        response.sendRedirect("update_category.jsp");
    }

    // Phương thức trích xuất tên file từ part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }
}
