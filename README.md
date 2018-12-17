# alanvardy.com

This is the personal website of me, Alan Vardy.

## Get this website running locally

To install and run you need to 

1. install [Postgres on your system](https://www.alanvardy.com/posts/7)
2. Edit your database.yml to get the database connected
3. Create and migrate your database

```bash
rails db:create
rails db:migrate
```

4. Install gems

```bash
bundle install
```

5. Add a .env file in the root and add a username and password

```bash
# .env

ADMIN_USERNAME=admin
ADMIN_PASS=password
```

No, these are not what I use. Nice try :)

Install heroku cli and run.

```bash
sudo apt install heroku
heroku local
```

## License

This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License.](https://creativecommons.org/licenses/by-nc/4.0/)