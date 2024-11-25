package com.entity;

import java.sql.Timestamp;

public class Staff {
    private int id;                // Khóa chính
    private String name;           // Tên nhân viên
    private String phone;          // Số điện thoại
    private String role;           // Vai trò
    private Timestamp createdAt;   // Thời gian tạo (dạng Timestamp)

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Timestamp getCreatedAt() {
        return createdAt; // Kiểu trả về là Timestamp
    }

    public void setCreatedAt(Timestamp createdAt) { // Sửa phương thức để nhận Timestamp
        this.createdAt = createdAt;
    }
}
