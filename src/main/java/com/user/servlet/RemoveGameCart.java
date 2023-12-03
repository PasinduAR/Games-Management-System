package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_game")
public class RemoveGameCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int gid=Integer.parseInt(req.getParameter("gid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
		boolean f=dao.deleteGame(gid,uid,cid);
		HttpSession session=req.getSession();
		
		if (f)
		{
			session.setAttribute("succMsg","Game Remove From Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg","Something Wrong On Server");
			resp.sendRedirect("checkout.jsp");
		}
		
	}
	
	

}
