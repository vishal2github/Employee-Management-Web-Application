import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class CreateRecordTable
{
	public static void main(String[] args)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp10", "root", "micql@5132");
			System.out.println("Connection established...\n");
			
			Statement st = cn.createStatement();
			st.execute("create table employeeinfo(eid int primary key, firstname varchar(20), lastname varchar(20), phone varchar(20), emailid varchar(50), department varchar(50), salary int)");
			System.out.println("Table created successfully...\n");
			
			cn.close();
			System.out.println("Connection closed successfully!");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
}
