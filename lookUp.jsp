<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel= "stylesheet" href="main.css">
</head>
<body>
<header>
(과정평가형 정보처리산업기사) 차량주행관리 프로그램
</header>
<nav>
<a href="lookUp.jsp">차량조회</a>
<a href="inputDive.jsp">주행내역등록</a>
<a href="driveHistory.jsp">주행내역조회</a>
<a href="driveAvg.jsp">부서별주행통계</a>
<a href="index.jsp">홈으로</a>
</nav>
<section class="container">
<h2>차량조회</h2>
<table class="Tb">
<tbody>
<tr>
<th>차량번호</th>
<th>모델</th>
<th>제조사</th>
<th>구매일</th>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest","root","admin");
	Statement stmt = conn.createStatement();
	String sql = "select car_no 차량번호, car_model 모델, car_company 제조사, car_date 구매일"
			+" from tbl_car";
	
	ResultSet rs= stmt.executeQuery(sql);
	
	while (rs.next()){
		
		String carDate= rs.getString("구매일");
		
		SimpleDateFormat sdf1= new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년MM월dd일");
		String date= sdf2.format(sdf1.parse(carDate));
	%>
<tr>
<td><%= rs.getString("차량번호") %></td>
<td><%=rs.getString("모델") %></td>
<td><%=rs.getString("제조사") %></td>
<td><%=date %></td>
</tr>
<%
}
%>
</tbody>
</table>
</section>
<footer>
HRDKOREA Copyright &copy;2020 All right reserved Human....service of Korea  
</footer>
</body>
</html>