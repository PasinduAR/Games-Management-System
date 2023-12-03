package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.GameDtls;

public interface GameDAO {
	
	public boolean addGames(GameDtls b);

	public List<GameDtls> getAllGames();
	
	public GameDtls getGameById(int id);
	
	public boolean updateEditGames(GameDtls b);
	
	public boolean deleteGames(int id);
	
	public List<GameDtls> getNewGames();
	
	public List<GameDtls> getLatestGames();
	
	public List<GameDtls> getOldGames();
	
	public List<GameDtls> getAllLatestGame();
	
	public List<GameDtls> getAllUpcomingGame();
	
	public List<GameDtls> getAllOldGame();
	
	public List<GameDtls> getGameByOld(String email,String cate);
	
	public boolean oldGameDelete(String email,String cat,int id);
	
}
