package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
    private Connection conn;

    // Constructor
    public UserDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User us) {
        boolean isRegistered = false;
        try {
            String sql = "INSERT INTO user (name, username, phone, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getUserName());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isRegistered = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }

    @Override
    public User login(String username, String password) {
        User us = null;
        try {
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us = new User();
                us.setId(rs.getInt("id"));
                us.setName(rs.getString("name"));
                us.setUserName(rs.getString("username"));
                us.setPhone(rs.getString("phone"));
                us.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }
    
    public List<User> getAllUsers(){
    	List<User> userList= new ArrayList<>();
    	try {
    		String sql="SELECT * FROM user";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next()) {
    			User user=new User();
    			user.setId(rs.getInt("id"));
    			user.setName(rs.getString("name"));
    			user.setUserName(rs.getString("username"));
    			user.setPhone(rs.getString("phone"));
    			user.setPassword(rs.getString("password"));
    			user.setCreatedAt(rs.getTimestamp("created_at"));
    			userList.add(user);
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return userList;
    }
    
}
