// Import
import std.stdio;
import std.file;

// Main function
int main(char[][] args)
{    
  string filename = "text.txt";
  if (exists(filename)!=0) {
    ulong size = getSize(filename);    
    writefln("%s", cast(char[])read(filename));
    writefln("");
    writefln("Size of file = %d (bytes).",size);
  } else {
    writefln("File not found. Please try again later :-)");
    /* File does not exist! */
  }
  return 0;
}