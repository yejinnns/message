<html>
<body>
<%@ include file="dbconn.jsp" %>
   <%
         String cid = request.getParameter("floatingId");
         String passwd = request.getParameter("floatingPassword");
         
         ResultSet rs = null;         
         PreparedStatement pstmt = null;

         try {
        	 
        	//데이터베이스에서 아이디와 비밀번호 불러오기
            String sql = "select * from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            rs.next();
            
            
            String id = rs.getString("id");
            String pw = rs.getString("pwd");
            if (pw.equals(passwd) && cid.equals(id)) {
    %>
   <script>
      alert('로그인 성공')
      location.href='Main.jsp'
   </script>
   <%
            }else if(!pw.equals(passwd) && cid.equals(id)){
   %>
   <script>
      //로그인 실패 메세지
      alert('비밀번호 오류')
      location.href='login.jsp'
   </script>   
   <%
            }
   
            
         } catch (SQLException ex) {
   %>
   <script>
      alert('아이디 오류')
      location.href='login.jsp'
   </script>   
   <%
   //DB연결 종료
         } finally {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         }
   %>
</body>
</html>