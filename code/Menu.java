import static statics.StaticLib.*;

public class Menu {
  
  private boolean running;

  public Menu() {
    running = true;

    new DBConnect();
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
      "3. \n" +
      "\n" +
      "Make your choice by typing one of the numbers above, followed by Enter. ");
  }

  private void menuChoice(int choice) {

    switch (choice) {
      case 1:
        break;
      case 2:
        break;
    }
  }
  
}
