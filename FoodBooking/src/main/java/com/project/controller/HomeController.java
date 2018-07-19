package com.project.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDao;
import com.project.dao.AdminDaoImpl;
import com.project.model.Food;
import com.project.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderHome(Locale locale, Model model) {
		ArrayList<Food>foodList=adminService.getFood();
		System.out.println("list size: "+foodList.size());
		for(Food food:foodList)
			System.out.println(food);
		
		model.addAttribute("foodList", foodList);
		return "orderHome";
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String menu(Locale locale, Model model) {
		System.out.println("in Controller");
		return "orderHome";
	}
	
	@RequestMapping(value = "/uploadMenu", method = RequestMethod.POST)
	public @ResponseBody String uploadMenu(Locale locale, Model model,@RequestParam("data")String data) {
		System.out.println("uploadMenu() data:"+data);
		String menuItems[]=data.split(",");
		
		boolean flag=adminService.addMenu(menuItems);
		System.out.println("menu insert result: "+flag);
		for(String s:menuItems)
			System.out.println(s);
		return "done";
	}
	
}
