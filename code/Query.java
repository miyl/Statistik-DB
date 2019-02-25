import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class Query {

  private Connection conn;

  Query(Connection conn) {
    this.conn = conn;
  }

  public void selectGeneral(String table, String extra, String... columns) {

    String query = "SELECT ";

    query += String.join(", ", columns);

    String queryPost = " FROM " + table + extra;
    query += queryPost;

    try {
      Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); //must be updateable
      ResultSet res = st.executeQuery(query);
      printRes(res, table, columns);
    }
    catch (SQLException e){
      System.out.println(e.getMessage());
    }
  }

  // Prints a ResultSet
  public static void printRes(ResultSet rs, String table, String... columns) throws SQLException{
    System.out.println("\n" + table);
    //flyt cursor til start
    //rs.beforeFirst();
    // Loop through the ResultSet
    while (rs.next()){
      for (String column : columns) {
        System.out.print(rs.getString(column) + " ");
      }
      System.out.println();
    }
  }


  public void testRun() {
    String query = "SELECT *" + " FROM kommune " + " ORDER BY kommune_id ASC LIMIT 5";

    try {
      Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); //must be updateable
      ResultSet res = st.executeQuery(query);
      testPrintRes(res);
    }
    catch (SQLException e){
      System.out.println(e.getMessage());
    }
  }

  //Udskriv  resultatsæt
  public static void testPrintRes(ResultSet rs) throws SQLException{
    System.out.println("\nKommune");
    //flyt cursor til start
    //rs.beforeFirst();
    //kør igennem resultatsættet
    while (rs.next()){
      String id = rs.getString("kommune_id");
      String navn = rs.getString("kommune_navn");
      System.out.println(id + " " + navn);
    }
  }

}
