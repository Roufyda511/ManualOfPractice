-Create sirst migaration
`db-migrate create seed --config ./config/test.json`
-Test  Migration
`db-migrate UP --config ./config/test.json`
`db-migrate DOWN --config ./config/test.json`
-Production Migration
`db-migrate UP --config ./config/prod.json`
`db-migrate DOWN --config ./config/test.json`

--Invironmemt Variables
`DB_HOST`
`DB_USER`
`DB_PASS`
`DB_SCHEMA`

`PORT`