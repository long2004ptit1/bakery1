package com.DAO;

import java.util.List;

import com.entity.Category;

public interface CategoryDAO {
	    boolean addCategory(Category category);
	    boolean updateCategory(Category category); 
	    boolean deleteCategory(String id); 
	    Category getCategoryById(String id); 
	    List<Category> getAllCategories();
	    boolean isCategoryExists(String id);
	}

