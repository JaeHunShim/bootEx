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
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/board";
			String dbID = "root";
			String dbPassword ="wognsl83";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			System.out.println("접속여부"+conn);
		}catch(Exception e) {
			System.out.println("접속불량");
			e.getStackTrace();
		}
	}
	public ArrayList<User> search(String userName){
		
		String SQL = "select * from user where userName like ?";
		
		ArrayList<User> userList = new ArrayList<User>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" +userName + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				System.out.println("첫번째:" + rs.getString(1));
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEamil(rs.getString(4));
				
				userList.add(user);
			}
		}catch(Exception e) {
			e.getStackTrace();
		}
		return userList;
	}
}
