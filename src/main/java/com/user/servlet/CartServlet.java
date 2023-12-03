package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.GameDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.GameDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			int gid=Integer.parseInt(req.getParameter("gid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			GameDAOImpl dao=new GameDAOImpl(DBConnect.getConn());
			GameDtls b=dao.getGameById(gid);
			
			Cart c=new Cart();
			c.setGid(gid);
			c.setUserId(uid);
			c.setGameName(b.getGameName());
			c.setDeveloper(b.getDeveloper());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart","Game Added to Cart");
				resp.sendRedirect("all_latest_game.jsp");
			}else {
				session.setAttribute("failed","Something Wrong on Server");
				resp.sendRedirect("all_latest_game.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
