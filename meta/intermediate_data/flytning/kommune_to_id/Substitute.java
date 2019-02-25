package kommune_to_id;

import java.io.IOException;

// For genKommuneMap
import java.util.Scanner;
import java.io.File;
import java.util.HashMap;

// For substituteFile
import java.io.FileReader;
import java.io.BufferedReader;

import java.io.FileWriter;
import java.io.BufferedWriter;


public class Substitute {

	// 
  static HashMap<String, String> kommuneMap = new HashMap<>();

  public static void main(String[] args) {
    genKommuneMap();
    substituteFile();
  }

  public static void substitute(String kommune) {
    genKommuneMap();
  }


  // TODO: Replace køn, alder on the basis of the the file:
  // aldersgruppe_koen_map.tsv 

  private static void genKommuneMap() {
    var maps = new File("kommune_to_id/kommune_map.tsv");

    try {
      var scanner = new Scanner(maps);
			//scanner.useDelimiter(";");

      while ( scanner.hasNext() ) {
        kommuneMap.put( scanner.next(), scanner.next() );
      }
    }
    catch (IOException e) {
      System.out.println("GenKommuneMap: " + e);
    }
  }


  // PROBLEM: I need RandomAccessFile to be able to track offsets in the file and seek back when a match is found.
  // RandomAccessFile seemingly can't read a word, so it can only track offsets for fx. a line
  // Scanner.match().start() might help in finding the position inside a line
  public static void substituteFile() {

    try {
      var fileIn = "tmp3/fra_til_uniq.csv";
      var fileOut = "tmp4/fra_til_med_id.csv";

      var fr = new FileReader(fileIn);
      var br = new BufferedReader(fr);

      var fw = new FileWriter(fileOut);
      var bw = new BufferedWriter(fw);

      var delimiter = ",";

      var line = "";
      while ( (line = br.readLine()) != null ) {
        var scanner = new Scanner(line);
        scanner.useDelimiter(delimiter);
        while (scanner.hasNext()) {
          var word = scanner.next();
          if ( kommuneMap.containsKey(word) ) {
            word = word.replace(word, kommuneMap.get(word) );
          }
          bw.write(word + delimiter);
        }
        bw.write("\n");
      }

    }
    catch (Exception e) { System.out.println("substituteFile: " + e); }
  }

}
