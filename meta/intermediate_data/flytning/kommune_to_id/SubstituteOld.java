package substitute;

import java.util.HashMap;
import java.io.FileNotFoundException;
import java.io.File;

import java.util.Scanner;

import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import java.io.RandomAccessFile;


public class Substitute {

  static HashMap<String, String> kommuneMap = new HashMap<>();

  public static void main(String[] args) {
    genKommuneMap();
    substituteFile();
  }

  // PROBLEM: I need RandomAccessFile to be able to track offsets in the file and seek back when a match is found.
  // RandomAccessFile seemingly can't read a word, so it can only track offsets for fx. a line
  // Scanner.match().start() might help in finding the position inside a line
  public static void substituteFile() {

    try {
      var fileIn = new File("fra_til_uniq.csv");
      var fileOut = new File("fra_til_med_id.csv");
      // Copy the file so we don't overwrite anything in the original
      Files.copy(fileIn.toPath(), fileOut.toPath(), StandardCopyOption.REPLACE_EXISTING);

      RandomAccessFile handler = new RandomAccessFile(fileOut, "rw");
      //var Scanner = new Scanner(fil);
      long len = handler.length();
      while ( handler.getFilePointer() != len ) {
        long offset = handler.getFilePointer(); // Get the file position before reading a word
        System.out.println("check 1");
        String word = handler.readUTF();
        System.out.println("check 2");
        if ( kommuneMap.containsKey(word) ) {
          long wordLen = handler.getFilePointer() - offset; // Calculate the length of the word
          handler.seek(wordLen);                            // Go back to the start of the word
          String id  = kommuneMap.get(word);                // Get the correct ID
          long padding_amount = Math.abs(id.length() - wordLen); // Calculate the difference between the current word length and the id, so we are sure to overwrite it fully
          handler.writeUTF( String.format("%" + padding_amount + "id", id) );                           // ...and overwrite the word with the padding + the ID
        }
      }
    }
    catch (Exception e) { System.out.println("substituteFile: " + e); }
  }

  public static void substitute(String kommune) {
    genKommuneMap();
  }

  private static void genKommuneMap() {
    var maps = new File("../kommune_map.tsv");

    try {
      var scanner = new Scanner(maps);

      while ( scanner.hasNext() ) {
        kommuneMap.put( scanner.next(), scanner.next() );
      }
    }
    catch (Exception e) {
      System.out.println("GenKommuneMap: " + e);
    }
  }

}
