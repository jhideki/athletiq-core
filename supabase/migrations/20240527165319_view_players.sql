create policy "can view team"
on "public"."players"
as permissive
for all
to authenticated
using ((team_id = ANY (get_teams(auth.uid()))));



