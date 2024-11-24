<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
</style>
</head>
<body>
<%@include file="header.jsp"%>

<div class="history-table">
			<h2>Danh sách khách hàng</h2>
			<table>
			<thead>
				<tr>
				<th>Id</th>
					
					<th>Họ tên</th>
					<th>Tên đăng nhập</th>
					<th>Số điện thoại</th>
					<th>Mật khẩu</th>
					<th>Thời gian tạo</th>
					<th>Thao tác</th>
				</tr>
				</thead>
				<tbody>
				<tr>
				      <%
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			List<User> list = dao.getAllUsers();
			for (User user : list) {
		%>
		<tr>
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=user.getUserName()%></td>
			<td><%=user.getPhone()%></td>
			<td><%=user.getPassword()%></td>
			 <td><%= user.getCreatedAt() %></td>
			<td><a href="" class="button btn-approve">Chỉnh sửa</a> <a href="javascript:void(0);" class="button btn-reject" onclick="confirmDelete('deleteUser.jsp?id=<%= user.getId() %>')">Xóa</a>
</td>


		</tr>
		<%
			}
		%>             
					
				</tbody>
				<!-- Add history rows here -->
			</table>
		</div>

<!-- Hộp thoại xác nhận -->
<div id="confirm-dialog" style="display: none;">
    <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5);">
        <div style="background: white; padding: 20px; border-radius: 5px; width: 300px; margin: 15% auto; text-align: center;">
            <p>Bạn có chắc chắn muốn xóa người dùng này?</p>
            <div>
                <button id="confirm-btn" style="margin-right: 10px; background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Xác nhận</button>
                <button onclick="closeDialog()" style="background-color: #f44336; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Hủy</button>
            </div>
        </div>
    </div>
</div>


<script>
    let deleteUrl = "";

    function confirmDelete(url) {
        deleteUrl = url; // Lưu URL xóa vào biến
        document.getElementById("confirm-dialog").style.display = "block";
    }

    function closeDialog() {
        document.getElementById("confirm-dialog").style.display = "none";
    }

    document.getElementById("confirm-btn").onclick = function () {
        // Điều hướng đến URL xóa
        window.location.href = deleteUrl;
    };
</script>


</body>
</html>