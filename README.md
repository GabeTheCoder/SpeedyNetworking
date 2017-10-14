# SpeedyNetworking

SpeedyNetworking is a sexy networking library inspired by Swift 4 syntax.

## Inspiration for SpeedyNetworking

SpeedyNetworking solves a few things. Firstly, it will make your network requests very concise especially with Swift's syntax as you will see in the [examples](#examples). Secondly, it simplifies communicating with a JSON API.

Typically, if you want to implement an API into your Swift app, you can do things the quick way, or the right way. The quick way would be to not model your data and just use the response JSON data. However, that can be frowned upon by your CTO ;).

### Swiftly Modeling Data

The right way of course is to build models for your data schema, preferably creating parity with the corresponding data schema on the backend. An example of this would be a struct like the following.

```
struct User: Codable {
    let name: String?
    let email: String?
    let age: Int?
}
```

Of course now you can use this in your client side mobile app somewhere in your Swift code. For example if I want to create a `User` object after someone inputs some credentials in my iOS app, I could do something like this:

```
let createdUser = User(name: "Gabe The Coder", email: "gabethecoder@icloud.com", age: 20)
```

Then what? You have to serialize it into JSON somehow and vice versa if you get this data from the server. In that case, it would involve serializing the JSON into this `User` object.

## Usage

Swift 4 introduces new design conventions of working with JSON with [Codable](https://developer.apple.com/documentation/swift/codable) objects as you may have noticed with our object we defined above. As you saw, it conformed to the Codable protocol. Let's look at some practical examples of how this might be achieved.

### Setting Up Your API

Suppose you have your API running at [https://example.com/api](#). Typically, you would want all of your requests to be performed on different routes of the same base URL i.e. [https://example.com/api/users](#) or [https://example.com/api/posts](#). It's a bit tedious to type that out every time so we have a method you can call on application initialization.

```
let baseUrl = URL(string: "https://example.com/api")
SpeedyNetworking.setServerUrl(url: baseUrl)
```

### Authentication (optional)

If your API uses authentication, you can pass in an authorization header like so.

```
SpeedyNetworking.setAuthHeader(authorization: header)
```

### Modeling Data

We can create models for our data super quickly and our JSON api will integrate with seamlessly.

```
struct User: Codable {
    let name: String?
    let email: String?
    let age: Int?
}
```

### Making Requests

Let's say we want to perform a HTTP GET request on an endpoint in our API to get a user's data. Based on the above `User` model, it's as simple as this:

```
SpeedyNetworking.get(route: "/users/1") { response in
    if !response.success {
        // show a network error
        return
    }
    
    // here we pass in the User model and it will return the object seamlessly
    let user = response.result(model: User.self)
    
    // do whatever with user
}
```

Great, now what if we created a `User` object and wanted to do a POST request to our api? Simple as this:

```
let createdUser = User(name: "Gabe The Coder", email: "gabethecoder@icloud.com", age: 20)

SpeedyNetworking.post(route: "/users", model: createdUser) { response in
    if !response.success {
        // show a network error
        return
    }
    
    // successful
}
```

## Feedback And Support

If you have any questions or comments, I'd love to chat. Shoot me an email at gabethecoder@icloud.com.




