import vibe.d;

shared static this()
{
	// Create the router that will dispatch each request to the proper handler method
	auto router = new URLRouter;
	
	// All requests that haven't been handled by the web interface registered above
	// will be handled by looking for a matching file in the public/ folder.
	router.get("*", serveStaticFiles("public/"));
	router.get("/", serveStaticFiles("public/index.html"));
	
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	
	listenHTTP(settings, router);
	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
}