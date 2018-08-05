package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userChar = request.getParameter("userChar");
		String userID = request.getParameter("userID");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		System.out.println("아이디정보:" + userID);
		response.getWriter().write(register(userChar, userID, userGender, userEmail) +"");
	}
public int register(String userChar,String userID,String userGender,String userEmail) {
User user = new User();
try {
	user.setUserChar(userChar);
	user.setUserID(userID);
	user.setUserGender(userGender);
	user.setUserEmail(userEmail);
}catch(Exception e)
{return 0;}
return new UserDAO().register(user);
}
}
