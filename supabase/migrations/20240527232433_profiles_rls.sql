alter table "public"."player_profiles" disable row level security;

CREATE UNIQUE INDEX player_profiles_player_id_key ON public.player_profiles USING btree (player_id);

alter table "public"."player_profiles" add constraint "player_profiles_player_id_key" UNIQUE using index "player_profiles_player_id_key";

create policy "coaches can view player profiles"
on "public"."profiles"
as permissive
for all
to authenticated
using ((person_id IN ( SELECT players.user_id
   FROM players
  WHERE (players.team_id = ANY (get_teams(auth.uid()))))));



