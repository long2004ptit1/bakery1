package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.CategoryDAOImpl;
import com.DB.DBConnect;
import com.entity.Category;

@WebServlet("/add_category")
@MultipartConfig
public class CategoryAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Lấy các tham số từ form
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String description = req.getParameter("description");
			Part part = req.getPart("thumbnail");
			String fileName = part.getSubmittedFileName(); // Tên file hình ảnh

			HttpSession session = req.getSession();

			// Sử dụng DAO để kiểm tra mã danh mục
			CategoryDAOImpl dao = new CategoryDAOImpl(DBConnect.getConn());
			if (dao.isCategoryExists(id)) {
				// Mã danh mục đã tồn tại, gửi thông báo lỗi
				session.setAttribute("failMsg", "Mã danh mục đã tồn tại!");
				resp.sendRedirect("admin/add_category.jsp");
				return;
			}

			// Nếu mã danh mục không tồn tại, tiếp tục thêm
			Category category = new Category(id, name, description, fileName, null, null);
			boolean f = dao.addCategory(category);

			if (f) {
				// Lưu file hình ảnh vào thư mục "uploads"
				String path = getServletContext().getRealPath("") + "category";
				File file = new File(path);
				if (!file.exists()) {
					file.mkdir();
				}
				part.write(path + File.separator + fileName);

				// Gửi thông báo thành công
				session.setAttribute("succMsg", "Thêm danh mục thành công");
				resp.sendRedirect("admin/add_category.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
