alter table "public"."exercises" alter column "team_id" set not null;

alter table "public"."programs" alter column "team_id" set not null;

alter table "public"."tasks" alter column "team_id" set not null;

alter table "public"."task_exercises" add constraint "public_task_exercises_exercise_id_fkey" FOREIGN KEY (exercise_id) REFERENCES exercises(id) ON DELETE CASCADE not valid;

alter table "public"."task_exercises" validate constraint "public_task_exercises_exercise_id_fkey";

alter table "public"."task_exercises" add constraint "public_task_exercises_task_id_fkey" FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE not valid;

alter table "public"."task_exercises" validate constraint "public_task_exercises_task_id_fkey";


