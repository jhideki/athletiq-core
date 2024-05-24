set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_teams(p_user_id uuid)
 RETURNS bigint[]
 LANGUAGE plpgsql
AS $function$
DECLARE
    l_team_ids BIGINT[];
    l_user_type user_type;
BEGIN
    -- Get the user type
    SELECT user_type INTO l_user_type FROM profiles WHERE person_id = p_user_id;
    
    -- Check user type and return appropriate teams
    IF l_user_type = 'coach' THEN
        SELECT ARRAY_AGG(id) INTO l_team_ids FROM teams WHERE coach_id = p_user_id;
    ELSE
        SELECT ARRAY_AGG(team_id) INTO l_team_ids FROM players as p WHERE p.user_id = p_user_id;
    END IF;
    
    RETURN l_team_ids;
END;
$function$
;


