package com.project.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDao;
import com.project.model.Food;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	
	public AdminServiceImpl() {
		super();
	}

	@Override
	public Connection getDbConnection() {
		
		return adminDao.getDbConnection();
	}

	
	
	@Override
	public boolean addMenu(String[] foodId) {
		
		return adminDao.addMenu(foodId);
	}

	@Override
	public ArrayList<Food> getFood() {
		
		return adminDao.getFood();
	}
	
	
}
