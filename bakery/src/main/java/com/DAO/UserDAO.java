package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us); // phương thức để đăng ký: sẽ trả về true hoặc false
	public User login(String username, String password);
}
