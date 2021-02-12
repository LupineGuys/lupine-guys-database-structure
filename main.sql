create table if not exists v1.score_premium_groups
(
	group_id bigint,
	chanel_id bigint,
	created_at text,
	deleted_at text,
	score_unit text
);

alter table v1.score_premium_groups owner to solish;

create table if not exists v1.score_scores
(
	group_id bigint,
	user_id bigint,
	score bigint,
	user_name text,
	created_at text,
	game_message_id bigint,
	deleted_at text
);

alter table v1.score_scores owner to solish;

create table if not exists v1.score_rules
(
	group_id bigint,
	rule text,
	score bigint,
	created_at text,
	deleted_at text
);

alter table v1.score_rules owner to solish;

create table if not exists v1.rulesaver_games
(
	group_id bigint,
	player_count integer,
	created_at text,
	all_players text,
	allow_players text,
	deleted_at text
);

alter table v1.rulesaver_games owner to solish;

create table if not exists v1.rulesaver_rules
(
	group_id bigint,
	user_id bigint,
	rule text,
	created_at text,
	deleted_at text
);

alter table v1.rulesaver_rules owner to solish;

grant insert, select on v1.rulesaver_rules to tg_rolesaver;

create table if not exists v1.rulesaver_bad_players
(
	group_id bigint,
	user_id bigint,
	baned_by bigint,
	created_at text,
	unbaned_by bigint,
	deleted_at text
);

alter table v1.rulesaver_bad_players owner to solish;

grant insert, select, update on v1.rulesaver_bad_players to tg_rolesaver;

create table if not exists v1.rulesaver_message_used
(
	group_id bigint,
	message_id bigint,
	created_at text
);

alter table v1.rulesaver_message_used owner to solish;

grant insert, select on v1.rulesaver_message_used to tg_rolesaver;

create table if not exists v1.moderators
(
	group_id bigint,
	user_id bigint,
	created_at text,
	deleted_at text
);

alter table v1.moderators owner to solish;

create table if not exists v1.group_games
(
	message_id bigint,
	group_id bigint,
	created_at text,
	player_count integer,
	winner integer
);

alter table v1.group_games owner to solish;

grant insert on v1.group_games to tg_helper;

create table if not exists v1.group_players
(
	group_id bigint,
	player_id bigint,
	message_id bigint,
	is_admin boolean,
	is_winner boolean,
	created_at text,
	timestamp timestamp
);

alter table v1.group_players owner to solish;

create table if not exists v1.rulesaver_games1
(
	group_id bigint,
	player_count integer,
	created_at text,
	all_players text,
	allow_players text,
	deleted_at text,
	mention_used boolean default false,
	shekarchi bigint,
	nazer bigint,
	vote text
);

alter table v1.rulesaver_games1 owner to solish;

grant insert, select, update on v1.rulesaver_games1 to tg_rolesaver;

create table if not exists v1.fun_lisers
(
	liser bigint,
	hunter bigint,
	lis_score integer,
	text text,
	created_at text
);

alter table v1.fun_lisers owner to solish;

create table if not exists v1.fun_lis
(
	gp_id bigint,
	hunter bigint,
	liser bigint,
	text text,
	accepted boolean default false,
	created_at text,
	id serial not null
);

alter table v1.fun_lis owner to solish;

create table if not exists v1.rulesaver_roles
(
	group_id bigint,
	user_id bigint,
	rule text,
	created_at text,
	deleted_at text,
	username text
);

alter table v1.rulesaver_roles owner to solish;

grant insert, select, update on v1.rulesaver_roles to tg_rolesaver;

create index if not exists rulesaver_roles_group_id_user_id_index
	on v1.rulesaver_roles (group_id, user_id);

create table if not exists v1.rulesaver_users
(
	user_id bigint,
	username text,
	created_at text,
	updated_at text,
	deleted_at text
);

alter table v1.rulesaver_users owner to solish;

grant insert, select, update on v1.rulesaver_users to tg_rolesaver;

grant insert, select, update on v1.rulesaver_users to tg_manage;

create table if not exists v1.all_games
(
	group_id bigint,
	message_id bigint,
	created_at text,
	started_at text,
	finished_at text,
	player_count integer,
	canceled boolean default false,
	game_bot bigint
);

alter table v1.all_games owner to solish;

grant insert, select, update on v1.all_games to tg_helper;

grant select on v1.all_games to tg_manage;

create table if not exists v1.all_groups
(
	group_id bigint not null,
	is_saveyourrole_allow boolean default true not null,
	is_setshekar_allow boolean default true not null,
	is_saverole_allow boolean default true not null,
	created_at text,
	game_bot bigint,
	invite_link text,
	group_title text,
	cult_option boolean default false
);

alter table v1.all_groups owner to solish;

grant insert, select, update on v1.all_groups to tg_rolesaver;

create table if not exists v1.all_group_helper
(
	group_id bigint,
	title text,
	creator bigint,
	is_disabled boolean default false,
	disabled_by bigint,
	link text,
	jointime_pin integer default 1,
	game_started_pin integer default 1,
	is_confirm_tsww_enable boolean default true,
	is_confirm_score_enable integer,
	is_startnewgame_enable boolean,
	start_mode integer default 1,
	created_at text,
	disabled_at text
);

alter table v1.all_group_helper owner to solish;

grant insert, select on v1.all_group_helper to tg_helper;

grant select, update on v1.all_group_helper to tg_rolesaver;

grant insert, select, update on v1.all_group_helper to tg_manage;

create table if not exists v1.gorgyatim_alert
(
	user_id bigint,
	alert_type integer,
	group_id bigint,
	created_at text,
	is_alerted boolean default false,
	alerted_at text,
	id serial not null
);

alter table v1.gorgyatim_alert owner to solish;

create table if not exists v1.gorgyatim_users
(
	user_id bigint,
	name text,
	username text,
	created_at text,
	number text
);

alter table v1.gorgyatim_users owner to solish;

create table if not exists v1.pro_users
(
	user_id bigint,
	user_type integer,
	created_at text,
	expire_at text
);

alter table v1.pro_users owner to solish;

create table if not exists v1.user_types
(
	user_type integer,
	type_name text
);

alter table v1.user_types owner to solish;

create table if not exists v1.users_activity_log
(
	user_id bigint,
	group_id bigint,
	first_name text,
	status text,
	is_winner boolean,
	is_alive boolean,
	created_at text
);

alter table v1.users_activity_log owner to solish;

grant insert, select on v1.users_activity_log to tg_helper;

grant insert, select, update on v1.users_activity_log to tg_manage;

grant select on v1.users_activity_log to ali_ag;

create table if not exists v1.fun_mal
(
	gp_id bigint,
	hunter bigint,
	maler bigint,
	text text,
	accepted boolean,
	created_at text,
	id serial not null
);

alter table v1.fun_mal owner to solish;

create table if not exists v1.fun_malers
(
	maler bigint,
	hunter bigint,
	mal_score integer,
	text text,
	created_at text
);

alter table v1.fun_malers owner to solish;

create table if not exists v1.manager_delete_message
(
	group_id bigint,
	message_id bigint,
	deleted_at timestamp,
	created_at timestamp,
	user_id bigint
);

alter table v1.manager_delete_message owner to solish;

grant insert, select, update on v1.manager_delete_message to tg_manage;

grant select on v1.manager_delete_message to ali_ag;

grant select on v1.manager_delete_message to tg_rolesaver;

grant insert, select on v1.manager_delete_message to tg_helper;

create index if not exists manager_delete_message_group_id_message_id_user_id_index
	on v1.manager_delete_message (group_id, message_id, user_id);

create table if not exists v1.manager_join_setting
(
	chat_id bigint,
	first_join text,
	first_join_set_timestamp timestamp,
	again_join text,
	again_join_set_timestamp timestamp,
	in_game text,
	in_game_set_timestamp timestamp,
	in_jointime text,
	in_jointime_set_timestamp timestamp,
	in_idle text,
	in_idle_set_timestamp timestamp,
	created_at timestamp,
	expire_at timestamp
);

alter table v1.manager_join_setting owner to solish;

create table if not exists v1.manager_joinsetting_user_states
(
	state_id serial not null
		constraint manager_joinsetting_user_states_pk
			primary key,
	group_id bigint,
	is_finished boolean default false,
	user_id bigint,
	state text
);

alter table v1.manager_joinsetting_user_states owner to solish;

grant insert, select, update on v1.manager_joinsetting_user_states to tg_manage;

create table if not exists v1.manager_join_setting_1
(
	chat_id bigint,
	first_join text default '𝙷𝚎𝚕𝚕𝚘 {user}  𝚆𝚎𝚕𝚌𝚘𝚖𝚎 𝚝𝚘 {group}'::text,
	first_join_set_timestamp timestamp,
	again_join text default '𝙷𝚒 𝚘𝚕𝚍 𝚏𝚛𝚒𝚎𝚗𝚍🥂 {user} 𝚆𝚎𝚕𝚌𝚘𝚖𝚎 𝙱𝚊𝚌𝚔 𝚝𝚘 {group}💜🤝'::text,
	again_join_set_timestamp timestamp,
	in_game text default '𝚁𝚞𝚢𝚎 /Nextgame 𝙱𝚎𝚣𝚊𝚗 𝙳𝚊𝚍𝚊 𝚃𝚊 𝙱𝚊𝚛𝚊𝚢𝚎 𝙱𝚊𝚣𝚒 𝙱𝚊𝚍𝚒 𝙱𝚊 𝙺𝚑𝚊𝚋𝚊𝚛 𝙱𝚎𝚜𝚑𝚒'::text,
	in_game_set_timestamp timestamp,
	in_jointime text default '𝚁𝚞𝚢 /Join 𝙱𝚎𝚣𝚗 𝚝𝚊 𝚋𝚎𝚛𝚞𝚗𝚒 𝚟𝚊𝚛𝚍 𝚋𝚊𝚣𝚒 𝚋𝚎𝚜𝚑𝚒 🎮'::text,
	in_jointime_set_timestamp timestamp,
	in_idle text default '𝚈𝚘𝚞 𝚌𝚊𝚗 𝚞𝚜𝚎 /𝚂𝚝𝚊𝚛𝚝𝙶𝚊𝚖𝚎 𝙵𝚘𝚛 𝚂𝚝𝚊𝚛𝚝 𝙽𝚎𝚠 𝙶𝚊𝚖𝚎 𝙾𝚛 𝚄𝚜𝚎 /𝙽𝚎𝚡𝚝𝚐𝚊𝚖𝚎'::text,
	in_idle_set_timestamp timestamp,
	created_at timestamp,
	expire_at timestamp
);

alter table v1.manager_join_setting_1 owner to solish;

grant insert, select, update on v1.manager_join_setting_1 to tg_manage;

grant select on v1.manager_join_setting_1 to tg_helper;

create table if not exists v1.users_custom_rank
(
	user_id bigint,
	rank text,
	created_at timestamp default timezone('Asia/Tehran'::text, now()),
	updated_at timestamp
);

alter table v1.users_custom_rank owner to solish;

grant insert, select, update on v1.users_custom_rank to tg_manage;

create table if not exists v1.all_group_helper_black_werewolf
(
	group_id bigint,
	title text,
	creator bigint,
	is_disabled boolean default false,
	disabled_by bigint,
	link text,
	jointime_pin integer default 1,
	game_started_pin integer default 1,
	is_confirm_tsww_enable boolean,
	is_startnewgame_enable boolean,
	is_fillit_enabled boolean,
	start_mode integer default 1,
	role_save_mode integer default 1,
	created_at text,
	disabled_at text
);

alter table v1.all_group_helper_black_werewolf owner to solish;

grant insert, select on v1.all_group_helper_black_werewolf to tg_helper;

grant insert, select, update on v1.all_group_helper_black_werewolf to tg_rolesaver;

create table if not exists v2.all_games
(
	game_id serial not null
		constraint all_games_pkey
			primary key,
	group_id bigint,
	message_id bigint,
	created_at timestamp default timezone('Asia/Tehran'::text, now()) not null,
	started_at timestamp,
	finished_at timestamp,
	player_count integer,
	canceled boolean default false,
	game_bot bigint
);

alter table v2.all_games owner to solish;

grant usage on sequence v2.all_games_game_id_seq to tg_helper;

grant insert, select, update on v2.all_games to tg_helper;

grant insert, select, update on v2.all_games to tg_manage;

grant select on v2.all_games to tg_rolesaver;

create table if not exists v2.manager_delete_message_stats
(
	id serial not null
		constraint manager_delete_message_stats_pk
			primary key,
	group_id bigint,
	deleted_message bigint,
	last_update timestamp
);

alter table v2.manager_delete_message_stats owner to solish;

create unique index if not exists manager_delete_message_stats_group_id_uindex
	on v2.manager_delete_message_stats (group_id);

create unique index if not exists manager_delete_message_stats_id_uindex
	on v2.manager_delete_message_stats (id);

create table if not exists v2.users_activity_log
(
	user_id bigint,
	group_id bigint,
	status text,
	is_winner boolean,
	is_alive boolean,
	created_at text default timezone('Asia/Tehran'::text, now()),
	role_id integer
);

alter table v2.users_activity_log owner to solish;

grant select on v2.users_activity_log to tg_manage;

grant insert on v2.users_activity_log to tg_helper;

grant select on v2.users_activity_log to ali_ag;

grant select on v2.users_activity_log to tg_rolesaver;

create index if not exists users_activity_log__index
	on v2.users_activity_log (group_id, user_id);

create index if not exists users_activity_log_role_id_index
	on v2.users_activity_log (role_id);

create index if not exists users_activity_log_user_id_role_id_index
	on v2.users_activity_log (user_id, role_id);

create table if not exists v1.manager_delete_message_old
(
	group_id bigint,
	message_id bigint,
	deleted_at timestamp,
	created_at timestamp
);

alter table v1.manager_delete_message_old owner to solish;

create table if not exists v1.rulesaver_list_setting
(
	chat_id bigint,
	list_type integer
);

alter table v1.rulesaver_list_setting owner to solish;

grant insert, select, update on v1.rulesaver_list_setting to tg_rolesaver;

create table if not exists v2.ranks
(
	id integer,
	parent_id integer,
	title text,
	emoji text
);

alter table v2.ranks owner to solish;

grant insert, select, update on v2.ranks to tg_manage;

grant select on v2.ranks to tg_rolesaver;

create index if not exists ranks_id_index
	on v2.ranks (id);

create table if not exists v2.users_afks
(
	chat_id bigint,
	user_id bigint,
	afk_at text
);

alter table v2.users_afks owner to solish;

grant insert, select on v2.users_afks to tg_helper;

grant select on v2.users_afks to ali_ag;

grant select on v2.users_afks to tg_manage;

grant select on v2.users_afks to tg_rolesaver;

create index if not exists users_afks_chat_id_index
	on v2.users_afks (chat_id);

create index if not exists users_afks_chat_id_user_id_index
	on v2.users_afks (chat_id, user_id);

create index if not exists users_afks_user_id_index
	on v2.users_afks (user_id);

create table if not exists v2.rank_relation
(
	user_id integer,
	rank_id integer
);

alter table v2.rank_relation owner to solish;

create index if not exists rank_relation_rank_id_index
	on v2.rank_relation (rank_id);

create index if not exists rank_relation_user_id_index
	on v2.rank_relation (user_id);

create table if not exists v1.manager_players_messages
(
	chat_id bigint,
	user_id bigint,
	message_id integer,
	message_at text
);

alter table v1.manager_players_messages owner to solish;

grant insert, select, update on v1.manager_players_messages to tg_manage;

create index if not exists manager_players_messages_chat_id_index
	on v1.manager_players_messages (chat_id);

create index if not exists manager_players_messages_user_id_index
	on v1.manager_players_messages (user_id);

create index if not exists manager_players_messages_chat_id_user_id_index
	on v1.manager_players_messages (chat_id, user_id);

create table if not exists v2.manager_advanced_commands
(
	chat_id bigint not null,
	file_unique_id text not null,
	action_id integer not null,
	set_by bigint,
	created_at timestamp default timezone('Asia/Tehran'::text, now()),
	disabled_at timestamp,
	disabled_by bigint,
	media_type integer
);

alter table v2.manager_advanced_commands owner to solish;

grant insert, select, update on v2.manager_advanced_commands to tg_manage;

create index if not exists manager_advanced_commands_chat_id_file_unique_id_index
	on v2.manager_advanced_commands (chat_id, file_unique_id);

create index if not exists manager_advanced_commands_chat_id_index
	on v2.manager_advanced_commands (chat_id);

create table if not exists v2.members_ranks
(
	user_id bigint,
	rank_id integer,
	created_at timestamp default timezone('Asia/Tehran'::text, now()),
	disabled_at timestamp,
	reason_for_disable text
);

alter table v2.members_ranks owner to solish;

grant insert, select, update on v2.members_ranks to tg_rolesaver;

grant insert, select, update on v2.members_ranks to tg_manage;

create table if not exists v2.users_level
(
	user_id bigint not null
		constraint users_level_pk
			primary key,
	current_level integer,
	next_level integer,
	updated_at timestamp,
	saved_role bigint,
	score bigint,
	win_count_in_current_level integer,
	alive_count_in_current_level integer
);

alter table v2.users_level owner to solish;

create unique index if not exists users_level_user_id_uindex
	on v2.users_level (user_id);

create table if not exists v2.selected_emojies_by_user
(
	user_id bigint not null
		constraint selected_emojies_by_user_pk
			primary key,
	group_emoji integer default 0,
	main_emoji integer default 0,
	donor_emoji integer default 0
);

alter table v2.selected_emojies_by_user owner to solish;

grant insert, select, update on v2.selected_emojies_by_user to tg_rolesaver;

create unique index if not exists selected_emojies_by_user_user_id_uindex
	on v2.selected_emojies_by_user (user_id);

create table if not exists v2.cult_option_
(
	update_at timestamp,
	data json
);

alter table v2.cult_option_ owner to solish;

grant insert, select, update on v2.cult_option_ to tg_rolesaver;

create table if not exists v2.lupine_score_table
(
	user_id bigint,
	score bigint,
	role_id integer,
	alive boolean,
	winner boolean,
	created_at timestamp default timezone('Asia/Tehran'::text, now()),
	extra_data json,
	game_message_id bigint
);

alter table v2.lupine_score_table owner to solish;

grant insert, select on v2.lupine_score_table to tg_rolesaver;

create unique index if not exists lupine_score_table_user_id_game_message_id_uindex
	on v2.lupine_score_table (user_id, game_message_id);

create table if not exists v2.helpers_accounts
(
	group_id bigint,
	session_str text,
	uploaded_by bigint,
	uploaded_at timestamp default timezone('Asia/Tehran'::text, now()),
	disabled_at timestamp,
	status integer,
	type text,
	api_id bigint,
	api_hash integer
);

alter table v2.helpers_accounts owner to solish;

grant insert, select, update on v2.helpers_accounts to tg_manage;

create table if not exists v2.users_activity_log_v2
(
	message_id bigint,
	user_id bigint,
	group_id bigint,
	status text,
	is_winner boolean,
	is_alive boolean,
	created_at text default timezone('Asia/Tehran'::text, now()),
	role_id integer
);

alter table v2.users_activity_log_v2 owner to solish;

grant insert on v2.users_activity_log_v2 to tg_helper;

grant insert, select, update on v2.users_activity_log_v2 to tg_manage;

grant select on v2.users_activity_log_v2 to tg_rolesaver;

create table if not exists v2.groups_action_log
(
	group_id bigint,
	message_id bigint,
	user_id bigint,
	action_id integer,
	created_at timestamp default timezone('Asia/Tehran'::text, now())
);

alter table v2.groups_action_log owner to solish;

grant insert, select, update on v2.groups_action_log to tg_manage;

create unique index if not exists groups_action_log_group_id_message_id_user_id_uindex
	on v2.groups_action_log (group_id, message_id, user_id);

create index if not exists groups_action_log_group_id_action_id_index
	on v2.groups_action_log (group_id, action_id);

create index if not exists groups_action_log_user_id_action_id_index
	on v2.groups_action_log (user_id, action_id);

create index if not exists groups_action_log_group_id_index
	on v2.groups_action_log (group_id);

create index if not exists groups_action_log_user_id_index
	on v2.groups_action_log (user_id);

create index if not exists groups_action_log_action_id_index
	on v2.groups_action_log (action_id);

create table if not exists v1.player_votes
(
	chat_id bigint,
	voter integer,
	voted integer,
	vote_at timestamp
);

alter table v1.player_votes owner to solish;

grant insert on v1.player_votes to tg_helper;

grant select on v1.player_votes to tg_rolesaver;

create table if not exists v1.group_nexts
(
	chat_id bigint,
	next_text text,
	next_media_id text,
	next_type integer,
	created_at timestamp
);

alter table v1.group_nexts owner to solish;

grant insert, select, update on v1.group_nexts to tg_rolesaver;

create table if not exists v2.custom_welcome
(
	chat_id bigint not null
		constraint custom_welcome_pkey
			primary key,
	header text,
	new_member text,
	old_member text,
	jointime text,
	ingame text,
	idle text,
	footer text,
	is_on boolean default true
);

alter table v2.custom_welcome owner to solish;

grant insert, select, update, delete on v2.custom_welcome to tg_manage;

create table if not exists v2.group_states
(
	chat_id bigint,
	state text,
	last_update timestamp
);

alter table v2.group_states owner to solish;

grant insert, select, update on v2.group_states to tg_helper;

grant insert, select, update on v2.group_states to tg_manage;

create table if not exists v2.chat_langs
(
	chat_id bigint,
	lang varchar(2)
);

alter table v2.chat_langs owner to solish;

grant insert, select, update, delete on v2.chat_langs to tg_rolesaver;

create table if not exists v2.emoji_codes
(
	code text not null
		constraint emoji_codes_pk
			primary key,
	owner bigint,
	emoji_type integer,
	created_at timestamp with time zone default (timezone('Asia/Tehran'::text, now()))::timestamp with time zone,
	disabled_at timestamp with time zone,
	extra_data jsonb default '{}'::jsonb,
	emoji_id integer
);

comment on column v2.emoji_codes.owner is '0 means ourself';

comment on column v2.emoji_codes.emoji_type is '1 = random
2 = private';

alter table v2.emoji_codes owner to solish;

grant insert, select, update, delete, truncate, references, trigger on v2.emoji_codes to tg_rolesaver;

create unique index if not exists emoji_codes_code_uindex
	on v2.emoji_codes (code);

create table if not exists v2.contents
(
	key text not null,
	content text,
	send_type text default 'html'::text,
	created_at timestamp with time zone default (timezone('Asia/Tehran'::text, now()))::timestamp with time zone
);

alter table v2.contents owner to solish;

grant select on v2.contents to tg_rolesaver;

create unique index if not exists contents_key_uindex
	on v2.contents (key);

create table if not exists v2.permissions
(
	user_id bigint not null,
	permission_id integer not null,
	created_at timestamp with time zone default (timezone('Asia/Tehran'::text, now()))::timestamp with time zone,
	deleted_at timestamp with time zone
);

alter table v2.permissions owner to solish;

grant select on v2.permissions to tg_rolesaver;

grant select on v2.permissions to tg_manage;

create index if not exists permissions_user_id_index
	on v2.permissions (user_id);

create table if not exists v2.enumeration
(
	id bigserial not null
		constraint enumeration_pk
			primary key,
	title text,
	created_at timestamp with time zone default (timezone('Asia/Tehran'::text, now()))::timestamp with time zone
);

alter table v2.enumeration owner to solish;

create unique index if not exists enumeration_id_uindex
	on v2.enumeration (id);

create table if not exists v2.promoted_users
(
	user_id bigint,
	chat_id bigint,
	promoted_by bigint,
	created_at timestamp with time zone default timezone('Asia/Tehran'::text, now()),
	deleted_at timestamp with time zone,
	extra_data jsonb
);

alter table v2.promoted_users owner to tg_manage;

create index if not exists promoted_users_chat_id_deleted_at_index
	on v2.promoted_users (chat_id, deleted_at);

create table ali_ag_db.joinlink
(
	chat_id bigint,
	link text,
	user_id bigint
);

alter table ali_ag_db.joinlink owner to ali_ag;

