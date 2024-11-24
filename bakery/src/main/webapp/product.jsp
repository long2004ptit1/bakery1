<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cake is for life</title>
<!--Link to CSS -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/all_component/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/all_component/product.css">
<!--box Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!--Link Swiper Css-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
	<!-- Navbar -->
	<%@include file="all_component/header.jsp"%>
	<!-- Product-->
	<section id="products">
		<h2>Tất cả sản phẩm</h2>
		<div class="product-category">
			<h3 id="christmas-cake">Bánh giáng sinh</h3>
			<div class="products-container">
				<div class="product-grid">
					<div class="product-card">
						<img src="img/product-xmas-cake1.webp" alt="">
						<h3>Bánh Quả thông Noel</h3>
						<h4 class="price">230.000VNĐ</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake2.jpg" alt="">
						<h3>
							Cookie <br> Noel
						</h3>
						<h4 class="price">
							200.000VNĐ <span>/ 6 bánh</span>
						</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake3.jpg" alt="">
						<h3>
							Bánh tuần lộc <br> Caramel
						</h3>
						<h4 class="price">280.000VNĐ</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake4.jpg" alt="">
						<h3>
							Ngôi nhà Gừng <br> Xmas
						</h3>
						<h4 class="price">500.000VNĐ</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake5.jpg" alt="">
						<h3>
							CupCake <br> Xmas
						</h3>
						<h4 class="price">
							30.000VNĐ <span>/ 1 cupcake</span>
						</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>

					<div class="product-card">
						<img src="img/product-xmas-cake6.webp" alt="">
						<h3>
							Bánh sinh nhật <br> Noel
						</h3>
						<h4 class="price">300.000VNĐ</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>

					<div class="product-card">
						<img src="img/product-xmas-cake7.jpg" alt="">
						<h3>Bánh Giáng sinh Tiny Party</h3>
						<h4 class="price">
							250.000VNĐ <span>/ box</span>
						</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake8.jpg" alt="Cookies">
						<h3>Cookie Hạnh nhân Mistletoe</h3>
						<h4 class="price">
							130.000VNĐ <span>/ 4 cookies</span>
						</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-xmas-cake9.jpg" alt="Bánh xoài Tiny">
						<h3>Bánh bông lan Gỗ Giáng sinh</h3>
						<h4 class="price">130.000VNĐ</h4>
						<a href="product-detail.jsp"> <i
							class='bx bx-cart-alt cart-icon'></i>
						</a> <i class='bx bx-heart heart-icon'></i>
					</div>

				</div>

			</div>
		</div>
		</div>
		</div>

		<div class="product-category">
			<h3 id="bread">Bánh mỳ</h3>
			<div class="products-container">
				<div class="product-grid">
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
				</div>
			</div>
		</div>

		<div class="product-category">
			<h3 id="pastry">Bánh ngọt</h3>
			<div class="products-container">
				<div class="product-grid">
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
				</div>
			</div>
		</div>

		<div class="product-category">
			<h3 id="Bingsu">Bingsu</h3>
			<div class="products-container">
				<div class="product-grid">
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
				</div>
			</div>
		</div>

		<div class="product-category">
			<h3 id="birthdaycake">Bánh sinh nhật</h3>
			<div class="products-container">
				<div class="product-grid">
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
					<div class="product-card">
						<img src="img/product-cake3.webp" alt="">
						<h3>Bánh xoài Tiny</h3>
						<h4 class="price">
							130.000VNĐ <span>/ mini size</span>
						</h4>
						<i class='bx bx-cart-alt cart-icon'></i> <i
							class='bx bx-heart heart-icon'></i>
					</div>
				</div>
			</div>
		</div>

		<div class="product-category">
			<h3>Bánh sinh nhật</h3>
			<div class="product-grid">
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
				<div class="product-card">
					<img src="https://via.placeholder.com/200"
						alt="Bánh kem hình heo hồng">
					<h3>Bánh kem sinh nhật Fondant cho bé tạo hình heo hồng</h3>
					<p>900,000đ</p>
				</div>
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
				<div class="product-card">
					<img src="img/product1.avif" alt="Bánh kem McDonald's">
					<h3>Bánh kem Fondant chúc mừng Mc Donald's 1 thập kỷ</h3>
					<p>Liên hệ</p>
				</div>
			</div>
		</div>
		</div>
	</section>

	<footer>
		<!-- Footer -->
		<section class="footer" id="footer">
			<div class="footer-box">
				<a href="#" class="logo"><i class='bx bxs-basket'></i>Snow
					Pastry</a>
				<p>
					24, Phố Hai Bà Trưng, Tràng Tiền <br>Hoàn Kiếm, Hà Nội
				</p>
				<div class="social">
					<a href="#"><i class='bx bxl-facebook'></i></a> <a href="#"><i
						class='bx bxl-twitter'></i></a> <a href="#"><i
						class='bx bxl-instagram'></i></a> <a href="#"><i
						class='bx bxl-youtube'></i></a>
				</div>
			</div>
			<div class="footer-box">
				<h2>Danh mục</h2>
				<a href="#">Bread</a> <a href="#">Pastry & Pie</a> <a href="#">Bingsu</a>
				<a href="#">Cake</a>
			</div>
			<div class="footer-box">
				<h2>Thông tin liên hệ</h2>
				<a href="#">Hotline tư vấn: 1900 779 907</a> <a href="#">Hotline
					khiếu nại: 0948225982</a> <a href="#">Liên hệ hợp tác: 0921004598</a> <a
					href="#">Email: support@snow.vn</a>
			</div>
			<div class="footer-box">
				<h2>Newsletter</h2>
				<p>
					Get 10% Discount with <br>Email Newsletter
				</p>
				<form action="">
					<i class='bx bxs-envelope'></i> <input type="email" name="" id=""
						placeholder="Nhập Email của bạn"> <i
						class='bx bx-arrow-back bx-rotate-180'></i>
				</form>
			</div>
		</section>
	</footer>
	<!-- Copyright -->
	<div class="copy-right">
		<p>&#169; CarpoolVenom All Rights Reserved. Công ty TNHH Snow Việt
			Nam.</p>
	</div>
</body>
</html>
