alter table "public"."player_profiles" drop constraint "player_profiles_player_id_key";

alter table "public"."player_profiles" drop constraint "player_profiles_profile_id_key";

drop index if exists "public"."player_profiles_player_id_key";

drop index if exists "public"."player_profiles_profile_id_key";


