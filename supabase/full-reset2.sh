rm seed.sql
supabase db reset
npx snaplet generate
npx tsx TestUsers.mts > test_users.sql
psql 'postgresql://postgres:postgres@localhost:54322/postgres' -f test_users.sql
supabase gen types typescript --local > database.types.ts

