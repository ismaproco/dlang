// Import
import std.stdio;
import std.file;

// Main function
int main(char[][] args)
{

    //get the filename from the input args
    if(args.length < 2) {
      writefln("add a filename as input parameter in the command line");
      writefln("ex: ./writeFile test.txt");
      //exit safely
      return 0;
    }


    string filename = cast(string)args[1];

    if(exists(filename)){
        remove(filename);
    }

    string text = "this is some silly text to put into the file";
    std.file.write(filename, text);

    return 0;
}