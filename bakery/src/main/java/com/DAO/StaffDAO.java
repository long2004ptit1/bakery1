package com.DAO;

import com.entity.Staff;
import java.util.List;

public interface StaffDAO {
    boolean addStaff(Staff staff); // Thêm nhân viên
    List<Staff> getAllStaff();     // Lấy danh sách nhân viên


    // Lấy thông tin nhân viên theo ID
    Staff getStaffById(int id);
    
 // Xóa nhân viên theo ID
    boolean deleteStaff(int id);

    // Cập nhật thông tin nhân viên
    boolean updateStaff(Staff staff);

    // Kiểm tra số điện thoại đã tồn tại
    boolean isPhoneExists(String phone);
}
