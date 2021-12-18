
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<%@ page contentType="text/html; charset=utf-8"%>
<html>
	<head>

		<style>
			table, th, td {
			  
			  border-collapse: collapse;
			  font-family: 'Nanum Gothic', sans-serif;
			  font-size:13;
			}
			td,th{
				text-align:center;
				padding:15px;
				border-bottom: 1px solid grey;
			}
			th{
				background-color:#E6E6E6;
				
			}
		</style>
	</head>
	<body>

		<%@ include file="dbconn.jsp" %> 

		<br><br><br>
		<table style="margin-left: auto; margin-right: auto;width:1000;">
			<tr>
				<th>아이디</th>
				<th>내용</th>
				<th>카테고리</th>
			</tr>
			
			<%
				//messageBox 번호가 일치하는 messege & 카테고리 이름에 해당하는 데이터 가져오기
				String cgr = request.getParameter("r1");
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				String sql = "select messagebox.memberId, message.message, message.category from(messagebox, message) where(messagebox.boxNum=message.boxNum) and (category LIKE ?)";

					
				try{
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, "%"+cgr+"%");
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
						String memberId = rs.getString("memberId");
						String message = rs.getString("message");
						String category = rs.getString("category");

			%>
			<tr>
				<td><%=memberId%></td>
				<td><%=message%></td>
				<td><%=category%></td>
			</tr>
			<%
					}
				}catch (SQLException ex) {
					out.println("테이블 호출이 실패했습니다");
				}finally{
					if (rs != null)
						rs.close();
			 		if (pstmt != null)
			 			pstmt.close();
			 		if (conn != null)
						conn.close();
					}
				%>
		</table>

	</body>
</html>