module.exports =

  base:
    foo: 'bar'

  development:
    database:
      client: 'pg'
      connection: 'postgresql://localhost/<%= S(name).slugify() %>_development'

  test:
    database:
      client: 'pg'
      connection: 'postgresql://localhost/<%= S(name).slugify() %>_test'

  travis:
    database:
      client: 'pg'
      connection: 'postgresql://postgres@localhost/<%= S(name).slugify() %>_test'

  production:
    database:
      client: 'pg'
      connection: process.env.DATABASE_URL
