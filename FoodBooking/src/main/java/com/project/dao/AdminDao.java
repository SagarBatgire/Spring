package com.project.dao;

import java.sql.Connection;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.model.Food;


public interface AdminDao {
	public Connection getDbConnection();
	public ArrayList<Food> getFood();
	public boolean addMenu(String[]foodId);
}
