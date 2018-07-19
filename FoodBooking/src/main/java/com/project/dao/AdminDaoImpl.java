package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.model.Food;

@Repository
public class AdminDaoImpl implements AdminDao{

	private Connection con;
	public AdminDaoImpl() {
		super();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/MyDb","root","");
		} 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}




	@Override
	public boolean addMenu(String[] foodId) {
		Date date=new Date();
		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(dt1.format(date).toString());
		String dateString=dt1.format(date).toString();
		int status=0;
		
		try {
			PreparedStatement statement1=con.prepareStatement("delete from Menu where date=?");
			statement1.setString(1,dateString);
			statement1.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		for(String id:foodId)
		{
			try 
			{
				PreparedStatement statement=con.prepareStatement("insert into Menu(foodId,date) values(?,?)");
				statement.setInt(1,Integer.parseInt(id));
				statement.setString(2,dateString);
				status=statement.executeUpdate();
			} 
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(status==0)
			return false;
		else
			return true;
	}




	@Override
	public ArrayList<Food> getFood() {
		ArrayList<Food>foodList=new ArrayList<Food>();
		try 
		{
			PreparedStatement statement=con.prepareStatement("select *from Food");
			ResultSet rs=statement.executeQuery();
			while(rs.next())
			{
				Food food=new Food();
				food.setFoodId(rs.getInt(1));
				food.setFoodName(rs.getString(2));
				food.setCatId(rs.getInt(3));
				food.setPrice(rs.getInt(4));

				foodList.add(food);
			}
		} 

		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodList;
	}




	@Override
	public Connection getDbConnection() {
		return con;
	}

}
