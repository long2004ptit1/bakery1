<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cake is for life</title>
    <!--Link to CSS -->
    <link rel="stylesheet" href="all_component/style.css">
    <!--box Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!--Link Swiper Css-->
    <link
    rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <style>
    /* Profile Section */
        .navbar.profile {
          display: flex;
          justify-content: flex-end; /* Align to the right */
          gap: 10px; /* Add space between login and register links */
          list-style-type: none;
        }
        
        .navbar.profile li {
          display: inline-flex;
          white-space: nowrap; /* Prevent text from wrapping to a new line */
        }
        
        .navbar.profile a {
          font-size: 1.1rem;
          font-weight: 500;
          color: var(--text-color);
          padding: 0.1rem 1rem; /* Adjust padding to allow more space */
          text-decoration: none; /* Remove underline from the links */
        }
        
        .navbar.profile a:hover {
          background: var(--green-color);
          border-radius: 5rem;
          color: var(--bg-color);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <header>
        <div class="logo-container">
            <a href="#">
                <img src="img/logo2.png" alt="logo" class="logo-img">
            </a>
        </div>        
        <!-- Menu Icon -->
        <div class="bx bx-menu" id="menu-icon"></div>
        <!-- Nav List -->
        <ul class="navbar">
            <li><a href="#home" class="home-active">Trang chủ</a></li>
            <li><a href="#categories">Danh mục</a></li>
            <li><a href="#products">Sản phẩm</a></li>
            <li><a href="#about">Chúng tôi</a></li>
            <li><a href="#customers">Khách hàng</a></li>
        </ul>
        <!-- Profile -->
<!--         <div class="profile">
            <img src="img/profile.jpg" alt="">
            <span>Minh Phươngg</span>
            <i class='bx bx-caret-down'></i>
        </div> -->
        <!-- Profile -->
    <div class="profile" >
        <ul class="navbar profile">
            <li><a href="login.jsp">Đăng nhập</a></li>
            <li><a href="register.jsp">Đăng ký</a></li>
        </ul>

    </div>
    </header>
    <!-- Swiper Carousel -->
    <div class="swiper carousel">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="img/Pasted Graphic 3.png" alt="Slide 1">
            </div>
            <div class="swiper-slide">
                <img src="img/Pasted Graphic 2.png" alt="Slide 2">
            </div>
            <div class="swiper-slide">
                <img src="img/Pasted Graphic 1.png" alt="Slide 3">
            </div>
            <div class="swiper-slide">
                <img src="img/wintersale.png" alt="Slide 4">
            </div>
            <div class="swiper-slide">
                <img src="img/Pasted Graphic 5.png" alt="Slide 5">
            </div>
        </div>
        
        <!-- Navigation buttons -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <!-- Pagination -->
        <div class="swiper-pagination"></div>
    </div>

    <!-- Home -->
    <section class="home swiper" id="home">
        <div class="swiper-wrapper">
            <div class="swiper-slide container">
                <div class="home-text">
                    <span>Chúng tôi là Snow Pastry</span>
                    <h1>Bánh xinh đẹp <br>nguyên liệu chất lượng <br>hương vị thơm ngon</h1>
                    <a href="#" class="btn">Mua ngay!<i class='bx bx-right-arrow-alt'></i></a>
                </div>
                <img src="img/cake1.png" alt="Ice Cream">
            </div>
            <div class="swiper-slide container">
                <div class="home-text">
                    <span>Chúng tôi là Snow Pastry</span>
                    <h1>Bánh xinh đẹp <br>nguyên liệu chất lượng <br>hương vị thơm ngon</h1>
                    <a href="#" class="btn">Mua ngay!<i class='bx bx-right-arrow-alt'></i></a>
                </div>
                <img src="img/homebingsu.png" alt="Ice Cream">
            </div>

            <div class="swiper-slide container">
                <div class="home-text">
                    <span>Tuyết tan - vị ngọt lan</span>
                    <h1>Bingsu mát lạnh <br>Tận hưởng bingsu <br>đánh thức vị giác</h1>
                    <a href="#" class="btn">Shop now<i class='bx bx-right-arrow-alt'></i></a>
                </div>
                <img src="img/homebingsu.png" alt="Home Image 2">
            </div>

            <div class="swiper-slide container">
                <div class="home-text">
                    <span>Christmas Cake</span>
                    <h1>Chọn bánh cho Christmas <br>tại Snow Pastry <br>đặt trước</h1>
                    <a href="#" class="btn">Shop now<i class='bx bx-right-arrow-alt'></i></a>
                </div>
                <img src="img/homechristmas.png" alt="Home Image 3">
            </div>
        </div>
        <!-- Navigation buttons -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <!-- Pagination -->
        <div class="swiper-pagination"></div>
    </section>
    <!-- web savor-->
    <section class="mousse-collection">
        <div class="mousse-content">
            <div class="mousse-info">
                <h2>Bộ sưu tập bánh Christmas <br>
                    <span class="highlight">Cookies</span>
                    <span class="highlight1">Cake</span>
                    <span class="highlight">Panettone</span>
                </h2>
                <p>
                    Chào đón mùa lễ hội Snow ra mắt bộ sưu tập bánh giáng sinh, bao gồm cookies thơm giòn, cake mềm mịn, và Panettone truyền thống Ý đầy hấp dẫn. 🎄🍪.
                    Ngọt ngào không thể chối từ - mỗi chiếc bánh trong bộ sưu tập đều mang hương vị ấm áp của Giáng Sinh để tận hưởng cùng gia đình và bạn bè. 🎁🍰
                </p>
            </div>
            <div class="mousse-images">
                <img src="img/Christmas1.png" alt="Bánh mousse 1" class="mousse-img">
                <img src="img/Christmas2.png" alt="Bánh mousse 2" class="mousse-img">
                <img src="img/Christmas3.png" alt="Bánh mousse 3" class="mousse-img">
            </div>
        </div>
    </section>
     
    <!-- Categories Danh mục -->
    
    <section class="categories" id="categories">
        <div class="heading">
            <h1>Menu <br><span>Danh sách các loại sản phẩm</span></h1>
            <a href="product.jsp" class="btn" target="_blank">Xem thêm<i class='bx bx-right-arrow-alt'></i></a>
        </div>
        <div class="categories-container">
            <div class="box box1">
                <img src="img/catechristmas.png" alt="">
                <h2 class="christmas">Christmas</h2>
                <span class="christmas">12 Items</span>
                <a href="product.jsp#christmas-cake">
                    <i class='bx bx-right-arrow-alt'></i>
                </a>
            </div>
            <div class="box box2">
                <img src="img/catebread.png" alt="">
                <h2>Bánh mì</h2>
                <span>5 Items</span>
                <a href="product.jsp#bread">
                    <i class='bx bx-right-arrow-alt'></i>
                </a>
            </div>
            <div class="box box3">
                <img src="img/catepastry.png" alt="">
                <h2>Bánh ngọt</h2>
                <span>12 Items</span>
                <a href="product.jsp#pastry">
                    <i class='bx bx-right-arrow-alt'></i>
                </a>
            </div>
            <div class="box box4">
                <img src="img/catebingsu.png" alt="">
                <h2>Bingsu</h2>
                <span>5 Items</span>
                <a href="product.jsp#bingsu">
                    <i class='bx bx-right-arrow-alt'></i>
                </a>
            </div>
            <div class="box box5">
                <img src="img/catecake.png" alt="">
                <h2>Bánh sinh nhật</h2>
                <span>10 Items</span>
                <a href="product.jsp#birthdaycake">
                    <i class='bx bx-right-arrow-alt'></i>
                </a>
            </div>
        </div>
    </section>
    <!-- Products -->
    <section class="products" id="products">
        <div class="heading">
            <h1>Most popular products<br><span>Những sản phẩm được yêu thích nhất</span></h1>
            <a href="product.jsp" class="btn">Xem thêm<i class='bx bx-right-arrow-alt'></i></a>
        </div>
        <!-- Product Content -->
        <div class="products-container">
            <!-- Box 1 -->
            <div class="box">
                <img src="img/product-cafe-cake.avif" alt="">
                <span>Cake Items</span>
                <h2>Bánh sinh nhật Socola </h2>
                <h3 class="price">300.000VNĐ <span>/ size 16</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>
            </div>
            <!-- Box 2 -->
            <div class="box">
                <img src="img/product-daisy.avif" alt="">
                <span>Cake Items</span>
                <h2>Bánh sinh nhật Daisy </h2>
                <h3 class="price">500.000VNĐ <span>/ size 18</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>
            </div>
            <!-- Box 3 -->
            <div class="box">
                <img src="img/product-minicake.webp" alt="">
                <span>Cake Items</span>
                <h2>Bánh dâu Tiny </h2>
                <h3 class="price">100.000VNĐ <span>/ mini size</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>
            </div>
            <!-- Box 4 -->
            <div class="box">
                <img src="img/product-crossaint.png">
                <span>Pastry Items</span>
                <h2>Crossaint Hạnh nhân</h2>
                <h3 class="price">30.00VNĐ <span>/ 1 chiếc</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>

            </div>
            <!-- Box 5 -->
            <div class="box">
                <img src="img/product-cake2.webp" alt="">
                <span>Cake Items</span>
                <h2>Bánh sinh nhật Xoài</h2>
                <h3 class="price">300.000VNĐ <span>/ size 16</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>
            </div>
            <!-- Box 5 -->
            <div class="box">
                <img src="img/product-cake3.webp" alt="">
                <span>Cake Items</span>
                <h2>Bánh xoài Tiny</h2>
                <h3 class="price">130.000VNĐ <span>/ mini size</span></h3>
                <i class='bx bx-cart-alt'></i>
                <i class='bx bx-heart'></i>
            </div>
        </div>
    </section>
    <!-- About -->
    <section class="about" id="about">
        <img src="img/about.png" alt="">
        <div class="about-text">
            <span>Về Snow Pastry</span>
            <p>Snow Pastry cam kết mang đến những chiếc bánh chất lượng cao, mềm mịn, ẩm mượt và tốt cho sức khỏe.</p>
            <p>Chúng tôi cung cấp đa dạng các loại bánh ngọt và kem, được chế biến để mang lại niềm vui trong từng miếng bánh.

            </p>
            <a href="#" class="btn">Tìm hiểu thêm<i class='bx bx-right-arrow-alt'></i></a>
        </div>
    </section>
    <!-- Customers -->
    <section class="customers" id="customers">
        <h2>Tại sao khách hàng yêu Snow Pastry?</h2>
        <!-- Customers Content -->
        <div class="customer-container">
            <!-- Review 1 -->
            <div class="box">
                <div class="review-profile">
                    <img src="img/c1.jpg" alt="">
                    <h3>Vũ Long Thành</h3>
                </div>
                <br>
                <i class='bx bxs-quote-alt-left'></i>
                <div class="stars">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>
                <p>Bánh sinh nhật ở Snow Pastry thật sự ngon và trang trí rất đẹp, khiến buổi tiệc của gia đình tôi trở nên hoàn hảo hơn!</p>
                
            </div>
            <!-- Review 2 -->
            <div class="box">
                <div class="review-profile">
                    <img src="img/c2.jpg" alt="">
                    <h3>Nguyễn Lê Minh</h3>
                </div>
                <i class='bx bxs-quote-alt-left'></i>
                <div class="stars">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>
                <p>Bingsu ở Snow Pastry là món yêu thích của tôi vào những ngày hè nóng bức, vừa mát lạnh vừa ngọt ngào, đúng là tuyệt vời!</p>
                
            </div>
            <!-- Review 3 -->
            <div class="box">
                <div class="review-profile">
                    <img src="img/c3.jpg" alt="">
                    <h3>Lê Huy Phúc</h3>
                </div>
                <i class='bx bxs-quote-alt-left'></i>
                <div class="stars">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star-half'></i>
                </div>
                <p>Bánh mì và bánh ngọt ở đây luôn tươi mới và thơm phức, tôi ghé mua mỗi tuần và chưa bao giờ thất vọng.</p>
                
            </div>
        </div>
    </section>
    <footer>
        <!-- Footer -->
        <section class="footer" id="footer">
            <div class="footer-box">
                <a href="#" class="logo"><i class='bx bxs-basket'></i>Snow Pastry</a>
                <p>24, Phố Hai Bà Trưng, Tràng Tiền <br>Hoàn Kiếm, Hà Nội</p>
                <div class="social">
                    <a href="#"><i class='bx bxl-facebook'></i></a>
                    <a href="#"><i class='bx bxl-twitter'></i></a>
                    <a href="#"><i class='bx bxl-instagram'></i></a>
                    <a href="#"><i class='bx bxl-youtube'></i></a>
                </div>
            </div>
            <div class="footer-box">
                <h2>Danh mục</h2>
                <a href="#">Bread</a>
                <a href="#">Pastry & Pie</a>
                <a href="#">Bingsu</a>
                <a href="#">Cake</a>
            </div>
            <div class="footer-box">
                <h2>Thông tin liên hệ</h2>
                <a href="#">Hotline tư vấn: 1900 779 907</a>
                <a href="#">Hotline khiếu nại: 0948225982</a>
                <a href="#">Liên hệ hợp tác: 0921004598</a>
                <a href="#">Email: support@snow.vn</a>
            </div>
            <div class="footer-box">
                <h2>Newsletter</h2>
                <p>Get 10% Discount with <br>Email Newsletter</p>
                <form action="">
                    <i class='bx bxs-envelope'></i>
                    <input type="email" name="" id="" placeholder="Nhập Email của bạn">
                    <i class='bx bx-arrow-back bx-rotate-180'></i>
                </form>   
            </div>
        </section>
    </footer>
    <!-- Copyright -->
    <div class="copy-right">
        <p>&#169; CarpoolVenom All Rights Reserved. Công ty TNHH Snow Việt Nam.</p>
    </div>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- Link To JS -->
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        let menuIcon = document.querySelector('#menu-icon');
        let navbar = document.querySelector('.navbar');

        // Khi click vào menu-icon
        menuIcon.onclick = () => {
            navbar.classList.toggle('active'); // Thêm hoặc bỏ class 'active' khi click vào icon
        };
    });

    document.addEventListener('DOMContentLoaded', () => {
        // Swiper for the Carousel
        const carouselSwiper = new Swiper('.carousel', {
            loop: true, // Lặp lại các slide vô hạn
            autoplay: {
                delay: 3000, // Tự động chuyển sau 3 giây
                disableOnInteraction: false, // Không dừng lại khi người dùng tương tác
            },
            pagination: {
                el: '.swiper-pagination', // Phần tử pagination
                clickable: true, // Cho phép click vào các nút pagination
            },
            navigation: {
                nextEl: '.swiper-button-next', // Nút "Next"
                prevEl: '.swiper-button-prev', // Nút "Prev"
            },
        });

        // Swiper for the Home Section
        const homeSwiper = new Swiper('.home', {
            loop: true, // Lặp lại các slide vô hạn
            autoplay: {
                delay: 3000, // Tự động chuyển sau 3 giây
                disableOnInteraction: false, // Không dừng lại khi người dùng tương tác
            },
            pagination: {
                el: '.swiper-pagination', // Phần tử pagination
                clickable: true, // Cho phép click vào các nút pagination
            },
            navigation: {
                nextEl: '.swiper-button-next', // Nút "Next"
                prevEl: '.swiper-button-prev', // Nút "Prev"
            },
        });
    });

   




    </script>
</body>
</html>

    
