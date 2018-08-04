package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserDAO {
	private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	 
	 public UserDAO() {
	  try{
	   String dbURL = "jdbc:mysql://localhost:3306/board";
	  String dbID = "root";
	  String dbPassword = "wognsl83";
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection(dbURL ,dbID,dbPassword);
	  }catch (Exception e) {
	   e.printStackTrace();
	  }
	 }
	 
	 public ArrayList<User> search(String userChar){
	  String SQL = "SELECT* FROM USER WHERE userChar LIKE ?";
	 ArrayList<User> userList = new ArrayList<User>();
	 try {
	  pstmt = conn.prepareStatement(SQL);
	  pstmt.setString(1,  "%" + userChar + "%");
	  rs = pstmt.executeQuery();
	  while(rs.next()) {
	   User user = new User();
	   user.setUserChar(rs.getString(1));
	   user.setUserID(rs.getString(2));
	   user.setUserGender(rs.getString(3));
	   user.setUserEmail(rs.getString(4));
	 
	  userList.add(user);
	  }
	 }
	 catch(Exception e) {
	  e.printStackTrace();
	 }
	 return userList;
	 }
	 
	 public int register(User user)
	 {
	String SQL = "INSERT INTO USER VALUES(?,?,?,?)";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserChar());
		pstmt.setString(2, user.getUserID());
		pstmt.setString(3, user.getUserGender());
		pstmt.setString(4, user.getUserEmail());
		return pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -1;

	 }
}
