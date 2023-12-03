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

@WebServlet("/delete")
public class GamesDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			GameDAOImpl dao = new GameDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteGames(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Game Delete Successfully...");
				resp.sendRedirect("admin/all_games.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Wrong on Server...");
				resp.sendRedirect("admin/all_games.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
