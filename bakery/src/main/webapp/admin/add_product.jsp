<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-container {
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 400px;
    text-align: center; /* Canh giữa nội dung trong form-container */
}

h2 {
    margin-top: 100px;
    margin-bottom: 10px;
    font-size: 24px;
    color: #333;
}

form div {
    margin-bottom: 15px;
    text-align: left;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input[type="text"], input[type="number"], textarea, select, input[type="file"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
}

button:hover {
    background-color: #45a049;
}

</style>

</head>
<body>
<%@include file="header.jsp"%>


 <div class="form-container">
        <h2>Thêm sản phẩm mới</h2>
        <form action="../AddProductServlet" method="POST" enctype="multipart/form-data">
        
 			<div>
                <label for="id">Mã sản phẩm:</label>
                <input type="text" id="id" name="id" required>
            </div>
                   
            <div>
                <label for="category">Danh mục:</label>
                <input type="text" id="category" name="category" required>
            </div>
            <div>
                <label for="name">Tên sản phẩm:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div>
                <label for="price">Giá sản phẩm:</label>
                <input type="number" id="price" name="price" required>
            </div>
            <div>
                <label for="discount">Mức giảm giá:</label>
                <input type="number" id="discount" name="discount" value="0">
            </div>
            <div>
                <label for="image">Hình ảnh:</label>
                <input type="file" id="image" name="image" accept="image/*" required>
            </div>
            <div>
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4"></textarea>
            </div>
            <button type="submit">Thêm sản phẩm</button>
        </form>
    </div>
</body>
</html>