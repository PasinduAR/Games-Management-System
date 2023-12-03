package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Game_Order;

public class GameOrderImpl implements GameOrderDAO {

	private Connection conn;

	public GameOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveOrder(List<Game_Order> blist) {
		boolean f = false;
		try {

			String sql = "insert into game_order(order_id,user_name,email,address,phone,game_name,developer,price,payment) values(?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Game_Order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getGameName());
				ps.setString(7, b.getDeveloper());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Game_Order> getGame(String email) {
		List<Game_Order> list = new ArrayList<Game_Order>();
		Game_Order o = null;

		try {

			String sql = "select * from game_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Game_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setGameName(rs.getString(7));
				o.setDeveloper(rs.getString(8));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Game_Order> getAllOrder() {
		List<Game_Order> list = new ArrayList<Game_Order>();
		Game_Order o = null;

		try {

			String sql = "select * from game_order ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Game_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setGameName(rs.getString(7));
				o.setDeveloper(rs.getString(8));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
