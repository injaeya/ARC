PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2024-08-01 00:05:46.930848');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2024-08-01 00:05:46.945523');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2024-08-01 00:05:46.957484');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2024-08-01 00:05:46.968448');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2024-08-01 00:05:46.979412');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2024-08-01 00:05:46.994370');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2024-08-01 00:05:47.004858');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2024-08-01 00:05:47.014825');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2024-08-01 00:05:47.026190');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2024-08-01 00:05:47.037153');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2024-08-01 00:05:47.040144');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2024-08-01 00:05:47.049113');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2024-08-01 00:05:47.059080');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2024-08-01 00:05:47.069046');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2024-08-01 00:05:47.079252');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2024-08-01 00:05:47.086459');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2024-08-01 00:05:47.096422');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2024-08-01 00:05:47.105284');
INSERT INTO django_migrations VALUES(19,'Ramen','0001_initial','2024-08-01 00:10:57.630061');
INSERT INTO django_migrations VALUES(20,'pybo','0001_initial','2024-08-01 00:10:57.638988');
INSERT INTO django_migrations VALUES(21,'Ramen','0002_mymodel','2024-09-02 07:25:12.128161');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
INSERT INTO django_admin_log VALUES(1,'2024-09-02 06:49:09.483683','2','emp001','',4,1,3);
INSERT INTO django_admin_log VALUES(2,'2024-09-02 06:49:09.510686','3','emp002','',4,1,3);
INSERT INTO django_admin_log VALUES(3,'2024-09-02 06:49:09.533095','4','emp003','',4,1,3);
INSERT INTO django_admin_log VALUES(4,'2024-09-02 06:50:39.870589','6','a','',4,1,3);
INSERT INTO django_admin_log VALUES(5,'2024-09-02 06:50:39.895585','5','emp001','',4,1,3);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'pybo','question');
INSERT INTO django_content_type VALUES(8,'pybo','answer');
INSERT INTO django_content_type VALUES(9,'Ramen','question');
INSERT INTO django_content_type VALUES(10,'Ramen','answer');
INSERT INTO django_content_type VALUES(11,'Ramen','mymodel');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_question','Can add question');
INSERT INTO auth_permission VALUES(26,7,'change_question','Can change question');
INSERT INTO auth_permission VALUES(27,7,'delete_question','Can delete question');
INSERT INTO auth_permission VALUES(28,7,'view_question','Can view question');
INSERT INTO auth_permission VALUES(29,8,'add_answer','Can add answer');
INSERT INTO auth_permission VALUES(30,8,'change_answer','Can change answer');
INSERT INTO auth_permission VALUES(31,8,'delete_answer','Can delete answer');
INSERT INTO auth_permission VALUES(32,8,'view_answer','Can view answer');
INSERT INTO auth_permission VALUES(33,9,'add_question','Can add question');
INSERT INTO auth_permission VALUES(34,9,'change_question','Can change question');
INSERT INTO auth_permission VALUES(35,9,'delete_question','Can delete question');
INSERT INTO auth_permission VALUES(36,9,'view_question','Can view question');
INSERT INTO auth_permission VALUES(37,10,'add_answer','Can add answer');
INSERT INTO auth_permission VALUES(38,10,'change_answer','Can change answer');
INSERT INTO auth_permission VALUES(39,10,'delete_answer','Can delete answer');
INSERT INTO auth_permission VALUES(40,10,'view_answer','Can view answer');
INSERT INTO auth_permission VALUES(41,11,'add_mymodel','Can add my model');
INSERT INTO auth_permission VALUES(42,11,'change_mymodel','Can change my model');
INSERT INTO auth_permission VALUES(43,11,'delete_mymodel','Can delete my model');
INSERT INTO auth_permission VALUES(44,11,'view_mymodel','Can view my model');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$260000$BkxF5JYWWPlN3QN9ENOAVr$hqnQ2UMvZOO4YeikltyDHDDhlJJRWCxWQ+/5LFK++GA=','2024-09-02 06:45:30.734015',1,'admin','','admin@admin.com',1,1,'2024-08-01 00:21:08.593742','');
INSERT INTO auth_user VALUES(7,'pbkdf2_sha256$260000$wDDO66FGMSMFZCRFqffx24$pSQwfoLDxkmFIpm6rtPJ+p6n/Pt0LAJ+kH2l/L427CI=','2024-09-02 23:37:17.983319',0,'20190118','','',0,1,'2024-09-02 06:52:51.413622','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('l9sbtl7ts97z327j1ht616l01frp37p7','.eJxVjDsOwjAQRO_iGlngjT-hpM8ZrPWuFweQI8VJhbg7iZQCypn3Zt4q4rqUuLY8x5HVVV3U6bdLSM9cd8APrPdJ01SXeUx6V_RBmx4mzq_b4f4dFGxlWzsmBBFyzqPNkM8kEsCCOLbiu95gICIxQTwGRMbEsOWeOmM5eFCfLyKyOZc:1sZJZW:Kt9MAvdD1-KdRCk8Iq_fYOP8Rq9PhYy84b9eVATXx10','2024-08-15 00:21:34.810245');
INSERT INTO django_session VALUES('mvwzknpaeqhtvm5rcskbf1s414tf3xme','.eJxVjDsOwjAQBe_iGlmL43htSnrOEO0PEkCJFCcV4u4QKQW0b2bey3W0Ln23Vpu7Qd3JoTv8bkzysHEDeqfxNnmZxmUe2G-K32n1l0nted7dv4Oeav-tQYuytDllCKSIsRHTYMihLRhRjIFQQsyRWI7Q5iYVAwiJLTDr1b0_7Cs4Lw:1slGbm:J6yXkaBcXt06_H47kRIcEY0_MgjJxY9cNgxOvMPGngw','2024-09-16 23:37:18.019329');
CREATE TABLE IF NOT EXISTS "Ramen_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "subject" varchar(200) NOT NULL, "content" text NOT NULL, "create_date" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "Ramen_answer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "create_date" datetime NOT NULL, "question_id" bigint NOT NULL REFERENCES "Ramen_question" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "pybo_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "subject" varchar(200) NOT NULL, "content" text NOT NULL, "create_date" datetime NOT NULL);
INSERT INTO pybo_question VALUES(1,'pybo가 무엇인가요?','pybo에 대해서 알고 싶습니다.','2024-08-01 00:15:44.684267');
INSERT INTO pybo_question VALUES(2,'장고 모델 질문입니다.','id는 자동으로 생성되나요?','2024-08-01 00:16:03.645931');
CREATE TABLE IF NOT EXISTS "pybo_answer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "create_date" datetime NOT NULL, "question_id" bigint NOT NULL REFERENCES "pybo_question" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO pybo_answer VALUES(1,'네 자동으로 생성됩니다.','2024-08-01 00:19:10.147959',2);
CREATE TABLE IF NOT EXISTS "Ramen_mymodel" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "employee_id" varchar(100) NOT NULL, "count" integer NOT NULL);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',21);
INSERT INTO sqlite_sequence VALUES('django_admin_log',5);
INSERT INTO sqlite_sequence VALUES('django_content_type',11);
INSERT INTO sqlite_sequence VALUES('auth_permission',44);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',7);
INSERT INTO sqlite_sequence VALUES('pybo_question',2);
INSERT INTO sqlite_sequence VALUES('pybo_answer',1);
INSERT INTO sqlite_sequence VALUES('Ramen_mymodel',15);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "Ramen_answer_question_id_dcb73966" ON "Ramen_answer" ("question_id");
CREATE INDEX "pybo_answer_question_id_e174c39f" ON "pybo_answer" ("question_id");
COMMIT;
