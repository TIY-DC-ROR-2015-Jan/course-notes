# HTTPartying

Write a script that interacts with the API at [https://frozen-springs-1650.herokuapp.com/](https://frozen-springs-1650.herokuapp.com/) to do the following:

* `GET` from `/` to get a list of all the users submissions.
* Add up their numbers
* `POST` to `/add` with the header "Authorization: <your name>" and parameter "number" the sum of the existing numbers

If you're curious:

* Try submitting multiple times, or without a number. What should happen? What does?
* The API was implemented entirely in [this commit](https://github.com/TIY-DC-ROR-2015-Jan/httparty-quiz/commit/0e8d2f39c878ecdf32eb0a67b06fad339dc5eda4).
