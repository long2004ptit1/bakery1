package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.entity.Category;

public class CategoryDAOImpl implements CategoryDAO {
	private Connection conn;
	 public CategoryDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	 public boolean addCategory(Category category) {
	        boolean f = false;
	        try {
	            String sql = "INSERT INTO category (id, name, thumbnail, description, created_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, category.getId());
	            ps.setString(2, category.getName());
	            ps.setString(3, category.getThumbnail());
	            ps.setString(4, category.getDescription());
	            

	            int i = ps.executeUpdate();
	            if (i == 1) {
	                f = true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return f;
	    }
	 
	 @Override
	 public boolean isCategoryExists(String id) {
	     boolean exists = false;
	     try {
	         String sql = "SELECT id FROM category WHERE id = ?";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, id);
	         ResultSet rs = ps.executeQuery();

	         // Nếu có kết quả trả về, nghĩa là mã danh mục đã tồn tại
	         if (rs.next()) {
	             exists = true;
	         }

	     } catch (Exception e) {
	         e.printStackTrace();
	     }

	     return exists;
	 }

	 @Override
	 public boolean updateCategory(Category category) {
	     boolean isUpdated = false;
	     try {
	         String sql = "UPDATE category SET name = ?, thumbnail = ?, description = ?, updated_at = NOW() WHERE id = ?";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, category.getName());
	         ps.setString(2, category.getThumbnail());
	         ps.setString(3, category.getDescription());
	         ps.setString(4, category.getId());

	         int rows = ps.executeUpdate();
	         if (rows > 0) {
	             isUpdated = true;
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return isUpdated;
	 }


	@Override
	public boolean deleteCategory(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Category getCategoryById(String id) {
	    Category category = null;
	    try {
	        String sql = "SELECT * FROM category WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            category = new Category();
	            category.setId(rs.getString("id"));
	            category.setName(rs.getString("name"));
	            category.setThumbnail(rs.getString("thumbnail"));
	            category.setDescription(rs.getString("description"));
	            category.setCreatedAt(rs.getTimestamp("created_at"));
	            category.setUpdatedAt(rs.getTimestamp("updated_at"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return category;
	}


	@Override
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
