import static statics.StaticLib.*;
import dbconnect.*;

public class Menu {
  
  private boolean running;

  public Menu() {
    running = true;

    DBConnect dbc = new DBConnect();
    Query q = new Query( dbc.getConnection() );
    q.testRun();
    q.selectGeneral("kommune", "", "kommune_id", "kommune_navn");
  }
  

  public void menu() {
    while (running) {
      menuOptions();
      int choice = getNumericalInputRangeLoop(1,5);
      menuChoice(choice);
            
      if (running) {
          pressEnterToContinue();
          clearScreen();
      }
    }
  }

  private void menuOptions() {
      System.out.println(
      "\nStatistics Database\n" +
      "--------------\n" +
      "1. \n" + 
      "2. \n" + 
      "--------------\n" +
      "3. Quit \n" +
      "\n" +
      "Make your choice by typing one of the numbers above, followed by Enter. ");
  }

  private void menuChoice(int choice) {

    switch (choice) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        running = false;
    }
  }
  
}
