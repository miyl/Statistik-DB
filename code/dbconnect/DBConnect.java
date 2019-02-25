package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.sql.*; // Experiment to see if it makes a difference

// Just for debugging
import java.sql.Driver; // Just for testing
import java.util.Enumeration;
import java.util.Collections;
import java.util.List;


public class DBConnect {
  private Connection conn = null;

  public DBConnect() {
    // DEBUG
    //testMariaDB();
    //testDB();

    // WRITE IN YOUR CONFIG HERE!:
    final String DB_PRE = "jdbc";
    final String DB_SUB_PROTOCOL = ":mysql://";
    //final String DB_ADDRESS = "localhost" + ":"; 
    final String DB_ADDRESS = "localhost";
    final String DB_PORT = ":" + "3306";
    final String DB_NAME = "/" + "modulopgave1";
    
    final String FULL_DB_STRING = DB_PRE + DB_SUB_PROTOCOL + DB_ADDRESS + DB_PORT + DB_NAME;

    final String USERNAME = "";
    final String PASSWORD = "";

    //final String FULL_DB_STRING_V2 = DB_PRE + DB_ADDRESS + DB_PORT + DB_NAME + "," + USERNAME + "," + PASSWORD;

    try {
      conn = DriverManager.getConnection(FULL_DB_STRING, USERNAME, PASSWORD);
      //conn = DriverManager.getConnection(FULL_DB_STRING_V2);
    }
    catch(Exception e) { System.out.println("DBConnect: " + e);}
    //TODO: Close connection afterwards!
    // conn.close();
  }

  public Connection getConnection() {
    return conn;
  }

  // Test if the mariadb driver is loaded
  private void testMariaDB() {
    try {
      Class.forName("org.mariadb.jdbc.Driver");
    }
    catch (ClassNotFoundException e) {System.out.println(e);}
  }

  // Test if the official Oracle driver is loaded
  private void testOracleDB() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
    }
    catch (ClassNotFoundException e) {System.out.println(e);}
  }

  // Another test to see what drivers are loaded (can be multiple)
  private void testDBS() {
    Enumeration<Driver> drvs = DriverManager.getDrivers();
    List drvslist = Collections.list(drvs);
    for (Object drv : drvslist) {
      System.out.println(drv);
    }
  }

}
