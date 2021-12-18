<!-- 데이터베이스 커넥터 생성 -->
<%@ page import="java.sql.*"%>?
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;

		String url = "jdbc:mysql://localhost:3316/message";
		String user = "root";
		String password = "root";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

	%>
</body>
</html>