set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.join_team(code integer, user_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'private'
AS $function$
DECLARE
    l_id BIGINT := null;
BEGIN
    SELECT team_id INTO l_id FROM private.team_codes AS tc WHERE tc.code = join_team.code; -- Explicitly specify the function parameter
    
    IF l_id IS NOT NULL THEN
        INSERT INTO public.players (user_id, team_id) VALUES (user_id, l_id);
        RETURN true;
    ELSE
        RETURN false;
    END IF;
END;
$function$
;


