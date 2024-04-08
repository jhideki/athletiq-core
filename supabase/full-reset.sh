npx snaplet generate
npx tsx seed.mts > seed.sql
supabase db reset
npx snaplet generate
npx tsx TestUsers.mts > test_users.sql
psql 'postgresql://postgres:postgres@localhost:54322/postgres' -f test_users.sql
