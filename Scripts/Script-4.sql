
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

INSERT INTO edu_manager.examination (s_id, c_no, ei_no, e_result, e_memo) values 
('sss01', 2, 2, 90, ''),
('sss01', 2, 6, 70, '~~~에 대한 복습이 필요합니다'),
('sss01', 2, 6, 80, '핵심키워드에 대한 공부가 필요합니다'),
('sss01', 3, 2, 90, '');




INSERT INTO edu_manager.student
(s_id, s_password, s_name, s_phone, tm_no, school, gd_no, join_date)
VALUES('sss01', 'sss01', '나학생', '010-111-1111', 1, '가가중학교', 7, CURRENT_TIMESTAMP);

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


select * from course_register cr
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1 ;

SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id left outer join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1 ;

 SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1 ;

		SELECT cr.*, c.c_name, ttt.*, t.t_name FROM  course c
		inner join course_register cr on cr.reg_c_no = c.c_no
		inner join teacher t on t.t_id = c.t_id
		inner join timetable ttt on ttt.c_no = cr.reg_c_no
			where reg_s_id = 'sss01' and reg_month =201707 and rs_no =1;
		
			
			SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1;

select * from timetable where c_no=2;

SELECT c.*, t.t_name, sg.gd_name, s.sb_name, ttt.* FROM course c 
inner join subject s on c.sb_no = s.sb_no 
inner join teacher t on c.t_id = t.t_id 
inner join student_grade sg on c.gd_no = sg.gd_no 
inner join timetable ttt on ttt.c_no = c.c_no WHERE c.c_no=2;

select count(att.at_no) from attendance att;


SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1 order by c.c_no, ttt.tt_day, ttt.tt_starttime ;