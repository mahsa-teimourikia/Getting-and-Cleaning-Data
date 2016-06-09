## Accessing twitter from R

myapp = oauth_app("twitter",
                  key = "MU8q8BHy5EOboibo2ceEx8que",
                  secret = "6tT1a0YwUMC0WvQklhKlNjRqfqUlQ5xn8JcSask5OBcPvTKxuD")
sig = sign_oauth1.0(myapp,
                    token = "298558989-zOSl3vKMjL6PZymZYB76MyoVhHjBQO5dkFw4dwrD",
                    token_secret = "oHIGHtoRwub6PZcRvwOUKebQh12eHAgUHdorhbF9Tjg3J")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)


## Converting the json object
## install.packages("jsonlite")
## library(jsonlite)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1, 1:4]

