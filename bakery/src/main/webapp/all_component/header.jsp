<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cake is for life</title>
<!--Link to CSS -->
<link rel="stylesheet" href="style.css">
<!--box Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!--Link Swiper Css-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>

/* Profile Section */
.navbar.profile {
	display: flex;
	justify-content: flex-end; /* Align to the right */
	gap: 5px; /* Add space between login and register links */
	list-style-type: none;
}

.navbar.profile li  {
	display: inline-flex;
	white-space: nowrap; /* Prevent text from wrapping to a new line */
}

.navbar.profile a {
	font-size: 1.1rem;
	font-weight: 500;
	color: var(- -text-color);
	padding: 0rem 0.3rem; /* Adjust padding to allow more space */
	text-decoration: none; /* Remove underline from the links */
}

.navbar.profile a:hover {
	background: var(- -green-color);
	border-radius: 6rem;
	color: var(- -bg-color);
}

/* Định dạng cho ô chứa nút Đăng xuất */
.logout-container {
	background-color: #ff7f7f; /* Màu đỏ */
	border-radius: 5px;
	padding: 0.3rem 0.7rem; /* Giảm padding để đủ không gian */
	display: inline-block;
	margin-left: 10px;
}

/* Định dạng cho nút Đăng xuất */
.logout-button {
	color: black;
	font-size: 0.8rem;
	font-weight: 500;
	text-decoration: none;
	display: inline-block;
	text-align: center;
	white-space: nowrap; /* Ngăn chữ bị xuống dòng */
}

.logout-button:hover {
	opacity: 0.8; /* Hiệu ứng khi hover */
}


/* Định dạng cho dropdown */
.dropdown {
    position: relative;
}

.dropdown .dropdown-menu {
    display: none; /* Ẩn menu theo mặc định */
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    padding: 10px 0;
    min-width: 150px;
    z-index: 1000;
}

.dropdown .dropdown-menu a {
    display: block;
    padding: 10px 15px;
    color: black;
    text-decoration: none;
    font-size: 0.9rem;
}

.dropdown .dropdown-menu a:hover {
    background-color: var(- -green-color); /* Màu nền khi hover */
    color:white;
}

/* Hiển thị menu khi click vào tên người dùng */
.dropdown.active .dropdown-menu {
    display: block;
}

</style>
</head>
<body>
	<!-- Navbar -->
	<header>
		<div class="logo-container">
			<a href="home.jsp"> <img src="img/logo2.png" alt="logo" class="logo-img">
			</a>
		</div>
		<!-- Menu Icon -->
		<div class="bx bx-menu" id="menu-icon"></div>
		<!-- Nav List -->
		<ul class="navbar">
			<li><a href="home.jsp#home" class="home-active">Trang chủ</a></li>
			<li><a href="home.jsp#categories">Danh mục</a></li>
			<li><a href="home.jsp#products">Sản phẩm</a></li>
			<li><a href="home.jsp#about">Chúng tôi</a></li>
			<li><a href="home.jsp#customers">Khách hàng</a></li>
		</ul>

		<%-- Kiểm tra nếu người dùng đã đăng nhập --%>
		<div class="profile">
			<c:if test="${not empty userobj}">
				<ul class="navbar profile">
					<li><a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a></li>
					<!-- Icon Giỏ hàng -->
					<li><a href="messages.jsp"><i class="fas fa-solid fa-bell"></i></a></li>
					<!-- Icon Hộp thư -->
					   <li class="dropdown">
                <a href="#" class="username">${userobj.name}</a>
                <div class="dropdown-menu">
                    <a href="profile.jsp">Thông tin cá nhân</a>
                    <a href="change-password.jsp">Đổi mật khẩu</a>
                    <a href="orders.jsp">Đơn hàng của tôi</a>
                </div>
            </li>


				</ul>
				<div class="logout-container">
					<a href="logout" class="logout-button">Đăng xuất</a>
					<!-- Nút Đăng xuất -->
				</div>
			</c:if>
			<c:if test="${empty userobj}">
				<ul class="navbar profile">
					<li><a href="login.jsp">Đăng nhập</a></li>
					<li><a href="register.jsp">Đăng ký</a></li>
				</ul>
			</c:if>
		</div>


	</header>



</body>
</html>