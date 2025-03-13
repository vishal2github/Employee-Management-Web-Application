<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navbar.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%
  String eid=request.getParameter("eid");
  Class.forName("com.mysql.cj.jdbc.Driver");
  
  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10","root","micql@5132");
  PreparedStatement ps=cn.prepareStatement("update employeeinfo set firstname=?, lastname=?, phone=?, emailid=?, department=?, salary=? where eid=?");
  ps.setString(1, request.getParameter("firstname"));
  ps.setString(2, request.getParameter("lastname"));
  ps.setString(3, request.getParameter("phone"));
  ps.setString(4, request.getParameter("emailid"));
  ps.setString(5, request.getParameter("department"));
  ps.setInt(6, Integer.parseInt(request.getParameter("salary")));
  ps.setInt(7, Integer.parseInt(request.getParameter("eid")));
  
  ps.executeUpdate();
  %>
  
  <div class="dv">
  	  <label class="lamsg" style="color:green">Employee has been updated successfully!</label>
    </div>
</body>
</html>
