import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

public class ParseConvert {

  final String INDEL = "\t";

  final String OUTDEL = ",";
  final String OUTFILE_EXTENSION = ".csv";
 
  public static void main(String[] args) throws FileNotFoundException, IOException {

    var FILE1 = "til";
    var FILE2 = "fra";
    var INFILE_EXTENSION = ".tsv";

    new ParseConvert().notMain(FILE1, INFILE_EXTENSION);
    new ParseConvert().notMain(FILE2, INFILE_EXTENSION);
  }

  private void notMain(String fileName, String extension) throws FileNotFoundException, IOException {

    var inFile = new File(fileName + extension);
    var scanner = new Scanner(inFile);

    var fw = new FileWriter(fileName + "_output" + OUTFILE_EXTENSION, false);

    boolean firstLine = true;
    while ( scanner.hasNextLine() ) {

      var line = scanner.nextLine(); 
      var tokens = line.split("\t");
      var col4 = tokens[0] + OUTDEL + tokens[1] + OUTDEL + tokens[2] + OUTDEL + tokens[3];

      // For the header line only
      if (firstLine) {
        fw.write(col4 + OUTDEL + "år" + OUTDEL + "antal" + "\n");
        firstLine = !firstLine;
      }
      else {

        for(int i = 2006; i < 2018; i++) {
          fw.write(col4 + OUTDEL + i + OUTDEL + tokens[i-2002] + "\n");
        }
      }
    }
    fw.flush();
    fw.close();
  }
}
