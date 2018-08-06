package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
      
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
String userChar = request.getParameter("userChar");
System.out.println("유저별명:" + userChar);
response.getWriter().write(getJSON(userChar));
	}

	public String getJSON(String userChar) {
		if(userChar == null)userChar = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDAO userDAO = new UserDAO();
		/*ArrayList<User> userList = userDAO.search(userChar);*/
		/*for(int i = 0; i<userList.size(); i++) {
			result.append("[{\"value\": \"" + userList.get(i).getUserChar() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getUserGender() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getUserEmail() + "\"}],");
		}*/
		result.append("]}");
		return result.toString();
	}
}
