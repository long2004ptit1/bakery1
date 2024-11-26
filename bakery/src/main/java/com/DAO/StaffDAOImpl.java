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
        String sql = "INSERT INTO staff (name, phone, role, username, password) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, staff.getName());
            pstmt.setString(2, staff.getPhone());
            pstmt.setString(3, staff.getRole());
            pstmt.setString(4, staff.getUsername());  // Thêm username
            pstmt.setString(5, staff.getPassword());  // Thêm password
            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
            System.err.println("Lỗi khi lấy danh sách nhân viên: " + e.getMessage());
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
                    staff.setUsername(rs.getString("username")); // Lấy username
                    staff.setPassword(rs.getString("password")); // Lấy password
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
        String query = "UPDATE staff SET name = ?, phone = ?, role = ?, username = ?, password = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, staff.getName());
            ps.setString(2, staff.getPhone());
            ps.setString(3, staff.getRole());
            ps.setString(4, staff.getUsername());  // Cập nhật username
            ps.setString(5, staff.getPassword());  // Cập nhật password
            ps.setInt(6, staff.getId());
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
            System.err.println("Lỗi khi kiểm tra số điện thoại: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteStaff(int id) {
        String sql = "DELETE FROM staff WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi khi xóa nhân viên: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public List<Staff> searchStaff(String keyword, String filter) {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM staff";

        // Xử lý bộ lọc tìm kiếm
        if (filter != null) {
            switch (filter) {
                case "id":
                    sql += " WHERE id LIKE ?";
                    break;
                case "timecreate":
                    sql += " WHERE DATE_FORMAT(created_at, '%Y-%m-%d') LIKE ?";
                    break;
                case "all":
                default:
                    sql += " WHERE name LIKE ? OR phone LIKE ?";
                    break;
            }
        }

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            if ("id".equals(filter) || "timecreate".equals(filter)) {
                pstmt.setString(1, "%" + keyword + "%");
            } else {
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setId(rs.getInt("id"));
                    staff.setName(rs.getString("name"));
                    staff.setPhone(rs.getString("phone"));
                    staff.setRole(rs.getString("role"));
                    staff.setCreatedAt(rs.getTimestamp("created_at"));

                    staffList.add(staff);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    


}
