# Twitter Clone

## Description
For this project we need to create a clone of the [Twitter](https://twitter.com) website.
Rails is used to create the frontend and the backend because we can have an MVP fast and easy.


## Requirements
- [Rails 7](https://rubygems.org/gems/rails)
- [Docker](https://www.docker.com/)

## Run the app

```bash
$ git clone https://github.com/gabrielcancel/twitter_clone.git
$ docker run -p 1080:1080 -p 1025:1025 maildev/maildev
$ bundle install
$ rails server
```

Go on http://localhost:1080/ to access maildev app to validate your registration.
Finally, go to http://localhost:3000/ to see the app.

