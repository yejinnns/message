package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConn {
	Connection conn = null;

	public DbConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("����̹��� ã�ҽ��ϴ�.");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3316/message", "root", "root");
            System.out.println("�����ͺ��̽��� ���������� ���� �Ͽ����ϴ�.");
		} catch (ClassNotFoundException e) {
			System.out.println("����̹��� �˻� �� �� �����ϴ�.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("�����ͺ��̽� ���� ����!");
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		DbConn connection = new DbConn();
		
		
		System.out.println("���α׷��� �����մϴ�.");
	}

}



	


