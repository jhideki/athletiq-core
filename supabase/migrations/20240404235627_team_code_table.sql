create schema if not exists "private";

create table "private"."team_codes" (
    "team_id" bigint not null,
    "code" character varying
);


CREATE UNIQUE INDEX team_codes_pkey ON private.team_codes USING btree (team_id);

alter table "private"."team_codes" add constraint "team_codes_pkey" PRIMARY KEY using index "team_codes_pkey";

alter table "private"."team_codes" add constraint "private_team_codes_team_id_fkey" FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE not valid;

alter table "private"."team_codes" validate constraint "private_team_codes_team_id_fkey";


