package com.project.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.project.model.Food;

public interface AdminService {
	public Connection getDbConnection();
	public ArrayList<Food> getFood();
	public boolean addMenu(String[]foodId);
}
