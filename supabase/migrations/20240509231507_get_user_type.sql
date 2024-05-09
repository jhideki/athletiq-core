set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_user_type(user_id uuid)
 RETURNS user_type
 LANGUAGE plpgsql
AS $function$
DECLARE
  user_type USER_TYPE;
BEGIN
  SELECT p.user_type INTO user_type
  FROM profiles p
  WHERE p.person_id = user_id;

  RETURN user_type;
END;
$function$
;


