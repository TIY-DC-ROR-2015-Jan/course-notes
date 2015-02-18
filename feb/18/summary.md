# Requests

HTTP requests are essentially the following bits of data

* The host (for routing to the server)
* The verb (GET / POST / PUT / DELETE / ...) and path (for the server to route to an appropriate action)
* Extra data, passed in via:
  * Query params (which may be part of the URL: `?page=2&order=popular` - typically used when bookmarking is important)
  * Form post body (typically used when submitting a form)
  * Headers (often used for authenticating)

## Making Requests from Ruby

There are many gems for making requests from Ruby. We'll present [HTTParty](https://github.com/jnunemaker/httparty), but [Typhoeus](https://github.com/typhoeus/typhoeus), [RestClient](https://github.com/rest-client/rest-client), and the built in [Net::HTTP](http://ruby-doc.org/stdlib-2.2.0/libdoc/net/http/rdoc/Net/HTTP.html) are all perfectly capable (and each has their pros and cons).

Regardless of which gem you choose, if you want to make requests, you'll need to be able to manipulate the parameters above: the URL, the verb, query params, post contents, and headers. Responses will often be deeply-nested JSON, so you'll also want to be comfortable traversing arrays and hashes.

__Reading:__ the [HTTParty examples](https://github.com/jnunemaker/httparty/tree/master/examples)

## Serving Responses from Ruby

Again, there are many options. We'll end up at Rails, but start with [Sinatra](http://www.sinatrarb.com/).

In order to respond to an incoming request, you'll need to look at the incoming request's verb and path and define actions to handle each one. In Sinatra, that looks like:

```
get '/users'
  # Do stuff that you should do when someone sends a GET request to '/users'
end

post '/alert'
  # Do stuff that you should do when someone sends a POST request to '/alert'
end
```

Inside each handler, you have access to the passed in `params` and `headers`. For now, your handlers can just return a string (which could be `JSON` formatted), but we'll talk about templating and serving better responses in the sequel.
