#Architecture for team invite code

1. Create team_code table. Stores invite codes for each team. Code may need expiry date.
2. Signed in user inputs team code
3. Backend authenticates users JWT token, queries team_code table for the corresponding invite code
4. Backend updates related tables (players, teams, etc..)
5. Backend sends Ok response
