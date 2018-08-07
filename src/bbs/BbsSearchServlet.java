package bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BbsSearchServlet")
public class BbsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String bbsContent = request.getParameter("bbsContent");
			System.out.println("content" + bbsContent);

			response.getWriter().write(getJSON1(bbsContent));
	}
		public String getJSON1(String bbsContent) {
		if(bbsContent == null)bbsContent = "";
		  StringBuffer result = new StringBuffer("");
		  result.append("{\"result\":[");
		  BbsDAO bbsDAO = new BbsDAO();
		  ArrayList<Bbs> bbsList = bbsDAO.search(bbsContent);
		  for(int i = 0; i<bbsList.size(); i++) {
		   result.append("[{\"value\": \"" + bbsList.get(i).getBbsID() + "\"},");
		   result.append("{\"value\": \"" + bbsList.get(i).getBbsTitle() + "\"},");
		   result.append("{\"value\": \"" + bbsList.get(i).getUserChar() + "\"},");
		   result.append("{\"value\": \"" + bbsList.get(i).getBbsDate() + "\"}],");
		   
		   System.out.println("가지고오는 id" + bbsList.get(i).getBbsID());
		  }
		  result.append("]}");
		  return result.toString();
		 }
		

	}

