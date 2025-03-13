<%@ include file="navbar.jsp" %>
  <link href="CSS/bodyBGC.css" rel="stylesheet">
<html>
  <body onload="makeActive('edit')">
  
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
    
  <div class='container'>
  	<div class='card col-md-10 mx-auto'>
  	 <div class='card-body'>
  	  <form action="update-record.jsp" method="post">
  	   <div class='row'>
  	    <div class='form-group col-md-10'>
  	      <label>Enter Employee ID</label><span> *</span>
  	      <input type="number" value='<%=rst.getString(1)%>' class='form-control' name='eid' readonly="readonly"> 
  	    </div>
  	   </div>
  	   <div class='row'>
  	    <div class='form-group col-md-5'>
  	      <label>Edit First Name</label><span> *</span>
  	      <input type="text" value='<%=rst.getString(2)%>' class='form-control' name='firstname' required>
  	    </div>
  	    <div class='form-group col-md-5'>
  	      <label>Edit Last Name</label><span> *</span>
  	      <input type="text" value='<%=rst.getString(3)%>' class='form-control' name='lastname' required>
  	    </div>
  	   </div>
  	   <div class='row'>
  	    <div class='form-group col-md-5'>
  	      <label>Edit Phone Number</label><span> *</span>
  	      <input type="number" value='<%=rst.getString(4)%>' class='form-control' name='phone' required>
  	    </div>
  	    <div class='form-group col-md-5'>
  	      <label>Edit Email ID</label><span> *</span>
  	      <input type="email" value='<%=rst.getString(5)%>'  class='form-control' name='emailid' required>
  	    </div>
  	   </div>
  	   <div class='row'>
  	    <div class='form-group col-md-5'>
  	      <label for="department">Edit Department</label><span> *</span>
  	      <input type="text" value='<%=rst.getString(6)%>'  class='form-control' name='department' required>
  	    </div>
  	    <div class='form-group col-md-5'>
  	      <label>Edit Salary</label><span> *</span>
  	      <input type="number" value='<%=rst.getString(7)%>'  class='form-control' name='salary' required>
  	    </div>
  	   </div>
  	   <div class='row'>
  	    <div class='form-group col-md-10'>
  	     <button class='btn btn-primary'>Update Record</button>
  	    </div>
  	   </div>
  	  </form>
  	 </div>
  	</div>
  </div>
  
  <%
  }
  else
  {
  %>
	  <jsp:include page="edit.jsp" />
	  <div class="dvv">
	   <label style="color: red; font-size: 1.6vw">Employee record with id <%= eid %> does not exist!</label>
	  </div>
  <%
  }
  %>
 </body>
</html>