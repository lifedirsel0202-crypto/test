<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
(과정평가형 정보처리산업기사) 차량주행관리 프로그램
</header>
<nav>
<a href="selectList.jsp">차량조회</a>
<a href="addList.jsp">주행내역등록</a>
<a href="driveList.jsp">주행내역조회</a>
<a href="carAvg.jsp">부서별주행통계</a>
<a href="index.jsp">홈으로</a>
</nav>
<section class= "container">
<h2>차량조회</h2>
<table class="tableBox">
<tbody>
<tr>
<th>차량번호</th>
<th>모델</th>
<th>제조사</th>
<th>구매일</th>
</tr>

<%

 Connection conn= null;
 Statement stmt= null;
 ResultSet rs= null;
try{
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/car","root","admin");
	stmt = conn.createStatement();
	
		String sql= "SELECT * FROM TBL_CAR";
		rs= stmt.executeQuery(sql);
			SimpleDateFormat sdf1= new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2= new SimpleDateFormat("yyyy년MM월dd일");
		
		while(rs.next()){
			
			String carDate = rs.getString("car_date");
			String date = sdf2.format(sdf1.parse(carDate));
	%>
	
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=date %></td>
</tr>
<%
	}

}catch(Exception e){
	e.printStackTrace();
}finally{
	
	if (rs != null )  { rs.close();}
	if (stmt != null){stmt.close();}
	if (conn != null){conn.close();}
}


%>


</tbody>
</table>
</section>
<footer>
HRDKOREA Copyright&copy;2020 All right Human Reserved Service of Korea
</footer>
</body>
</html>
