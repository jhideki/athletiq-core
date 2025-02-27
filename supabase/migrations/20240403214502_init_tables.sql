create table "public"."exercises" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "name" character varying,
    "team_id" bigint,
    "details" jsonb,
    "description" text
);


alter table "public"."exercises" enable row level security;

create table "public"."organizations" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "name" character varying not null
);


alter table "public"."organizations" enable row level security;

create table "public"."persons" (
    "id" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now(),
    "age" smallint,
    "first_name" character varying not null,
    "last_name" character varying not null
);


alter table "public"."persons" enable row level security;

create table "public"."players" (
    "player_id" bigint generated by default as identity not null,
    "user_id" uuid default auth.uid(),
    "weight" real,
    "height" real,
    "team_id" bigint
);


alter table "public"."players" enable row level security;

create table "public"."program_tasks" (
    "program_id" bigint generated by default as identity not null,
    "task_id" bigint not null
);


alter table "public"."program_tasks" enable row level security;

create table "public"."programs" (
    "id" bigint generated by default as identity not null,
    "start_date" date not null,
    "end_date" date,
    "team_id" bigint,
    "details" jsonb
);


alter table "public"."programs" enable row level security;

create table "public"."task_exercises" (
    "task_id" bigint generated by default as identity not null,
    "exercise_id" bigint not null
);


alter table "public"."task_exercises" enable row level security;

create table "public"."tasks" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "title" character varying,
    "team_id" bigint,
    "details" jsonb
);


alter table "public"."tasks" enable row level security;

create table "public"."teams" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "coach_id" uuid,
    "organization_id" bigint,
    "city" character varying,
    "country" character varying
);


alter table "public"."teams" enable row level security;

CREATE UNIQUE INDEX exercises_pkey ON public.exercises USING btree (id);

CREATE UNIQUE INDEX organizations_pkey ON public.organizations USING btree (id);

CREATE UNIQUE INDEX persons_pkey ON public.persons USING btree (id);

CREATE UNIQUE INDEX players_pkey ON public.players USING btree (player_id);

CREATE UNIQUE INDEX program_tasks_pkey ON public.program_tasks USING btree (program_id, task_id);

CREATE UNIQUE INDEX programs_pkey ON public.programs USING btree (id);

CREATE UNIQUE INDEX task_exercises_pkey ON public.task_exercises USING btree (task_id, exercise_id);

CREATE UNIQUE INDEX tasks_pkey ON public.tasks USING btree (id);

CREATE UNIQUE INDEX teams_pkey ON public.teams USING btree (id);

alter table "public"."exercises" add constraint "exercises_pkey" PRIMARY KEY using index "exercises_pkey";

alter table "public"."organizations" add constraint "organizations_pkey" PRIMARY KEY using index "organizations_pkey";

alter table "public"."persons" add constraint "persons_pkey" PRIMARY KEY using index "persons_pkey";

alter table "public"."players" add constraint "players_pkey" PRIMARY KEY using index "players_pkey";

alter table "public"."program_tasks" add constraint "program_tasks_pkey" PRIMARY KEY using index "program_tasks_pkey";

alter table "public"."programs" add constraint "programs_pkey" PRIMARY KEY using index "programs_pkey";

alter table "public"."task_exercises" add constraint "task_exercises_pkey" PRIMARY KEY using index "task_exercises_pkey";

alter table "public"."tasks" add constraint "tasks_pkey" PRIMARY KEY using index "tasks_pkey";

alter table "public"."teams" add constraint "teams_pkey" PRIMARY KEY using index "teams_pkey";

alter table "public"."exercises" add constraint "public_exercises_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."exercises" validate constraint "public_exercises_team_id_fkey";

alter table "public"."persons" add constraint "public_persons_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."persons" validate constraint "public_persons_id_fkey";

alter table "public"."players" add constraint "public_players_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."players" validate constraint "public_players_team_id_fkey";

alter table "public"."players" add constraint "public_players_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."players" validate constraint "public_players_user_id_fkey";

alter table "public"."program_tasks" add constraint "public_program_tasks_program_id_fkey" FOREIGN KEY (program_id) REFERENCES programs(id) not valid;

alter table "public"."program_tasks" validate constraint "public_program_tasks_program_id_fkey";

alter table "public"."program_tasks" add constraint "public_program_tasks_task_id_fkey" FOREIGN KEY (task_id) REFERENCES tasks(id) not valid;

alter table "public"."program_tasks" validate constraint "public_program_tasks_task_id_fkey";

alter table "public"."programs" add constraint "public_programs_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."programs" validate constraint "public_programs_team_id_fkey";

alter table "public"."tasks" add constraint "public_tasks_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) not valid;

alter table "public"."tasks" validate constraint "public_tasks_team_id_fkey";

alter table "public"."teams" add constraint "public_teams_coach_id_fkey" FOREIGN KEY (coach_id) REFERENCES auth.users(id) ON DELETE RESTRICT not valid;

alter table "public"."teams" validate constraint "public_teams_coach_id_fkey";

alter table "public"."teams" add constraint "public_teams_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT not valid;

alter table "public"."teams" validate constraint "public_teams_organization_id_fkey";

grant delete on table "public"."exercises" to "anon";

grant insert on table "public"."exercises" to "anon";

grant references on table "public"."exercises" to "anon";

grant select on table "public"."exercises" to "anon";

grant trigger on table "public"."exercises" to "anon";

grant truncate on table "public"."exercises" to "anon";

grant update on table "public"."exercises" to "anon";

grant delete on table "public"."exercises" to "authenticated";

grant insert on table "public"."exercises" to "authenticated";

grant references on table "public"."exercises" to "authenticated";

grant select on table "public"."exercises" to "authenticated";

grant trigger on table "public"."exercises" to "authenticated";

grant truncate on table "public"."exercises" to "authenticated";

grant update on table "public"."exercises" to "authenticated";

grant delete on table "public"."exercises" to "service_role";

grant insert on table "public"."exercises" to "service_role";

grant references on table "public"."exercises" to "service_role";

grant select on table "public"."exercises" to "service_role";

grant trigger on table "public"."exercises" to "service_role";

grant truncate on table "public"."exercises" to "service_role";

grant update on table "public"."exercises" to "service_role";

grant delete on table "public"."organizations" to "anon";

grant insert on table "public"."organizations" to "anon";

grant references on table "public"."organizations" to "anon";

grant select on table "public"."organizations" to "anon";

grant trigger on table "public"."organizations" to "anon";

grant truncate on table "public"."organizations" to "anon";

grant update on table "public"."organizations" to "anon";

grant delete on table "public"."organizations" to "authenticated";

grant insert on table "public"."organizations" to "authenticated";

grant references on table "public"."organizations" to "authenticated";

grant select on table "public"."organizations" to "authenticated";

grant trigger on table "public"."organizations" to "authenticated";

grant truncate on table "public"."organizations" to "authenticated";

grant update on table "public"."organizations" to "authenticated";

grant delete on table "public"."organizations" to "service_role";

grant insert on table "public"."organizations" to "service_role";

grant references on table "public"."organizations" to "service_role";

grant select on table "public"."organizations" to "service_role";

grant trigger on table "public"."organizations" to "service_role";

grant truncate on table "public"."organizations" to "service_role";

grant update on table "public"."organizations" to "service_role";

grant delete on table "public"."persons" to "anon";

grant insert on table "public"."persons" to "anon";

grant references on table "public"."persons" to "anon";

grant select on table "public"."persons" to "anon";

grant trigger on table "public"."persons" to "anon";

grant truncate on table "public"."persons" to "anon";

grant update on table "public"."persons" to "anon";

grant delete on table "public"."persons" to "authenticated";

grant insert on table "public"."persons" to "authenticated";

grant references on table "public"."persons" to "authenticated";

grant select on table "public"."persons" to "authenticated";

grant trigger on table "public"."persons" to "authenticated";

grant truncate on table "public"."persons" to "authenticated";

grant update on table "public"."persons" to "authenticated";

grant delete on table "public"."persons" to "service_role";

grant insert on table "public"."persons" to "service_role";

grant references on table "public"."persons" to "service_role";

grant select on table "public"."persons" to "service_role";

grant trigger on table "public"."persons" to "service_role";

grant truncate on table "public"."persons" to "service_role";

grant update on table "public"."persons" to "service_role";

grant delete on table "public"."players" to "anon";

grant insert on table "public"."players" to "anon";

grant references on table "public"."players" to "anon";

grant select on table "public"."players" to "anon";

grant trigger on table "public"."players" to "anon";

grant truncate on table "public"."players" to "anon";

grant update on table "public"."players" to "anon";

grant delete on table "public"."players" to "authenticated";

grant insert on table "public"."players" to "authenticated";

grant references on table "public"."players" to "authenticated";

grant select on table "public"."players" to "authenticated";

grant trigger on table "public"."players" to "authenticated";

grant truncate on table "public"."players" to "authenticated";

grant update on table "public"."players" to "authenticated";

grant delete on table "public"."players" to "service_role";

grant insert on table "public"."players" to "service_role";

grant references on table "public"."players" to "service_role";

grant select on table "public"."players" to "service_role";

grant trigger on table "public"."players" to "service_role";

grant truncate on table "public"."players" to "service_role";

grant update on table "public"."players" to "service_role";

grant delete on table "public"."program_tasks" to "anon";

grant insert on table "public"."program_tasks" to "anon";

grant references on table "public"."program_tasks" to "anon";

grant select on table "public"."program_tasks" to "anon";

grant trigger on table "public"."program_tasks" to "anon";

grant truncate on table "public"."program_tasks" to "anon";

grant update on table "public"."program_tasks" to "anon";

grant delete on table "public"."program_tasks" to "authenticated";

grant insert on table "public"."program_tasks" to "authenticated";

grant references on table "public"."program_tasks" to "authenticated";

grant select on table "public"."program_tasks" to "authenticated";

grant trigger on table "public"."program_tasks" to "authenticated";

grant truncate on table "public"."program_tasks" to "authenticated";

grant update on table "public"."program_tasks" to "authenticated";

grant delete on table "public"."program_tasks" to "service_role";

grant insert on table "public"."program_tasks" to "service_role";

grant references on table "public"."program_tasks" to "service_role";

grant select on table "public"."program_tasks" to "service_role";

grant trigger on table "public"."program_tasks" to "service_role";

grant truncate on table "public"."program_tasks" to "service_role";

grant update on table "public"."program_tasks" to "service_role";

grant delete on table "public"."programs" to "anon";

grant insert on table "public"."programs" to "anon";

grant references on table "public"."programs" to "anon";

grant select on table "public"."programs" to "anon";

grant trigger on table "public"."programs" to "anon";

grant truncate on table "public"."programs" to "anon";

grant update on table "public"."programs" to "anon";

grant delete on table "public"."programs" to "authenticated";

grant insert on table "public"."programs" to "authenticated";

grant references on table "public"."programs" to "authenticated";

grant select on table "public"."programs" to "authenticated";

grant trigger on table "public"."programs" to "authenticated";

grant truncate on table "public"."programs" to "authenticated";

grant update on table "public"."programs" to "authenticated";

grant delete on table "public"."programs" to "service_role";

grant insert on table "public"."programs" to "service_role";

grant references on table "public"."programs" to "service_role";

grant select on table "public"."programs" to "service_role";

grant trigger on table "public"."programs" to "service_role";

grant truncate on table "public"."programs" to "service_role";

grant update on table "public"."programs" to "service_role";

grant delete on table "public"."task_exercises" to "anon";

grant insert on table "public"."task_exercises" to "anon";

grant references on table "public"."task_exercises" to "anon";

grant select on table "public"."task_exercises" to "anon";

grant trigger on table "public"."task_exercises" to "anon";

grant truncate on table "public"."task_exercises" to "anon";

grant update on table "public"."task_exercises" to "anon";

grant delete on table "public"."task_exercises" to "authenticated";

grant insert on table "public"."task_exercises" to "authenticated";

grant references on table "public"."task_exercises" to "authenticated";

grant select on table "public"."task_exercises" to "authenticated";

grant trigger on table "public"."task_exercises" to "authenticated";

grant truncate on table "public"."task_exercises" to "authenticated";

grant update on table "public"."task_exercises" to "authenticated";

grant delete on table "public"."task_exercises" to "service_role";

grant insert on table "public"."task_exercises" to "service_role";

grant references on table "public"."task_exercises" to "service_role";

grant select on table "public"."task_exercises" to "service_role";

grant trigger on table "public"."task_exercises" to "service_role";

grant truncate on table "public"."task_exercises" to "service_role";

grant update on table "public"."task_exercises" to "service_role";

grant delete on table "public"."tasks" to "anon";

grant insert on table "public"."tasks" to "anon";

grant references on table "public"."tasks" to "anon";

grant select on table "public"."tasks" to "anon";

grant trigger on table "public"."tasks" to "anon";

grant truncate on table "public"."tasks" to "anon";

grant update on table "public"."tasks" to "anon";

grant delete on table "public"."tasks" to "authenticated";

grant insert on table "public"."tasks" to "authenticated";

grant references on table "public"."tasks" to "authenticated";

grant select on table "public"."tasks" to "authenticated";

grant trigger on table "public"."tasks" to "authenticated";

grant truncate on table "public"."tasks" to "authenticated";

grant update on table "public"."tasks" to "authenticated";

grant delete on table "public"."tasks" to "service_role";

grant insert on table "public"."tasks" to "service_role";

grant references on table "public"."tasks" to "service_role";

grant select on table "public"."tasks" to "service_role";

grant trigger on table "public"."tasks" to "service_role";

grant truncate on table "public"."tasks" to "service_role";

grant update on table "public"."tasks" to "service_role";

grant delete on table "public"."teams" to "anon";

grant insert on table "public"."teams" to "anon";

grant references on table "public"."teams" to "anon";

grant select on table "public"."teams" to "anon";

grant trigger on table "public"."teams" to "anon";

grant truncate on table "public"."teams" to "anon";

grant update on table "public"."teams" to "anon";

grant delete on table "public"."teams" to "authenticated";

grant insert on table "public"."teams" to "authenticated";

grant references on table "public"."teams" to "authenticated";

grant select on table "public"."teams" to "authenticated";

grant trigger on table "public"."teams" to "authenticated";

grant truncate on table "public"."teams" to "authenticated";

grant update on table "public"."teams" to "authenticated";

grant delete on table "public"."teams" to "service_role";

grant insert on table "public"."teams" to "service_role";

grant references on table "public"."teams" to "service_role";

grant select on table "public"."teams" to "service_role";

grant trigger on table "public"."teams" to "service_role";

grant truncate on table "public"."teams" to "service_role";

grant update on table "public"."teams" to "service_role";


