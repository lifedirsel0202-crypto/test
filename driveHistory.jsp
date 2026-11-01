<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	String driveDate = request.getParameter("driveDate");
	String carNo = request.getParameter("carNo");
	int drvStart = Integer.parseInt(request.getParameter("drvStart"));
	int drvEnd = Integer.parseInt(request.getParameter("drvEnd"));
	String department = request.getParameter("department");
	
	
	%> 
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
<h2>주행내역조회</h2>
<table class="Tb">
<tbody>
<tr>
<th>주행일자</th>
<th>차량번호</th>
<th>모델</th>
<th>출발Km</th>
<th>도착Km</th>
<th>부서명</th>
<th>주유금액</th>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest","root","admin");
	Statement stmt = conn.createStatement();
	String sql = "select drv_date 주행일자,td.car_no 차량번호, tc.car_model 모델, drv_start 출발Km, drv_end 도착Km, dept_name 부서명, drv_money 주유금액"
			+ " from tbl_drive td join tbl_dept tt on td.dept_code= tt.dept_code"
			+ " join tbl_car tc on td.car_no = tc.car_no";

	
	ResultSet rs= stmt.executeQuery(sql);
	
	while (rs.next()){
		
		String carDate= rs.getString("주행일자");
		
		SimpleDateFormat sdf1= new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년MM월dd일");
		String date= sdf2.format(sdf1.parse(carDate));
		
		DecimalFormat df = new DecimalFormat("#,###");
		DecimalFormat df1 = new DecimalFormat("￦#,###");
		
		int drvs = rs.getInt("출발Km");
		String drvStart = df.format(drvs);
		
		int drve = rs.getInt("도착Km");
		String drvEnd =df.format(drve);
		
		int drvm = rs.getInt("주유금액");
		String drvMoney = df1.format(drvm);
	%>
<tr>
<td><%= date %></td>
<td><%=rs.getString("차량번호") %></td>
<td><%=rs.getString("모델") %></td>
<td><%=drvStart %></td>
<td><%=drvEnd %></td>
<td><%=rs.getString("부서명") %></td>
<td><%=drvMoney%></td>
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