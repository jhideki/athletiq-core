alter table "public"."profiles" drop constraint "public_profiles_team_id_fkey";

drop function if exists "public"."get_team"(person_id uuid);

alter table "public"."players" add column "team_id" bigint;

alter table "public"."profiles" drop column "team_id";

alter table "public"."players" add constraint "public_players_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."players" validate constraint "public_players_team_id_fkey";


