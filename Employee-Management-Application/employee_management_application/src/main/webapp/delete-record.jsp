<%@ include file="navbar.jsp" %>
<link href="CSS/bodyBGC.css" rel="stylesheet">

<html>
  <body onload="makeActive('delete')">
  
  <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10","root","micql@5132");
    
    PreparedStatement ps=cn.prepareStatement("delete from employeeinfo where eid=?");
    ps.setString(1,request.getParameter("eid"));
    
    ps.executeUpdate();
  %> 
   
  <div class="dv">
  	<label class="lamsg" style="color: red">Employee record has been deleted successfully!</label>
  </div>
 </body>
</html>