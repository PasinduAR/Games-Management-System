package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.GameDtls;

public class GameDAOImpl implements GameDAO {

	private Connection conn;

	public GameDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addGames(GameDtls b) {
		boolean f = false;
		try {
			String sql = "insert into game_dtls(gamename,developer,price,gameCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getGameName());
			ps.setString(2, b.getDeveloper());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getGameCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<GameDtls> getAllGames() {

		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;

		try {
			String sql = "select * from game_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public GameDtls getGameById(int id) {

		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where gameId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateEditGames(GameDtls b) {
		boolean f = false;
		try {
			String sql = "update game_dtls set gamename=?,developer=?,price=?,status=? where gameId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getGameName());
			ps.setString(2, b.getDeveloper());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getGameId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteGames(int id) {
		boolean f = false;
		try {
			String sql = "delete from game_dtls where gameId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<GameDtls> getNewGames() {

		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where gameCategory=? and status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getLatestGames() {

		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getOldGames() {

		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where gameCategory=? and status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getAllLatestGame() {
		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getAllUpcomingGame() {
		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where gameCategory=? and status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getAllOldGame() {
		List<GameDtls> list = new ArrayList<GameDtls>();
		GameDtls b = null;
		try {
			String sql = "select * from game_dtls where gameCategory=? and status=? order by gameId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new GameDtls();
				b.setGameId(rs.getInt(1));
				b.setGameName(rs.getString(2));
				b.setDeveloper(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setGameCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GameDtls> getGameByOld(String email, String cate) 
		{
			List<GameDtls> list = new ArrayList<GameDtls>();
			GameDtls b = null;
			try {

				String sql = "select * from game_dtls where gameCategory=? and email=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, cate);
				ps.setString(2, email);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					b = new GameDtls();
					b.setGameId(rs.getInt(1));
					b.setGameName(rs.getString(2));
					b.setDeveloper(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setGameCategory(rs.getString(5));
					b.setStatus(rs.getString(6));
					b.setPhotoName(rs.getString(7));
					b.setEmail(rs.getString(8));
					list.add(b);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}	

	public boolean oldGameDelete(String email, String cat, int id) {
		boolean f=false;
		try {
			String sql="delete from game_dtls where gameCategory=? and email=? and gameId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
