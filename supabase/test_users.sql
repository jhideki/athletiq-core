INSERT INTO public.persons (id,created_at,age,first_name,last_name) VALUES ('995312b8-2f16-4be0-9290-ff246ed389c8', DEFAULT, 45, 'Josiane', 'Lowe');
INSERT INTO public.teams (id,created_at,coach_id,organization_id,city,country,name) VALUES (120934405987, DEFAULT, '995312b8-2f16-4be0-9290-ff246ed389c8', NULL, 'Highland', 'Algeria', 'Franecki,Gerhold and Schmitt');
SELECT setval('public.teams_id_seq'::regclass, (SELECT MAX("id") FROM "public"."teams"));
INSERT INTO public.persons (id,created_at,age,first_name,last_name) VALUES ('da995c40-61a6-42cb-9a0e-bd5101ef61d2', DEFAULT, 213, 'Serenity', 'Douglas');
INSERT INTO public.players (user_id,weight,height,id) VALUES ('da995c40-61a6-42cb-9a0e-bd5101ef61d2', 8.773953921981501, 10.119018833916334, 158);
SELECT setval('public.players_id_seq'::regclass, (SELECT MAX("id") FROM "public"."players"));
INSERT INTO auth.users (instance_id,id,aud,role,email,encrypted_password,email_confirmed_at,invited_at,confirmation_token,confirmation_sent_at,recovery_token,recovery_sent_at,email_change_token_new,email_change,email_change_sent_at,last_sign_in_at,raw_app_meta_data,raw_user_meta_data,is_super_admin,created_at,updated_at,phone,phone_confirmed_at,phone_change,phone_change_token,phone_change_sent_at,email_change_token_current,email_change_confirm_status,banned_until,reauthentication_token,reauthentication_sent_at,is_sso_user,deleted_at,is_anonymous) VALUES ('fbacee58-0b7a-576a-994d-7d91167efc11', 'ac2d2eca-b82d-5995-bfd4-8eb80e4435bf', 'e45194e3-cf20-5ccb-babd-ffdd4ba3b5ba', 'Admin', 'Scottie.Bode15902@aboundhistorian.info', 'Non unditas sequitureum plurimo il ipsa aliudicor.', '2020-06-18T17:31:59.000Z', '2020-05-21T16:33:49.000Z', 'Quos auditiam quibus omnia fabulis sed a, non es quia gravis a fieri.', '2020-02-06T01:19:16.000Z', 'Expedientiam magis reddido tum ea.', '2020-07-23T19:08:08.000Z', 'Laborem quam adiit in autem quisquam allicitat locos, libenda quid dolorem aboria doloribus.', 'Voluptate causamicur congressuscip inquam nec.', '2020-12-04T23:33:26.000Z', '2020-03-07T14:37:18.000Z', '{"Ut":"Bonorem sed"}', '{"Cum":"Quem statu uberam"}', 'f', '2020-07-11T06:07:20.000Z', '2020-04-16T15:46:08.000Z', DEFAULT, '2020-09-25T21:07:57.000Z', DEFAULT, DEFAULT, '2020-12-04T23:27:01.000Z', DEFAULT, DEFAULT, '2020-02-22T01:48:19.000Z', DEFAULT, '2020-12-08T11:49:42.000Z', DEFAULT, '2020-02-10T01:15:29.000Z', DEFAULT), ('aee5e0d2-d930-582a-9742-e27777cc5f9f', 'e88f3453-14e0-5fcb-aae0-ecb983537f94', 'f372f32d-91a3-5af1-b169-cec52dcc650b', 'Admin', 'Rolando.Donnelly48472@overcompensateorganizing.biz', 'Sanos orum enimis detracta voluptatib.', '2020-09-21T20:24:19.000Z', '2020-06-02T17:38:28.000Z', 'Animpenit is erosopin affecitur expedientia cum triarium quodsi, oderetur nam multi quibus sapiens scriptorquem malistius.', '2020-09-17T20:08:58.000Z', 'Vivendere enimo ab videt mihi studiis eo.', '2020-09-21T08:19:46.000Z', 'Probationes qui videor totum sed e.', 'Consequatur torum quia erigendum repugnantib, fruentemnere quid voluptatis alique quae domes.', '2020-05-13T16:32:31.000Z', '2020-02-14T13:03:26.000Z', '{"Debem":"Contra motus"}', '{"In":"Haec quaeque"}', 't', '2020-05-01T05:06:35.000Z', '2020-08-28T07:38:13.000Z', DEFAULT, '2020-06-06T17:54:02.000Z', DEFAULT, DEFAULT, '2020-07-11T19:10:23.000Z', DEFAULT, DEFAULT, '2020-05-13T04:16:12.000Z', DEFAULT, '2020-05-17T16:27:28.000Z', DEFAULT, '2020-06-14T05:37:44.000Z', DEFAULT), ('5e0f460b-a6fb-5ad3-88cd-79e858b6e36b', '5388ad2b-6c5f-5c97-ac71-5d804bb0599f', 'be71d0d7-a88a-596d-b3dd-4fdb02da0d1f', 'Owner', 'Romaine.Schiller93573@marvelouspostage.org', 'Reiciatur legundit ab sine modus.', '2020-02-06T02:01:27.000Z', '2020-04-12T03:23:21.000Z', 'Quidem profecto autem ile me, voluptatib rerum itatque labor incias voluptatis dedit.', '2020-03-27T02:28:47.000Z', 'Quae tam ferri atem dicat alique.', '2020-02-02T01:28:32.000Z', 'Repud ita latinessar et sed nomendas et, allictorquat tamendi mandam videnimum omum laborum id.', 'Omni in nullus ac graecos quae ex, ari fabeloquen dolor in primum.', '2020-01-09T00:54:47.000Z', '2020-06-02T05:22:23.000Z', '{"Quae":"Disciplinar lucil"}', '{"Necest":"Im difficiis segnitionis"}', 'f', '2020-11-27T10:40:02.000Z', '2020-07-11T06:46:16.000Z', DEFAULT, '2020-08-08T07:36:22.000Z', DEFAULT, DEFAULT, '2020-10-14T09:48:01.000Z', DEFAULT, DEFAULT, '2020-03-07T02:10:09.000Z', DEFAULT, '2020-02-26T01:33:21.000Z', DEFAULT, '2020-06-06T05:11:16.000Z', DEFAULT), ('488ad222-5b34-56f3-bdc6-666dc67d3e92', '1ecdb652-3437-5c95-a0c2-1c40204520cf', '80884a46-05b4-50ab-b012-8b3bdf631a4b', 'Viewer', 'Ephraim.Carter15533@clamour-fixture.net', 'Eum etiam anturione quidemus constituit via difficit utum.', '2020-11-27T10:34:47.000Z', '2020-01-01T12:17:22.000Z', 'Omnium ere causa sibi nam morborum quid disciplinguam, quidem quo magni est iucunt.', '2020-07-07T06:11:49.000Z', 'Escant sic partis totamus quod eos, maximis natura dissiduit se temporisse quid inpotest.', '2020-07-15T06:55:03.000Z', 'Quae si modo il unum, ut detractio non parvam dicitavit pauca non voluptas.', 'Probetista et est re evole ut.', '2020-01-09T12:26:49.000Z', '2020-01-09T12:48:36.000Z', '{"Potius":"Quis dem quibus"}', '{"Inquam":"Inveniat quidem ego"}', 'f', '2020-03-07T02:04:54.000Z', '2020-02-10T01:21:40.000Z', DEFAULT, '2020-04-24T03:52:26.000Z', DEFAULT, DEFAULT, '2020-12-29T00:10:46.000Z', DEFAULT, DEFAULT, '2020-03-19T02:50:19.000Z', DEFAULT, '2020-06-14T05:23:45.000Z', DEFAULT, '2020-02-18T13:49:24.000Z', DEFAULT), ('f040cb07-6ff7-5cdb-98a4-bffe3b5a8474', '82865b0b-8ac5-554a-bbf6-a0ec06b51a9f', '18ae604c-0edf-5535-85fc-37b7da3e7886', 'Viewer', 'Noble.Schumm921@wellmade-coordinator.info', 'Senserent ob sapiens natum ferandistin, multi nec consuevit qui virtutibus.', '2020-03-27T14:51:43.000Z', '2020-10-14T21:24:36.000Z', 'Et amplificit corporis longinquit quae tranquillitter interer.', '2020-03-07T14:57:48.000Z', 'Quibus vero noctestibus nos perandi epici molest natus.', '2020-04-12T15:25:13.000Z', 'Corruptis quid de epicullum am, velin nec responitur virtutem sis gravistippus epicari providin.', 'Et molitatas et laudab beate suo ut, philosopor epicullam aut moribus nos nobistae intelleges.', '2020-10-18T09:25:50.000Z', '2020-11-27T22:24:11.000Z', '{"Tum":"Et petum es"}', '{"Praeternumquam":"Fecis eae"}', 't', '2020-02-06T01:54:27.000Z', '2020-11-07T22:26:25.000Z', DEFAULT, '2020-11-23T22:37:31.000Z', DEFAULT, DEFAULT, '2020-04-16T03:16:46.000Z', DEFAULT, DEFAULT, '2020-01-21T00:20:37.000Z', DEFAULT, '2020-09-09T20:33:46.000Z', DEFAULT, '2020-10-14T21:37:11.000Z', DEFAULT), ('819ebdca-d503-57a7-9e44-fa8f49d3873f', 'd1b9db49-af2d-5c2e-adb0-5bb5fae4f25e', '0c73ab69-cf58-552e-be03-4e823916ecfc', 'Viewer', 'Ahmad.Smitham39702@graze-sprag.com', 'Nixamicor pervendibil hoc metu gravis.', '2020-07-07T18:26:02.000Z', '2020-07-11T18:55:28.000Z', 'Ut libro ut sit audiri rationem.', '2020-10-10T09:37:56.000Z', 'Perpetenim neque expetenim quis nulla alia aut.', '2020-02-18T02:04:34.000Z', 'Nec modi constitut malum nec vera ob ant, aut et quaeren in cum videm.', 'Ignorant habeo quae quaerens iudicem.', '2020-06-10T05:07:22.000Z', '2020-02-26T13:31:22.000Z', '{"Sequimur":"Serendum et"}', '{"Probartes":"Vel nobis me"}', 't', '2020-11-03T22:41:37.000Z', '2020-12-24T11:37:36.000Z', DEFAULT, '2020-11-19T23:14:31.000Z', DEFAULT, DEFAULT, '2020-11-07T23:03:14.000Z', DEFAULT, DEFAULT, '2020-01-17T00:50:29.000Z', DEFAULT, '2020-02-22T01:19:46.000Z', DEFAULT, '2020-10-14T21:23:54.000Z', DEFAULT), ('905b90be-9438-5707-ac3f-fa2ab4ee3722', '8a9a9aff-be70-5acb-8e52-86dd3ec1bd5c', 'a7b1466b-1558-5223-9d45-2f5d1dfd58b4', 'Owner', 'Marquise.Runolfsson22762@agreeglider.info', 'Voluptate plurimpendet maior sine ut.', '2020-07-27T18:43:50.000Z', '2020-11-07T22:57:53.000Z', 'Intellegen quae praetularum ano et, nos platone tum et probandi numquam et voluptat.', '2020-06-18T17:44:12.000Z', 'Enimi sale vertera aut esse est iisque es.', '2020-10-18T21:57:03.000Z', 'In obcaeciliar tam a voluptates.', 'Sequuntur iuria dialecto voluptate misertis, et est inpore et quibus.', '2020-11-15T22:54:24.000Z', '2020-03-27T03:04:05.000Z', '{"Leniat":"Sed ipsam"}', '{"Sed":"Si triarius nec"}', 'f', '2020-03-27T14:29:07.000Z', '2020-12-12T23:56:38.000Z', DEFAULT, '2020-09-21T09:04:44.000Z', DEFAULT, DEFAULT, '2020-07-23T06:54:37.000Z', DEFAULT, DEFAULT, '2020-01-13T00:25:23.000Z', DEFAULT, '2020-09-09T08:17:14.000Z', DEFAULT, '2020-06-02T17:08:17.000Z', DEFAULT), ('350141a2-69ff-5692-9615-a13ca025201e', '0704580a-7916-5267-9016-a0f501b764f2', 'ab113fa3-65f5-5823-9f5b-3e743d08b034', 'Admin', 'Schuyler.Rosenbaum37653@esteemedspit.com', 'Ipso domus omnium mnesare cum iudicit phaedrumque suis, me cum plane leviorem minus splendidicur de iustite.', '2020-11-07T10:45:04.000Z', '2020-03-23T02:25:06.000Z', 'Modo hoc quos ut aut, diceret fuisse satis inquam expetati est.', '2020-04-12T15:58:53.000Z', 'Nostros nimistius uti utus philosoper ignavi omnis eae.', '2020-05-25T04:54:45.000Z', 'Laudatemus et solet nam desidendum, incuratque sed ac ulisse ant.', 'Ipsa neque quidem profectamquam se, aliae multos qui proptereant fore hoc.', '2020-12-24T11:59:45.000Z', '2020-11-03T22:24:22.000Z', '{"Dolorum":"Quidem scriptorquatos ea"}', '{"Eo":"Is est"}', 't', '2020-01-17T00:38:29.000Z', '2020-09-21T08:35:16.000Z', DEFAULT, '2020-01-21T00:11:53.000Z', DEFAULT, DEFAULT, '2020-10-18T09:24:48.000Z', DEFAULT, DEFAULT, '2020-02-02T01:12:20.000Z', DEFAULT, '2020-08-12T07:22:41.000Z', DEFAULT, '2020-08-16T19:32:33.000Z', DEFAULT), ('f7941e6d-fab9-547a-9fb3-5b16cb894a98', 'a179a78a-a1ba-59a4-85da-4ba9e0ece271', '9de68439-437c-59ba-81af-74f61d33fc14', 'Admin', 'Enrique.Klein3798@backlightmarketer.net', 'Quosque sensibus nec velinem salut voluptasse iudex, inem nec egant malore didiscenses exiscenset.', '2020-06-06T05:33:52.000Z', '2020-02-18T01:24:08.000Z', 'Nomin hanc minorum veniri sine undius de est.', '2020-02-18T01:57:27.000Z', 'Nam ad sententiae meque nixamatio.', '2020-02-26T01:37:46.000Z', 'Magnisi nem ea anim eum, perveniri formidin non fuisse nec nihil non.', 'In voluptat vituptatem tantum graecos una, cum ne sed quantum vitae.', '2020-11-07T10:44:08.000Z', '2020-11-23T22:25:25.000Z', '{"Euripsius":"Metuam scriptum"}', '{"Toriae":"Praetorum omnium"}', 'f', '2020-09-05T20:46:39.000Z', '2020-08-12T19:15:49.000Z', DEFAULT, '2020-01-17T12:13:34.000Z', DEFAULT, DEFAULT, '2020-02-18T01:25:45.000Z', DEFAULT, DEFAULT, '2020-04-20T03:42:43.000Z', DEFAULT, '2020-08-28T19:12:56.000Z', DEFAULT, '2020-03-23T14:35:42.000Z', DEFAULT), ('b5786825-1f54-57fd-acb9-38e27d68f0a8', '1bede682-b6e9-5345-b7a3-e934ce1ef704', 'dba2fb3f-525d-558e-bd5f-f8c03a79c9e1', 'Owner', 'Helmer.Hagenes53523@villainous-eating.biz', 'Sic satis legitare modo distinis, et quadamicur ere sint delectates.', '2020-03-15T14:18:05.000Z', '2020-03-23T15:03:26.000Z', 'Potest itate am ula maximisti, graviora sint evere ut voluptatem epice nec.', '2020-05-25T04:15:29.000Z', 'Hoc bonum efflueret nes animper tam, praesendistin as desid exerque abile et accusat putandae.', '2020-07-11T06:45:55.000Z', 'Eadem in cognitata et prohibus non.', 'Mensae ipsi dolore alit extremum necesse.', '2020-09-09T20:58:36.000Z', '2020-11-23T22:56:17.000Z', '{"Rerum":"Dictum necesse"}', '{"Asque":"Summum ine id"}', 'f', '2020-03-15T03:01:54.000Z', '2020-03-11T14:46:27.000Z', DEFAULT, '2020-06-10T17:29:51.000Z', DEFAULT, DEFAULT, '2020-09-05T08:58:46.000Z', DEFAULT, DEFAULT, '2020-08-24T19:55:51.000Z', DEFAULT, '2020-08-20T07:12:13.000Z', DEFAULT, '2020-08-04T07:31:25.000Z', DEFAULT);
INSERT INTO public.players (user_id,weight,height,id) VALUES ('ac2d2eca-b82d-5995-bfd4-8eb80e4435bf', 7.740764011788177, 12.34886103302455, 159), ('e88f3453-14e0-5fcb-aae0-ecb983537f94', 2.13044618560709, 1.6675651768595066, 160), ('5388ad2b-6c5f-5c97-ac71-5d804bb0599f', 11.662873530881845, 2.1943356445027526, 161), ('1ecdb652-3437-5c95-a0c2-1c40204520cf', 2.567463944366818, 12.930756917959458, 162), ('82865b0b-8ac5-554a-bbf6-a0ec06b51a9f', 11.954344240295615, 1.4179929715520532, 163), ('d1b9db49-af2d-5c2e-adb0-5bb5fae4f25e', 1.2022181485670098, 4.082516980265493, 164), ('8a9a9aff-be70-5acb-8e52-86dd3ec1bd5c', 9.686658558641124, 7.084374688651947, 165), ('0704580a-7916-5267-9016-a0f501b764f2', 12.827059513457677, 10.61562592984501, 166), ('a179a78a-a1ba-59a4-85da-4ba9e0ece271', 1.6714874672543927, 15.514375366636951, 167), ('1bede682-b6e9-5345-b7a3-e934ce1ef704', 15.401789925135176, 8.87436473827294, 168);
SELECT setval('public.players_id_seq'::regclass, (SELECT MAX("id") FROM "public"."players"));
INSERT INTO public.persons (id,created_at,age,first_name,last_name) VALUES ('18494b0d-a594-4822-9d21-840db2b63456', DEFAULT, 1, 'Joanie', 'Towne');
