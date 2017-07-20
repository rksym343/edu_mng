
	INSERT INTO edu_manager.subject (sb_name, sb_is_del) VALUES('국어', 0),('영어', 0),('수학', 0),('사회', 0),('과학', 0);


INSERT INTO edu_manager.student_grade (gd_no, gd_name) values
(1, '초1'), (2, '초2'), (3, '초3'), (4, '초4'), (5, '초5'), (6, '초6'), 
(7, '중1'), (8, '중2'), (9, '중3'), (10, '고1'), (11, '고2'), (12, '고3');

INSERT INTO edu_manager.teacher (t_id, t_password, t_name, t_phone, t_subject, t_picture)
		VALUES('aaa01', 'aaa01', '김선생', '010-7777-7777', 1, '사진');
		

INSERT INTO edu_manager.registration_status (rs_no, status) values
(1, '결제'),(2,'미결제'),(3,'결제취소'),(4,'미연장');

INSERT INTO edu_manager.transfer_method (tm_no, tm_method) values
(1, 'SMS'), (2, 'APP'), (3, 'HOME'),(4, 'SMS&APP'),(5, 'SMS&HOME'),(6, 'APP&HOME'),(7, 'SMS&APP&HOME');

INSERT INTO edu_manager.attendance_status (as_no, as_status) values 
(1, '결석'),(2, '등원'),(3, '지각'),(4, '조퇴'),(5, '하원');

INSERT INTO edu_manager.exam_item (ei_no, ei_title) values 
(1, '1학기 중간'), (2, '1학기 기말'), (3, '2학기 중간'), (4, '2학기 기말'), (5, '단원테스트'), (6, '중간테스트');

INSERT INTO edu_manager.student
(s_id, s_password, s_name, s_phone, tm_no, school, gd_no, join_date)
VALUES('sss01', 'sss01', '나학생', '010-111-1111', 1, '가가중학교', 7, CURRENT_TIMESTAMP);
INSERT INTO edu_manager.student
(s_id, s_password, s_name, s_phone, tm_no, school, gd_no, join_date)
VALUES('sss02', 'sss02', '너학생', '010-111-1111', 1, '가가중학교', 7, CURRENT_TIMESTAMP);


INSERT INTO edu_manager.course (c_no, t_id, gd_no, sb_no, c_name, is_canceled)
values (1, 'aaa01', 7, 1, '강의명', 0);
INSERT INTO edu_manager.course (c_no, t_id, gd_no, sb_no, c_name, is_canceled)
values 
(2, 'aaa01', 7, 1, '강의명2', 0),(3, 'aaa01', 7, 1, '강의명3', 0),(4, 'aaa01', 7, 1, '강의명4', 0),
(5, 'aaa01', 7, 1, '강의명5', 0),(6, 'aaa01', 7, 1, '강의명6', 0),(7, 'aaa01', 7, 1, '강의명7', 0);


INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values 
('sss01', '2017-05-31 17:55:50', 5);
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) 
values  ('sss01', current_date, 1);
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-06-05 20:55:50', 3),
('sss01', '2017-07-20 17:55:50', 2),
('sss01', '2017-08-31 17:55:50', 4);


-- (1, '결석'),(2, '등원'),(3, '지각'),(4, '조퇴'),(5, '하원')
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-07-01 20:55:50', 2),
('sss01', '2017-07-02 17:55:50', 3),
('sss01', '2017-07-05 17:55:50', 2),
('sss01', '2017-07-05 20:55:50', 4),
('sss01', '2017-07-01 22:55:50', 5),
('sss01', '2017-07-02 20:55:50', 5);


INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-07-10 15:55:50', 3),
('sss01', '2017-07-10 17:55:50', 4);

INSERT INTO edu_manager.course_register (reg_month, reg_s_id, reg_c_no, rs_no) values 
(201705, 'sss01', 1, 1),
(201706, 'sss01', 1, 1),
(201707, 'sss01', 1, 1),
(201707, 'sss01', 2, 1),
(201707, 'sss01', 3, 1),
(201707, 'sss01', 4, 3),
(201708, 'sss01', 1, 4),
(201708, 'sss01', 2, 2),
(201708, 'sss01', 3, 2);

INSERT INTO edu_manager.course_register (reg_month, reg_s_id, reg_c_no, rs_no) values 
(201707, 'sss01', 4, 1);

INSERT INTO edu_manager.course_register (reg_month, reg_s_id, reg_c_no, rs_no) values 
(201707, 'sss02', 4, 1);


INSERT INTO edu_manager.timetable (c_no, tt_day, tt_starttime, tt_endtime, tt_version) values
(1, 0, 1600, 1730, 1),

(2, 1, 1600, 1730, 1),
(3, 1, 1800, 2030, 1),

(2, 3, 1600, 1730, 1),
(2, 5, 1600, 1730, 1),

(1, 4, 1800, 2200, 1),
(3, 4, 1600, 1730, 1),

(3, 1, 1800, 2030, 1),

(4, 6, 1200, 2000, 1);



INSERT INTO edu_manager.examination (s_id, c_no, ei_no, e_result, e_memo) values 
('sss01', 2, 2, 90, ''),
('sss01', 2, 6, 70, '~~~에 대한 복습이 필요합니다'),
('sss01', 2, 6, 80, '핵심키워드에 대한 공부가 필요합니다'),
('sss01', 3, 2, 90, '');

INSERT INTO edu_manager.parents
(sp_id, sp_password, sp_name, sp_phone, tm_no, sp_relationship, s_id)
VALUES('sp01', 'sp01', '나학부모', '010-1111-1111', 2, '엄마', 'sss02');

INSERT INTO edu_manager.parents
(sp_id, sp_password, sp_name, sp_phone, tm_no, sp_relationship, s_id)
VALUES('mmm01', 'mmm01', '나학부모', '010-1111-1234', 2, '엄마', 'sss01');
INSERT INTO edu_manager.parents
(sp_id, sp_password, sp_name, sp_phone, tm_no, sp_relationship, s_id)
VALUES('ppp01', 'ppp01', '나아빠', '010-1234-1234', 2, '아빠', 'sss01');


INSERT INTO edu_manager.message (t_id, c_no, s_id, sp_id, msg_content, is_checked, reg_date) values
('aaa01', null, 'sss01', null, '가입을 축하합니다', 1, current_timestamp),
('aaa01', 1, 'sss01', null, '국어과제 마감기한 2017-07-28까지 입니다', 1, current_timestamp),
('aaa01', 1, 'sss01', null, '내일은 휴강입니다', 0, current_timestamp),
('aaa01', null, 'sss02', null, '가입을 축하합니다', 0, current_timestamp),
('aaa01', null, null, 'sp01', '가입을 축하합니다', 1, current_timestamp);

-- --------------------------
-- 1. 결석
select a.s_id, a.at_no a1_no, a2.at_no a2_no, a.the_time a1_time, a2.the_time a2_time, a.as_no a1_as_no, a2.as_no a2_as_no from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 1;

-- 2. 등원하원
select a.s_id, a.at_no a1_no, a2.at_no a2_no, a.the_time a1_time, a2.the_time a2_time, a.as_no a1_as_no, a2.as_no a2_as_no from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 2 and a2.as_no = 5; 

-- 3. 등원조퇴
select a.s_id, a.at_no a1_no, a2.at_no a2_no, a.the_time a1_time, a2.the_time a2_time, a.as_no a1_as_no, a2.as_no a2_as_no from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 2 and a2.as_no = 4; 

-- 4. 지각 하원
select a.s_id, a.at_no a1_no, a2.at_no a2_no, a.the_time a1_time, a2.the_time a2_time, a.as_no a1_as_no, a2.as_no a2_as_no from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 3 and a2.as_no = 5; 

-- 5. 지각 조퇴
select count(a.at_no) from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 3 and a2.as_no = 4; 


-- --------------------

where a.as_no = 2 and a2.as_no = 4 ;
Date(a.the_time) in
	(select Date(a2.the_time) from attendance a2);
