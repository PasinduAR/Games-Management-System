package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.GameDtls;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getGameByUser(int userId);
	
	public boolean deleteGame(int gid, int uid, int cid);

}
