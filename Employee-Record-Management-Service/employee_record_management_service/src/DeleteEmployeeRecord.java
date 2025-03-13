import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class DeleteEmployeeRecord
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10", "root", "micql@5132");
			System.out.println("Connected...\n");
			System.out.println("____________________RECORD DELETION PANEL\n");
			
			PreparedStatement ps = cn.prepareStatement("delete from employeeinfo where eid=?");
			
			System.out.print("Enter employee ID to be deleted: ");
			int eid = Integer.parseInt(sc.next());
			ps.setInt(1, eid);
			
			int n = ps.executeUpdate();
			if(n >= 1)
			{
				System.out.println("\nEmployee record deleted!");
			}
			else
			{
				System.out.println("\nNo record found!");
			}

			System.out.println("_________________________________\n");
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
