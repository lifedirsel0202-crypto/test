<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.annotation.Documented"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn= null;
	PreparedStatement pstmt= null;

	try{
		request.setCharacterEncoding("utf-8");
		Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car","root","admin");
	
		String drvDate = request.getParameter("drvDate");
		String carNo = request.getParameter("carNo");
		int drvStart = Integer.parseInt(request.getParameter("drvStart"));
		int drvEnd = Integer.parseInt(request.getParameter("drvEnd"));
		String deprCode = request.getParameter("deprCode");
		int drvMoney = Integer.parseInt(request.getParameter("drvMoney"));
	
		String inserSql= "INSERT INTO TBL_DRIVE values(?,?,?,?,?,?)";
	
		pstmt = conn.prepareStatement(inserSql);
	
		pstmt.setString(1, drvDate);
		pstmt.setString(2, carNo);
		pstmt.setInt(3, drvStart);
		pstmt.setInt(4, drvEnd);
		pstmt.setString(5, deprCode);
		pstmt.setInt(6, drvMoney);
	
		pstmt.executeUpdate();
		
} catch(Exception e){
	e.printStackTrace();
} finally{
	
	if(pstmt != null){pstmt.close();}
	if(conn != null){conn.close();}
}
%>

</body>
</html>