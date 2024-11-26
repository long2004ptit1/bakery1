package com.DAO;

import com.entity.Staff;
import java.util.List;

public interface StaffDAO {
    boolean addStaff(Staff staff);
    boolean updateStaff(Staff staff);
    boolean deleteStaff(int id);
    List<Staff> getAllStaff();
    Staff getStaffById(int id);
    boolean isPhoneExists(String phone);
    List<Staff> searchStaff(String keyword, String filter);

    
}
