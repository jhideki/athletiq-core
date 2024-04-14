alter table "public"."persons" alter column "first_name" set data type text using "first_name"::text;

alter table "public"."persons" alter column "last_name" set data type text using "last_name"::text;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.upsert_person(p_id UUID, p_age smallint DEFAULT NULL::smallint, p_first_name text DEFAULT NULL::text, p_last_name text DEFAULT NULL::text, p_user_type user_type DEFAULT NULL::user_type)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
  l_count INTEGER;
BEGIN
    select count(*) into l_count from persons where persons.id=p_id;
    IF l_count != 0 THEN
        -- Update existing record
        UPDATE persons
        SET
            age = COALESCE(p_age, age),
            first_name = COALESCE(p_first_name, first_name),
            last_name = COALESCE(p_last_name, last_name),
            user_type = COALESCE(p_user_type, user_type)
        WHERE id = p_id;
    ELSE
        -- Insert new record
        INSERT INTO persons (age, first_name, last_name, user_type)
        VALUES (p_age, p_first_name, p_last_name, p_user_type);
    END IF;
END;
$function$
;

create policy "Users can insert into persons"
on "public"."persons"
as permissive
for insert
to authenticated
with check ((( SELECT auth.uid() AS uid) = id));


create policy "Users can update persons"
on "public"."persons"
as permissive
for update
to authenticated
using ((( SELECT auth.uid() AS uid) = id))
with check ((( SELECT auth.uid() AS uid) = id));



