# Dart Server

A template for HTTP Dart Server with embedded database and logging

## :warning: Test files not found

This template is used to be clean. Made with ❤️ by

![Alt text](brandwhite.png?raw=true "Title")

### Development Architecture

![Alt text](httparch.png?raw=true "Title")

## API Routes for Test (Port 8080 by default)

``` Plain Text
GET http://localhost:8080/dummy/<id>
GET http://localhost:8080/dummy
POST http://localhost:8080/dummy
PUT http://localhost:8080/dummy/<id>
DELETE http://localhost:8080/dummy/<id>
DELETE http://localhost:8080/dummy
```

``` JSON
{
    "id":"1234",
    "name":"foo"  // body in POST PUT
}
```

### Install Packages (SDK >= 2.18.4)

``` bash
$ dart pub get
```

### Change to blank template

``` bash
$ git clone https://github.com/victor7w7r/dartserver
$ cd dartserver
$ git checkout blank
```

## Extra Packages

- crypto: Implementations of SHA, MD5, and HMAC cryptographic functions (Used for encrypt database)
- encrypt: IA set of high-level APIs over PointyCastle for two-way cryptography. (Used for encrypt database)
- equatable: Helps to implement value based equality without needing to explicitly override == and hashCode.
- fpdart: Functional programming in Dart and Flutter.
- json_serializable: Automatically generate code for converting to and from JSON by annotating Dart classes.
- getit: Simple direct Service Locator.
- injectable: Injectable is a convenient code generator for get_it.
- logger: Small, easy to use and extensible logger which prints beautiful logs.
- sembast: NoSQL persistent embedded file system document-based database for Dart VM and Flutter.
- shelf_cors_headers: CORS headers middleware for Shelf.
- shelf_plus: Is a quality of life addon for your server-side development within the Shelf platform.
- source_gen: Source code generation builders and utilities for the Dart build system.
- system_info2: Provides easy access to useful information about the system.
