CREATE DATABASE KPSPark;


CREATE TABLE TDL_User(
	uid INT AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(20) NOT NULL,
	user_pw VARCHAR(20) NOT NULL,
	user_name VARCHAR(40) NOT NULL,
	user_email VARCHAR(100) NOT NULL
);

INSERT INTO tdl_user VALUES(0, 'admin', 'admin', 'admin', 'heyawoo@gmail.com');
INSERT INTO tdl_user VALUES(0, 'test', 'test', 'test', 'test@gmail.com');
INSERT INTO tdl_user VALUES(0, 'user', 'user', 'user', 'user@gmail.com');



CREATE TABLE TDL_Task(
	tid INT AUTO_INCREMENT PRIMARY KEY,
	task_title VARCHAR(100) NOT NULL,
	task_date DATE NOT NULL,
	task_contents TEXT,
	task_status INT NOT NULL,
	task_userid int NOT NULL,
	task_input DATE NOT NULL,
	task_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_task FOREIGN KEY (task_userid)
	REFERENCES TDL_User(uid)
);

INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, 'お水を飲む', CURRENT_DATE(), '毎日500ml以上',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='admin';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '5000歩以上歩く', CURRENT_DATE(), null,0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='admin';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '12時以前に寝る', CURRENT_DATE(), '一日6時間以上の睡眠',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='admin';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '肯定的に考える', CURRENT_DATE(), '',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='admin';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '朝ごはん食べる', CURRENT_DATE(), 'ごはんで',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='test';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '本読む', CURRENT_DATE(), '図書館に行く',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='test';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, 'メール確認', CURRENT_DATE(), '返信も送る',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='test';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, 'パン食べない', CURRENT_DATE(), '',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='user';
INSERT INTO tdl_task(tid, task_title, task_date, task_contents, task_status, task_userid, task_input)
SELECT 0, '運動する', CURRENT_DATE(), '',0, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='user';


CREATE TABLE TDL_Diary(
	did INT AUTO_INCREMENT PRIMARY KEY,
	diary_title VARCHAR(100) NOT NULL,
	diary_date DATE NOT NULL,
	diary_contents TEXT,
	diary_rate INT,
	diary_userid int NOT NULL,
	diary_input DATE NOT NULL,
	diary_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_diary FOREIGN KEY (diary_userid)
	REFERENCES TDL_User(uid)
);


INSERT INTO tdl_diary(did, diary_title, diary_date, diary_contents, diary_rate, diary_userid, diary_input)
SELECT 0, '今日の日記', CURRENT_DATE(), '今日は音楽を聴いた。',4, uid, CURRENT_DATE() FROM tdl_user WHERE user_name='test';


DELETE FROM tdl_task;
DELETE FROM tdl_diary;
DELETE FROM tdl_user;

ALTER TABLE tdl_task AUTO_INCREMENT = 1;
ALTER TABLE tdl_diary AUTO_INCREMENT = 1;
ALTER TABLE tdl_user AUTO_INCREMENT = 1;
