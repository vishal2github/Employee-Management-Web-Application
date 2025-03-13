<%@ include file="navbar.jsp" %>

<link href="CSS/bodyBGC.css" rel="stylesheet">

<html>
  <body onload="makeActive('delete')">
   <form action="confirm-delete.jsp">
    <table class='ta' style="background-color: #a8a8a8; color: white">
     <tr>
      <td class='pad'>
        <label>Enter Employee ID</label>
      </td>
      
      <td class='pad'>
      	<input type="number" name="eid" required>
      </td>
      
      <td class="pad">
       <button class="btn btn-primary" style="background-color: #ff4141; border: 1px solid #da0000">Delete Record</button>
      </td>
     </tr>
    </table>
   </form>
  </body>
</html>