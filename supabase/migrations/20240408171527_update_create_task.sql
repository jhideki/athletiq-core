set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.create_task(exercises bigint[], team_id bigint, title character varying, details jsonb)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
    l_task_id bigint;
    exercise_id bigint;
BEGIN
    INSERT INTO tasks(title, team_id, details) 
    VALUES (title, team_id, details) 
    RETURNING task_id INTO l_task_id;

    FOREACH exercise_id IN ARRAY exercises
    LOOP
        INSERT INTO task_exercises(task_id, exercise_id, team_id) 
        VALUES (l_task_id, exercise_id, team_id);
    END LOOP;
END;
$function$
;


