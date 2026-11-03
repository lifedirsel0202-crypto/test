<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<h2>(부서별) 주행통계</h2>
<table class="tableBox">
<tbody>
<tr>
<th>부서코드</th>
<th>부서명</th>
<th>총운행거리</th>
<th>총주유금액</th>
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
	
		String sql= "select td.dept_code, td.dept_name, sum(drv_end-drv_start) totalD,sum(drv_money) totlaM" 
				+" from tbl_dept td right outer join tbl_drive tv on td.dept_code= tv.dept_code"
				+" group by td.dept_code,td.dept_name";
		rs= stmt.executeQuery(sql);
		
		while(rs.next()){
			
			DecimalFormat df= new DecimalFormat("￦#,###");
			
			int tm = rs.getInt("totlaM");
			String totalMoney = df.format(tm);
			
			
	%>
	
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td class= "D-List"><%=rs.getString(3) %></td>
<td class= "D-List"><%=totalMoney %></td>
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
