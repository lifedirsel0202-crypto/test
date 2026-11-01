<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
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
<h2>(부서별) 주행통계</h2>
<table class="Tb">
<tbody>
<tr>
<th>부서코드</th>
<th>부서명</th>
<th>총운행거리</th>
<th>총주유금액</th>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest","root","admin");
	Statement stmt = conn.createStatement();
	String sql = "select td.dept_code 부서코드, td.dept_name 부서명, sum(drv_end-drv_start) 총운행거리, sum(drv_money) 총주유금액"
			+" from tbl_dept td join tbl_drive tv on td.dept_code=tv.dept_code"
			+" group by 부서코드";

	
	ResultSet rs= stmt.executeQuery(sql);
	
	while (rs.next()){
		
		
		
		DecimalFormat df1 = new DecimalFormat("￦#,###");
		
		int drvm = rs.getInt("총주유금액");
		String drvMomey = df1.format(drvm);
	%>
<tr>
<td><%=rs.getString("부서코드") %></td>
<td><%=rs.getString("부서명") %></td>
<td><%=rs.getString("총운행거리") %></td>
<td><%=drvMomey%></td>
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