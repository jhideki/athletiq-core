create type "public"."user_type" as enum ('coach', 'player', 'manager');

alter table "public"."persons" add column "user_type" user_type;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_coach_team(user_id uuid)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$DECLARE
    team_id bigint;
BEGIN
    SELECT id INTO team_id
    FROM teams
    WHERE coach_id = user_id;

    RETURN team_id;
END;$function$
;

create policy "exercise_access"
on "public"."exercises"
as permissive
for all
to public
using ((team_id = get_coach_team(auth.uid())));



