import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

//import kommune_to_id.Substitute;

public class ParseConvert {

  static final String FILE1 = "tmp1/til";
  static final String FILE2 = "tmp1/fra";
  final String INDEL = "\t";

  final String OUTDEL = ",";
  final String OUTFILE_EXTENSION = ".csv";
 
  public static void main(String[] args) throws FileNotFoundException, IOException {

    var INFILE_EXTENSION = ".tsv";

    new ParseConvert().notMain(FILE1, INFILE_EXTENSION);
    new ParseConvert().notMain(FILE2, INFILE_EXTENSION);
  }

  private void notMain(String fileName, String extension) throws FileNotFoundException, IOException {

    var inFile = new File(fileName + extension);
    var scanner = new Scanner(inFile);

    var fw = new FileWriter("tmp2/" + fileName + "_output" + OUTFILE_EXTENSION, false);

    boolean firstLine = true;
    while ( scanner.hasNextLine() ) {

      var line = scanner.nextLine(); 
      var tokens = line.split("\t");
      var col4 = tokens[0] + OUTDEL + tokens[1] + OUTDEL;
      // Reorder 'fra' and 'til' columns in one of the files so they're in the same order in both files, making it easier to pre-remove duplicates outside mysql, with :sort u
      if (fileName == FILE1) col4 += tokens[3] + OUTDEL + tokens[2];
      else col4 += tokens[2] + OUTDEL + tokens[3];

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
