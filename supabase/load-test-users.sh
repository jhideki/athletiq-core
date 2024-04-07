npx tsx TestUsers.mts > test_users.sql
psql -U postgres -h 127.0.0.1 -p 54322 -d postgres -f test_users.sql
