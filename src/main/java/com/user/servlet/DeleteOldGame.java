package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.GameDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_game")
public class DeleteOldGame extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			
			GameDAOImpl dao=new GameDAOImpl(DBConnect.getConn());
			
			boolean f=dao.oldGameDelete(em, "Old",id);

			HttpSession session=req.getSession();
			
			if (f)
			{
				session.setAttribute("succMsg","Old Game Delete Successfully..");
				resp.sendRedirect("old_game.jsp");
			}else {
				session.setAttribute("succMsg","Something Wrong On Server");
				resp.sendRedirect("old_game.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	
}
