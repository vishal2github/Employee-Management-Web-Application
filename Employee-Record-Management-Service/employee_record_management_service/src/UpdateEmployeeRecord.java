import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UpdateEmployeeRecord
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10", "root", "micql@5132");
			System.out.println("Connected...\n");
			System.out.println("__________EMPLOYEE RECORD UPDATE PANEL__________\n");
			
			PreparedStatement ps = cn.prepareStatement("update employeeinfo set firstname=?, lastname=?, phone=?, emailid=?, department=?, salary=? where eid=?");
			
			System.out.print("Enter employee ID: ");
			int eid = Integer.parseInt(sc.nextLine());
			ps.setInt(7, eid);
			
			System.out.print("Edit Employee Firstname: ");
			String firstname = sc.nextLine();
			ps.setString(1, firstname);
			
			System.out.print("Edit Employee Lastname: ");
			String lastname = sc.nextLine();
			ps.setString(2, lastname);
			
			System.out.print("Edit Employee Phone: ");
			String phone = sc.nextLine();
			ps.setString(3, phone);
			
			System.out.print("Edit Employee Email: ");
			String email = sc.nextLine();
			ps.setString(4, email);
			
			System.out.print("Edit Employee Department: ");
			String department = sc.nextLine();
			ps.setString(5, department);
			
			System.out.print("Edit Employee Salary: ");
			int salary = Integer.parseInt(sc.nextLine());
			ps.setInt(6, salary);
			
			ps.executeUpdate();
			
			System.out.println("\nEmployee record updated...");
			
			sc.close();
			cn.close();
			System.out.println("\nConnection closed!");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
}
