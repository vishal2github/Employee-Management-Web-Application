<html>
  <body onload="makeActive('delete')">
  <%
  String eid=request.getParameter("eid");
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10","root","micql@5132");
  PreparedStatement ps=cn.prepareStatement("select * from employeeinfo where eid=?");
  ps.setString(1,eid);
  ResultSet rst=ps.executeQuery();
  if(rst.next())
  {
  %>
	  <%@ include file="navbar.jsp" %>
	  <link href="CSS/bodyBGC.css" rel="stylesheet">
	  
	  <form action="delete-record.jsp">
	  <table class='tar' border='1' style="background-color: whitesmoke; color: black; width: 55%" cellpadding='6px'>
	   <tr style="background-color: #ff4141; color: white">
	    <th colspan="2" style="text-align: center">Employee Details</th>
	   </tr>
	   <tr>
	    <th align="left">Employee Id</th>
	    <td><%=eid%><input type="hidden" name="eid" value="<%=eid%>"></td>
	   </tr>
	   <tr>
	    <th align="left">First name</th>
	    <td><%=rst.getString(2)%></td>
	   </tr>
	   <tr>
	    <th align="left">Last name</th>
	    <td><%=rst.getString(3)%></td>
	   </tr>
	   <tr>
	    <th align="left">Phone number</th>
	    <td><%=rst.getString(4)%></td>
	   </tr>
	   <tr>
	    <th align="left">Email id</th>
	    <td><%=rst.getString(5)%></td>
	   </tr>
	   <tr>
	    <th align="left">Department</th>
	    <td><%=rst.getString(6)%></td>
	   </tr>
	   <tr>
	    <th align="left">Salary</th>
	    <td>&#8377;<%=rst.getString(7)%></td>
	   </tr>
	   <tr>
	    <td colspan="2" align="right">
	     <button class='btn btn-danger'>Confirm Delete</button>
	    </td>
	   </tr>
	  </table>
	  </form>
  <%
    }
    else
    {
  %>
  
	  <jsp:include page="delete.jsp" />
	  <div class="dvv">
	   <label style="color: red; font-size: 1.6vw">Employee record with id <%= eid %> does not exist!</label>
	  </div>
	  
  <%
    }
  %>
 </body>
</html>