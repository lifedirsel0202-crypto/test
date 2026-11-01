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
<FORM ACTION="driveHistory.jsp" METHOD="POST">
<h2>주행내역등록</h2>
<table class="Tb">
<tr>
<th>주행일자</th>
<td class="inTd"><input type="text" name="driveDate"><span>2023년01월01일 예)20230101</span></td>
</tr>
<tr>
<th>차량번호</th>
<td class="inTd"><input type="text" name="carNo"><span>예)10가0001</span></td>
</tr>
<tr>
<th>출발Km</th>
<td class="inTd"><input type="text" name="drvStart"><span>Km</span></td>
</tr>
<tr>
<th>도착Km</th>
<td class="inTd"><input type="text" name="drvEnd"><span>Km</span></td>
</tr>
<tr>
<th>부서코드</th>
<td class="inTd"><select name="department">
<option value="">부서</option>
<option value="[10]영업부">[10]영업부</option>
<option value="[20]총무부">[20]총무부</option>
<option value="[30]구매부">[30]구매부</option>
<option value="[40]개발부">[40]개발부</option>
</select></td>
</tr>
<tr>
<th>주유금액</th>
<td class="inTd"><input type="text" name="drvMoney">원</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="주행내역등록" class="inputBtn">
<input type="reset" value="다시쓰기" class="resetBtn">

</td>
</tr>
</table>
</FORM>
</section>
<footer>
HRDKOREA Copyright &copy;2020 All right reserved Human....service of Korea  

</footer>
</body>
</html>