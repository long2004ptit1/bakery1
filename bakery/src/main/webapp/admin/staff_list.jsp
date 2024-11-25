<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.StaffDAO, com.DAO.StaffDAOImpl, com.entity.Staff" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhân Viên</title>
    <style>
h2 {
	padding: 20px;
	font-size:20px;
}

.history-table {
	margin-top: 100px;
	margin-left: 50px;
}

.history-table table {
	width: 70%;
	border-collapse: collapse;
}

.history-table table, .history-table th, .history-table td {
	border: 1px solid #ddd;
}

.history-table th, .history-table td {
	padding: 10px;
	text-align: left;
	font-size: 16px;
}

.history-table th {
	background-color: #f2f2f2;

}

.history-table {
    white-space: nowrap; /* Không ngắt dòng */
    width: 200px; /* Điều chỉnh chiều rộng theo ý muốn */
}

/*button  */

.button{
    font-size: 14px;
    font-weight: bold;
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-approve {
    background-color: #4CAF50;
    color: white;
}

.btn-approve:hover {
    background-color: #45a049;
}

.btn-reject {
    background-color: #f44336;
    color: white;
}

.btn-reject:hover {
    background-color: #d32f2f;
}

/* Căn giữa và thêm khoảng cách cho nút "Thêm sản phẩm" */
tfoot td {
    text-align: center;
    padding: 20px 0; /* Thêm khoảng đệm trên và dưới */
}

tfoot .button {
    display: inline-block; /* Hiển thị dạng nút */
    margin-top: 10px; /* Khoảng cách giữa nút và nội dung khác */
    padding: 12px 24px; /* Tăng kích thước nút */
}
    </style>
</head>
<body>
<%@ include file="header.jsp" %>

<%-- Thông báo kết quả --%>
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<% if ("1".equals(success)) { %>
    <div style="color: green; text-align: center;">Thao tác thành công!</div>
<% } else if ("1".equals(error)) { %>
    <div style="color: red; text-align: center;">Có lỗi xảy ra!</div>
<% } %>

<div class="history-table">
    <h2>Danh sách nhân viên</h2>
    <!-- Form tìm kiếm -->
		<form action="ProductSearchServlet" method="GET"
			style="margin-bottom: 20px;">
			<label for="searchKey">Tìm kiếm:</label> <input type="text"
				id="searchKey" name="searchKey"
				placeholder="Nhập mã hoặc tên danh mục..."
				style="padding: 8px; margin-right: 10px;"> <label
				for="filter">Sắp xếp theo:</label> <select id="filter" name="filter"
				style="padding: 8px; margin-right: 10px;">
				<option value="all">Tất cả</option>
				<option value="id">Danh mục</option>
				<option value="name">Mã danh mục</option>
				<option value="price">Số lượng tăng dần</option>
				<option value="price">Số lương giảm dầm</option>
				<option value="latest">Mới nhất</option>
			</select>

			<button type="submit"
				style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 5px;">Tìm
				kiếm</button>
		</form>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Vai trò</th>
                <th>Thời gian tạo</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                StaffDAO staffDAO = new StaffDAOImpl();
                List<Staff> staffList = staffDAO.getAllStaff();
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

                for (Staff staff : staffList) {
            %>
            <tr>
                <td><%= staff.getId() %></td>
                <td><%= staff.getName() %></td>
                <td><%= staff.getPhone() %></td>
                <td><%= staff.getRole() %></td>
                <td><%= (staff.getCreatedAt() != null) ? sdf.format(staff.getCreatedAt()) : "N/A" %></td>
                <td>
                    <a href="edit_staff.jsp?id=<%= staff.getId() %>" class="btn-edit">Chỉnh sửa</a>
                    <a href="delete_staff.jsp?id=<%= staff.getId() %>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
            <% } %>
        </tbody>
        <tfoot>
				<tr>
					<td colspan="11" style="text-align: center;"><a
						href="add_staff.jsp" class="button btn-approve"
						style="font-size: 16px; padding: 10px 20px;">Thêm nhân viên</a></td>
				</tr>
			</tfoot>
    </table>
</div>
</body>
</html>
