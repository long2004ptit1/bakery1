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
import java.util.List;

@WebServlet("/SearchStaffServlet")
public class SearchStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;

    @Override
    public void init() throws ServletException {
        staffDAO = new StaffDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchKey = request.getParameter("searchKey");
        String filter = request.getParameter("filter");

        List<Staff> staffList;

        try {
            if (searchKey == null || searchKey.trim().isEmpty()) {
                staffList = staffDAO.getAllStaff();
            } else {
                staffList = staffDAO.searchStaff(searchKey, (filter != null && !filter.isEmpty()) ? filter : "all");
            }
            request.setAttribute("staffList", staffList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi xảy ra trong quá trình tìm kiếm: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/admin/staff_list.jsp").forward(request, response);
    }
}