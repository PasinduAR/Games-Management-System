package com.DAO;

import java.util.List;

import com.entity.Game_Order;

public interface GameOrderDAO {
	
	public boolean saveOrder(List<Game_Order> b);
	
	public List<Game_Order> getGame(String email);
	
	public List<Game_Order> getAllOrder();

}
