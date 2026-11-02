<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<h2>차량조회</h2>
<table class="tableBox">
<tbody>
<tr>
<th>주행일자</th>
<th>차량번호</th>
<th>출발Km</th>
<th>도착Km</th>
<th>부서코드</th>
<th>주유금액</th>
</tr>

<%

 Connection conn= null;
 Statement stmt= null;
 ResultSet rs= null;
try{
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/car","root","admin");
	
		String sql= "SELECT drv_date, td.car_no, drv_start, drv_end, td.dept_code, drv_money"
				+" FROM TBL_DRIVE TD LEFT OUTER JOIN TBL_CAR tc ON TD.CAR_NO= tc.CAR_NO"
				+" LEFT OUTER JOIN TBL_DEPT TP ON TP.DEPT_CODE= TD.DEPT_CODE";
		stmt = conn.createStatement();
		rs= stmt.executeQuery(sql);
		
		while(rs.next()){
			
			String carDate = rs.getString("drv_date");
			
			SimpleDateFormat sdf1= new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2= new SimpleDateFormat("yyyy년MM월dd일");
			
			String date = sdf2.format(sdf1.parse(carDate));
			
			DecimalFormat df1= new DecimalFormat("#,###");
			DecimalFormat df2= new DecimalFormat("￦#,###");
			
			int drvs = rs.getInt("drv_start");
			String drvStart = df1.format(drvs);
			
			int drve = rs.getInt("drv_end");
			String drvEnd = df1.format(drve);
			
			int drvm= rs.getInt("drv_money");
			String drvMoney = df2.format(drvm);
	%>
	
<tr>
<td><%=rs.getString("drv_date") %></td>
<td><%=rs.getString("td.car_no") %></td>
<td><%=drvStart %></td>
<td><%=drvEnd%></td>
<td><%=rs.getString("td.dept_code") %></td>
<td><%=drvMoney%></td>
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