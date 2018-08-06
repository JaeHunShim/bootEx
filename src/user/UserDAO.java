package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;


public class UserDAO {
	private Connection conn;//데이터 베이스에 접근하게함.
private PreparedStatement pstmt;//
private ResultSet rs;//어떠한 정보를 담을 수 있음.


public UserDAO() {
	try{
		String dbURL="jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8"; 
		String dbID = "root";
		String dbPassword = "wognsl83";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID,dbPassword);
		
	}catch(Exception e) {
		e.printStackTrace();//오류를 잡아냄
	}

}

public int login( String userID, String userPassword)
{String SQL = "SELECT userPassword,userChar FROM USER WHERE userID = ?";
try{
	pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	if(rs.next()) {
			if(rs.getString(1).equals(userPassword)) {
				
				return 1;//로그인 성공
			}
			else return 0;//비밀번호 불일치
	}
	return -1;//아이디가 없음
}
catch(Exception e) {
	e.printStackTrace();//오류를 잡아냄
	}
finally {if(rs!= null) {try{rs.close();}catch(SQLException se) {}
}
if(pstmt != null) {try{pstmt.close();}catch(SQLException se) {}
}
if(conn != null) {try{conn.close();}catch(SQLException se) {}
}
}
return -2;//데이터베이스 오류
}

public String getUserChar1(String userID){
	String SQL = "SELECT userChar FROM USER WHERE userID = ?";
	String userChar = null;
	try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			User user = new User();
			user.setUserChar(rs.getString(1));
			userChar = (String)user.getUserChar();
			System.out.println(userChar);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return userChar;
}

public int join(User user)
{
	String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
	try {
	 pstmt = conn.prepareStatement(SQL);
	 pstmt.setString(1, user.getUserChar());
	 pstmt.setString(2, user.getUserID());
	 pstmt.setString(3, user.getUserPassword());
	 pstmt.setString(4, user.getUserPassword2());
	 pstmt.setString(5, user.getUserGender());
	 pstmt.setString(6, user.getUserEmail());
	 return pstmt.executeUpdate();
	}catch(Exception e) {
	e.printStackTrace();	
	}
	return -1;
}
}
