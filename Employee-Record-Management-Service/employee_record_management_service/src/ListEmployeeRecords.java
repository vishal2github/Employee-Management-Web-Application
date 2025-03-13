import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ListEmployeeRecords
{
	public static void main(String[] args)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10", "root", "micql@5132");
			System.out.println("Connected...\n");
			System.out.println("____________________EMPLOYEE RECORD LISTING PANEL\n");

			Statement st = cn.createStatement();

			ResultSet rst = st.executeQuery("select * from employeeinfo");
			while(rst.next())
			{
				System.out.println("Employee ID: " + rst.getInt(1));
				System.out.println("Employee Firstname: " + rst.getString(2));
				System.out.println("Employee Lastname: " + rst.getString(3));
				System.out.println("Employee Phone: " + rst.getString(4));
				System.out.println("Employee Email: " + rst.getString(5));
				System.out.println("Employee Department: " + rst.getString(6));
				System.out.println("Employee Salary: " + rst.getInt(7));
				System.out.println("");
			}
			
			System.out.println("_________________________________\n");
			cn.close();
			System.out.println("Connection closed!");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
}
