<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Glassmorphism Registration Form | CodingNepal</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
  @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Open Sans", sans-serif;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  width: 100%;
  padding: 0 10px;
}
body::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: url('/Bakery/img/background-home.png');
  background-position: center;
  background-size: cover;
}
.wrapper {
  width: 400px;
  border-radius: 8px;
  padding: 30px;
  text-align: center;
  border: 1px solid rgba(255, 255, 255, 0.5);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
}
form {
  display: flex;
  flex-direction: column;
}
h2 {
  font-size: 2rem;
  margin-bottom: 20px;
  color: black;
}
.input-field {
  position: relative;
  border-bottom: 2px solid #ccc;
  margin: 15px 0;
}
.input-field label {
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  color: black;
  font-size: 16px;
  pointer-events: none;
  transition: 0.15s ease;
}
.input-field input {
  width: 100%;
  height: 40px;
  background: transparent;
  border: none;
  outline: none;
  font-size: 16px;
  color: black;
}
.input-field input:focus~label,
.input-field input:valid~label {
  font-size: 0.8rem;
  top: 10px;
  transform: translateY(-120%);
}
.eye-icon {
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
  color: black;
}
.wrapper a {
  color: black;
  text-decoration: none;
}
.wrapper a:hover {
  text-decoration: underline;
}
button {
  background: #fff;
  color: #000;
  font-weight: 600;
  border: none;
  padding: 12px 20px;
  cursor: pointer;
  border-radius: 3px;
  font-size: 16px;
  border: 2px solid transparent;
  transition: 0.3s ease;
}
button:hover {
  color: #fff;
  border-color: #fff;
  background: rgba(255, 255, 255, 0.15);
}
.register {
  text-align: center;
  margin-top: 30px;
  color: black;
}
.message {
  color: red;
  margin-bottom: 15px;
}
  </style>
</head>
<body>
  <div class="wrapper">
    <!-- Thông báo lỗi hoặc thành công -->
    <% 
    String errorMsg = (String) session.getAttribute("errorMsg");
    String successMsg = (String) session.getAttribute("successMsg");
    if (errorMsg != null) {
%>
    <div style="color: red; margin-bottom: 15px;"><%= errorMsg %></div>
<% 
        session.removeAttribute("errorMsg"); 
    } else if (successMsg != null) { 
%>
    <div style="color: green; margin-bottom: 15px;"><%= successMsg %></div>
    <script>
        setTimeout(function() {
            window.location.href = "<%= request.getContextPath() %>/login.jsp";
        }, 3000); // Chuyển hướng sau 3 giây
    </script>
<%
        session.removeAttribute("successMsg"); 
    }
%>

    <!-- Form đăng ký -->
    <form action="/Bakery/register" method="POST">


      <h2>Đăng ký</h2>
      <div class="input-field">
        <input type="text" name="name" required>
        <label>Họ tên</label>
      </div>
      <div class="input-field">
        <input type="text" name="username" required>
        <label>Tên đăng nhập</label>
      </div>
      <div class="input-field">
        <input type="tel" name="phone" required>
        <label>Số điện thoại</label>
      </div>
      <div class="input-field">
        <input type="password" id="password" name="password" required>
        <label>Mật khẩu</label>
        <span id="toggle-password" class="eye-icon"><i class="fas fa-eye"></i></span>
      </div>
      <div class="input-field">
        <input type="password" id="confirm-password" name="confirm-password" required>
        <label>Xác nhận lại mật khẩu</label>
        <span id="toggle-confirm-password" class="eye-icon"><i class="fas fa-eye"></i></span>
      </div>
      <button type="submit">Đăng ký</button>
      <div class="register">
        <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
      </div>
      <!-- Biểu tượng Trở về -->
    <a href="index.jsp" class="back-icon">
      <i class="fas fa-arrow-left"></i> Trở về trang chủ
    </a>
    </form>
  </div>
  <script>
    document.getElementById("toggle-password").addEventListener("click", function () {
      var passwordField = document.getElementById("password");
      var icon = this.querySelector("i");
      if (passwordField.type === "password") {
        passwordField.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        passwordField.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    });
    
    document.getElementById("toggle-confirm-password").addEventListener("click", function () {
      var confirmPasswordField = document.getElementById("confirm-password");
      var icon = this.querySelector("i");
      if (confirmPasswordField.type === "password") {
        confirmPasswordField.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        confirmPasswordField.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    });
  </script>
</body>
</html>
