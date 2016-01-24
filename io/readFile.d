// Import
import std.stdio;
import std.file;

// Main function
int main(char[][] args)
{ 

  //get the filename from the input args
  if(args.length < 2) {
      writefln("add a filename as input parameter in the command line");
      writefln("ex: ./readFile test.txt");
      //exit safely
      return 0;
  }

  //define a variable to manage the name of the file
  string filename = cast(string)args[1];
  //exits?
  if (exists(filename) != 0 ) {
    // get the size of the file
    ulong size = getSize(filename);

    //get the file string data
    string data = cast(string)read(filename);

    writefln("%s", data );
    writefln("");
    writefln("Size of file = %d (bytes).",size);
  } else {
    writefln("File not found. Please try again later :-)");
    /* File does not exist! */
  }
  return 0;
}