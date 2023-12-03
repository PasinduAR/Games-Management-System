package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.GameDAOImpl;
import com.DB.DBConnect;
import com.entity.GameDtls;

@WebServlet("/add_old_game")
@MultipartConfig
public class AddOldGame extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String GameName = req.getParameter("gname");
			String developer = req.getParameter("developer");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("gimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");

			GameDtls b = new GameDtls(GameName, developer, price, categories, status, fileName, useremail);

			GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());

			boolean f=dao.addGames(b);
			  
			HttpSession session=req.getSession();
			  
			if(f) {
				
				String path = getServletContext().getRealPath("") + "games";

				File file = new File(path);
				
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Game Add Sucessfully..");
				resp.sendRedirect("sell_game.jsp");
			  
			} else {
		
				session.setAttribute("failedMsg", "Something Wrong on Server..");
				resp.sendRedirect("sell_game.jsp"); 
			}
			 

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
