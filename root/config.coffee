module.exports =

  base:
    foo: 'bar'

  development:
    database:
      client: 'pg'
      connection: 'postgresql://localhost/<%= name %>_development'

  test:
    database:
      client: 'pg'
      connection: 'postgresql://localhost/carrot_meetings_test'

  travis:
    database:
      client: 'pg'
      connection: 'postgresql://postgres@localhost/carrot_meetings_test'

  production:
    google_calendar_id: 'meetings@carrotcreative.com'
    google_refresh_token: '1/5K5rDcWLOSCC7HaUjTy3s1PvuPAu8C7UxicuEdegr_I'
    database:
      client: 'pg'
      connection: process.env.DATABASE_URL
