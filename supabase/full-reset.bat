@echo off
rem Generate Snaplet
npx snaplet generate

rem Generate SQL from TypeScript seed file
npx tsx seed.mts > seed.sql

rem Reset Supabase database
supabase db reset

rem Generate Snaplet again (assuming it's necessary)
npx snaplet generate

rem Generate SQL from TypeScript TestUsers file
npx tsx TestUsers.mts > test_users.sql

rem Run SQL script using psql
psql "postgresql://postgres:postgres@localhost:54322/postgres" -f test_users.sql
