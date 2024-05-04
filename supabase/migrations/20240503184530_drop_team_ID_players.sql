drop policy "coach can view players" on "public"."players";

alter table "public"."players" drop constraint "public_players_team_id_fkey";

alter table "public"."players" drop column "team_id";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_team(person_id uuid)
 RETURNS bigint
 LANGUAGE sql
AS $function$
SELECT team_id FROM profiles WHERE person_id = $1;
$function$
;

CREATE OR REPLACE FUNCTION public.join_team(code integer, user_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'private'
AS $function$DECLARE
    l_id BIGINT := null;
    l_count INTEGER;
BEGIN
    SELECT team_id INTO l_id FROM private.team_codes AS tc WHERE tc.code = join_team.code; 
    
    IF l_id IS NOT NULL THEN
        SELECT count(*) INTO l_count FROM public.profiles AS p WHERE p.person_id = user_id;
        
        IF l_count = 0 THEN
            INSERT INTO public.profiles (person_id, team_id) VALUES (user_id, l_id);
        ELSE
            UPDATE public.profiles AS p SET team_id = l_id WHERE p.person_id = user_id;
        END IF; 
        RETURN true;
    ELSE
        RETURN false;
    END IF;
END;$function$
;


