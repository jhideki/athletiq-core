CREATE UNIQUE INDEX player_profiles_profile_id_key ON public.player_profiles USING btree (profile_id);

alter table "public"."player_profiles" add constraint "player_profiles_profile_id_key" UNIQUE using index "player_profiles_profile_id_key";


