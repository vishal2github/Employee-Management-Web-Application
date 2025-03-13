import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class InsertEmployeeRecord
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10", "root", "micql@5132");
			System.out.println("Connected...\n");
			System.out.println("____________________EMPLOYEE RECORD INSERTING PANEL\n");
			
			PreparedStatement ps = cn.prepareStatement("insert into employeeinfo values(?, ?, ?, ?, ?, ?, ?)");
			
			System.out.print("Enter Employee ID: ");
			int eid = Integer.parseInt(sc.nextLine());
			ps.setInt(1, eid);
			
			System.out.print("Enter Employee Firstname: ");
			String firstname = sc.nextLine();
			ps.setString(2, firstname);
			
			System.out.print("Enter Employee Lastname: ");
			String lastname = sc.nextLine();
			ps.setString(3, lastname);
			
			System.out.print("Enter Employee Phone: ");
			String phone= sc.nextLine();
			ps.setString(4, phone);
			
			System.out.print("Enter Employee Email: ");
			String email= sc.nextLine();
			ps.setString(5, email);
			
			System.out.print("Enter Employee Department: ");
			String department = sc.nextLine();
			ps.setString(6, department);
			
			System.out.print("Enter Employee Salary: ");
			int salary= Integer.parseInt(sc.nextLine());
			ps.setInt(7, salary);
			
			ps.executeUpdate();
			
			System.out.println("\nEmployee record inserted...\n");
			
			System.out.println("_________________________________\n");
			sc.close();
			cn.close();
			System.out.println("Connection closed successfully!");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
}
