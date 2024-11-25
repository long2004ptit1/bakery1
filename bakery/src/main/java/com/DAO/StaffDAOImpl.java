package com.DAO;

import com.entity.Staff;
import com.DB.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAOImpl implements StaffDAO {

    private Connection conn;

    public StaffDAOImpl() {
        this.conn = DBConnect.getConn();
    }

    @Override
    public boolean addStaff(Staff staff) {
        boolean isAdded = false;
        String sql = "INSERT INTO staff (name, phone, role) VALUES (?, ?, ?)";
        try (Connection conn = DBConnect.getConn(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getPhone());
            pstmt.setString(3, staff.getRole());
            int rows = pstmt.executeUpdate();
            isAdded = rows > 0; // Kiểm tra nếu số dòng thêm vào > 0
            if (rows > 0) {
                System.out.println("Thêm nhân viên thành công!");
            } else {
                System.out.println("Thêm nhân viên thất bại!");
            }

        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console để debug
        }
        return isAdded;
        
    }



    @Override
    public List<Staff> getAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("id"));
                staff.setName(rs.getString("name"));
                staff.setPhone(rs.getString("phone"));
                staff.setRole(rs.getString("role"));
                staff.setCreatedAt(rs.getTimestamp("created_at"));

                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffList;
    }


    @Override
    public Staff getStaffById(int id) {
        Staff staff = null;
        String query = "SELECT * FROM staff WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff();
                    staff.setId(rs.getInt("id"));
                    staff.setName(rs.getString("name"));
                    staff.setPhone(rs.getString("phone"));
                    staff.setRole(rs.getString("role"));
                    staff.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staff;
    }

    @Override
    public boolean updateStaff(Staff staff) {
        String query = "UPDATE staff SET name = ?, phone = ?, role = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, staff.getName());
            ps.setString(2, staff.getPhone());
            ps.setString(3, staff.getRole());
            ps.setInt(4, staff.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
    @Override
    public boolean isPhoneExists(String phone) {
        String sql = "SELECT COUNT(*) FROM staff WHERE phone = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, phone);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean deleteStaff(int id) {
        String sql = "DELETE FROM staff WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0; // Trả về true nếu số hàng bị xóa > 0
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    
    
    
    
}

