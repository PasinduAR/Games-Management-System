package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.GameDAOImpl;
import com.DB.DBConnect;
import com.entity.GameDtls;

@WebServlet("/updategames")
public class EditGamesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String GameName = req.getParameter("gname");
			String developer = req.getParameter("developer");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			GameDtls b=new GameDtls();
			b.setGameId(id);
			b.setGameName(GameName);
			b.setDeveloper(developer);
			b.setPrice(price);
			b.setStatus(status);
			
			GameDAOImpl dao=new GameDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditGames(b);
			
			HttpSession session=req.getSession();
			
			if(f) 
			{
				session.setAttribute("succMsg", "Game Update Successfully...");
				resp.sendRedirect("admin/all_games.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong on Server...");
				resp.sendRedirect("admin/all_games.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
