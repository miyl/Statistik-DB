import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
    private Connection conn;
    private final String databaseName;
    private final String derbyDriver;
    private final String databaseURL;

  public DBConnect() {
    conn = null;
    databaseName = "modulopgave1";
    derbyDriver = "org.apache.derby.jdbc.EmbeddedDriver";
    databaseURL = "jdbc:derby:" + databaseName + ";create=true";

    try {
      conn = DriverManager.getConnection(databaseURL);
    }
    catch(Exception e) { System.out.println("DBConnect: " + e);}
  }

  public void run() {
  }
  
}
