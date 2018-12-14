# Brawlhalla

### Database

To run migrations:

```bash
  bundle exec sequel -m db/migrations sqlite://db/development.sqlite3
```

### Deploy

This app is running in Heroku. To deploy run

```bash
git push heroku master
```
