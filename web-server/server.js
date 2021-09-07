const restify = require("restify");

function respond(req, res, next) {
	console.log('route');
  res.send("hello " + (req.params.name || 'no name'));
  next();
}

const server = restify.createServer();
server.get("/hello/:name", respond);
server.head("/hello/:name", respond);

server.listen(8080, function () {
  console.log("%s listening at %s", server.name, server.url);
});
