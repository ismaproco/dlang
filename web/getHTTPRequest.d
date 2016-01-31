import std.net.curl, std.stdio;

int main(char[][] args) {
    //get the filename from the input args
    if(args.length < 2) {
      writefln("add the url as input parameter in the command line");
      writefln("ex: ./readFile google.com");
      //exit safely
      return 0;
    }

    string url = cast(string)args[1];

    auto http = HTTP(url);
    http.onReceiveHeader =
        (in char[] key, in char[] value) { writeln(key,": ", value);};
    http.onReceive = (ubyte[] data) 
    { 
        writeln("Got data", cast(const(char)[])(data));
        return data.length;
    };
    http.perform();

    return 0;
}