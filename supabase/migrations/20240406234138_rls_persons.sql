create policy "user can view their record"
on "public"."persons"
as permissive
for select
to authenticated
using ((auth.uid() = id));



