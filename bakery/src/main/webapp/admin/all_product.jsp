
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
	font-size: 20px;
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
	width: 200px; 
}

/*button  */
.button {
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
	<%@include file="header.jsp"%>

	<div class="history-table">
		<h2>Danh sách sản phẩm</h2>

		<!-- Form tìm kiếm -->
		<form action="ProductSearchServlet" method="GET"
			style="margin-bottom: 20px;">
			<label for="searchKey">Tìm kiếm:</label> <input type="text"
				id="searchKey" name="searchKey"
				placeholder="Nhập mã sản phẩm hoặc tên sản phẩm..."
				style="padding: 8px; margin-right: 10px;"> <label
				for="filter">Sắp xếp theo:</label> <select id="filter" name="filter"
				style="padding: 8px; margin-right: 10px;">
				<option value="all">Tất cả</option>
				<option value="id">Danh mục</option>
				<option value="name">Mã sản phẩm</option>
				<option value="price">Giá tăng dần</option>
				<option value="price">Giá giảm dần</option>
				<option value="latest">Mới nhất</option>
			</select>

			<button type="submit"
				style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 5px;">Tìm
				kiếm</button>
		</form>

		<table>
			<thead>
				<tr>

					<th>Mã sản phẩm</th>
					<th>Danh mục</th>
					<th>Tên sản phẩm</th>
					<th>Giá sản phẩm</th>
					<th>Mức giảm giá</th>
					<th>Hình ảnh</th>
					<th>Mô tả</th>
					<th>Thời gian tạo</th>
					<th>Thời gian cập nhật</th>
					<th>Trạng thái</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>SP1</td>
					<td>Bánh</td>
					<td>Bánh quy</td>
					<td>100,000 VND</td>
					<td>0</td>
					<td>Hình ảnh</td>
					<td>Mô tả</td>
					<td>Thời gian tạo</td>
					<td>Thời gian cập nhật</td>
					<td>Đang đăng bán</td>
					<td><a href="" class="button btn-approve">Chỉnh sửa</a> <a
						href="javascript:void(0);" class="button btn-reject"<%-- onclick="confirmDelete('deleteUser.jsp?id=<%= user.getId() %>') --%>">Xóa</a>
					</td>


				</tr>


			</tbody>
			<tfoot>
				<tr>
					<td colspan="11" style="text-align: center;"><a
						href="add_product.jsp" class="button btn-approve"
						style="font-size: 16px; padding: 10px 20px;">Thêm sản phẩm</a></td>
				</tr>
			</tfoot>
		</table>
	</div>

	<!-- Hộp thoại xác nhận -->
	<div id="confirm-dialog" style="display: none;">
		<div
			style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5);">
			<div
				style="background: white; padding: 20px; border-radius: 5px; width: 300px; margin: 15% auto; text-align: center;">
				<p>Bạn có chắc chắn muốn xóa người dùng này?</p>
				<div>
					<button id="confirm-btn"
						style="margin-right: 10px; background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Xác
						nhận</button>
					<button onclick="closeDialog()"
						style="background-color: #f44336; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Hủy</button>
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

		document.getElementById("confirm-btn").onclick = function() {
			// Điều hướng đến URL xóa
			window.location.href = deleteUrl;
		};
	</script>


</body>
</html>