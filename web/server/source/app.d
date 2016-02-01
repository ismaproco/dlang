import vibe.appmain;
import vibe.http.fileserver;
import vibe.http.router;
import vibe.http.server;

// method that manage the root request of the router
void handleRequest(scope HTTPServerRequest req, scope HTTPServerResponse res)
{
	res.redirect("/index.html");
}

shared static this()
{
	// configure the setting of the web server
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	// using the address in this way it will listen in all networks, 
	//but it will show a failed messafe in the console
	settings.bindAddresses = ["::", "0.0.0.0"];

	//router configuration
	auto router = new URLRouter;
	//when the root is requested executes the handleRequest function
	router.get("/", &handleRequest);
	//configure the custom enconding for the compressed files
	auto fileServerSettings = new HTTPFileServerSettings;
	fileServerSettings.encodingFileExtension = ["gzip" : ".gz"];
	router.get("/gzip/*", serveStaticFiles("./public/", fileServerSettings));
	
	// set the location of the default files in the public folder
	router.get("*", serveStaticFiles("./public/",));

	listenHTTP(settings, router);
}