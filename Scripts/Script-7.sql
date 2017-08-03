
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

select s_id, s_name from student;
-- (1, '결석'),(2, '등원'),(3, '지각'),(4, '조퇴'),(5, '하원')
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-08-01 20:55:50', 2),
('sss01', '2017-08-02 17:55:50', 3),
('sss01', '2017-08-05 17:55:50', 2),
('sss01', '2017-08-05 20:55:50', 4),
('sss01', '2017-08-01 22:55:50', 5),
('sss01', '2017-08-02 20:55:50', 5);


INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-08-10 15:55:50', 3),
('sss01', '2017-08-10 17:55:50', 4);

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
(1, 0, 16, 17, 1),
(2, 1, 16, 17, 1),
(3, 1, 18, 20, 1),
(2, 3, 16, 17, 1),
(2, 5, 16, 17, 1),
(1, 4, 18, 22, 1),
(3, 4, 16, 17, 1),
(4, 1, 18, 20, 1),
(4, 6, 12, 20, 1);


INSERT INTO edu_manager.examination (sb_no, s_id, ei_no, e_result, e_memo, e_date) values
(1,'sss01', 1, 90, '', '2017-04-20'),
(1,'sss01', 2, 90, '', '2017-06-20');

INSERT INTO edu_manager.examination (sb_no, s_id, c_no, ei_no, e_result, e_memo, e_date) values
(1,'sss01', 2, 6, 70, '~~~에 대한 복습이 필요합니다', '2017-06-05'),
(1,'sss01', 2, 6, 80, '핵심키워드에 대한 공부가 필요합니다','2017-06-20'),
(1,'sss01', 2, 6, 90, '~~~에 대한 복습이 필요합니다', '2017-07-05'),
(1,'sss01', 2, 6, 60, '~~~에 대한 복습이 필요합니다', '2017-07-15'),
(1,'sss01', 3, 5, 90, '', '2017-07-08');



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


SELECT cr.*, c.c_name, ttt.*, t.t_name, sb.sb_no, sb.sb_name FROM course c inner join subject 
sb on sb.sb_no = c.sb_no inner join course_register cr on cr.reg_c_no = c.c_no inner join teacher 
t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no WHERE cr.reg_s_id ='sss01' 
and cr.reg_month =201707 and cr.rs_no =1 ;

-- 오늘 등원해야 할 학생들 시작시간, 끝시간
select cr.reg_s_id, min(t.tt_starttime), max(t.tt_endtime) from course_register cr 
inner join timetable t on cr.reg_c_no = t.c_no
where t.tt_day = 1 and cr.reg_month = '201707'
group by cr.reg_s_id;

select max(t.tt_endtime) from course_register cr 
inner join timetable t on cr.reg_c_no = t.c_no
where t.tt_day = 1 and cr.reg_s_id='sss01';

select 0
where not exists (select 1 from course_register cr where cr.reg_s_id='sss03' and cr.reg_month='201707');
select cr.reg_no from course_register cr where cr.reg_s_id='sss0' and cr.reg_month='201707';

-- 등원 일반 /지각 판별후 입력
INSERT INTO attendance (s_id, the_time, as_no)
select 'sss01', current_timestamp, if( 
	(select min(t.tt_starttime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01'
	) > hour(current_time)
,2,3) from dual
where not exists (select 1 from attendance a2 
					where a2.s_id='sss01' and date(a2.the_time)=current_date and a2.as_no between 2 and 4);

-- 하원 일반/ 조퇴 판별후 입력하기
INSERT INTO attendance (s_id, the_time, as_no)
values ('sss02', current_timestamp, if( 
	(select max(t.tt_endtime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01'
	) > hour(current_time)
,4,5));
from dual
where exists (select 1 from 
					attendance a2 
					where a2.s_id='sss01' and date(a2.the_time)=current_date and a2.as_no between 2 and 3)
		and not exists (select 1 from 
					attendance a3 
					where a3.s_id='sss01' and date(a3.the_time)=current_date and a3.as_no between 4 and 5);
					
					
		select * from attendance order by at_no desc;
		
		select date('2017-07-01 16:55:50');
		select now();
		select current_date;
		select concat(hour(current_time), minute(current_time));
		
select if((select 1 from attendance a2 
					where a2.s_id='sss02' 
					and date(a2.the_time)=current_date 
					and a2.as_no between 2 and 3) is null, 'not exists', 'exists');
					
					
				select ifnull((select 1 from attendance a2 
					where a2.s_id='sss03' 
					and date(a2.the_time)=current_date
					and a2.as_no between 4 and 5),0);
					
					
					-- 등원 일반 /지각 판별후 입력
if(
	select ifnull((select 1 from attendance a2 
					where a2.s_id='sss02' 
					and date(a2.the_time)=current_date
					and a2.as_no between 2 and 3),0)==1
,
INSERT INTO attendance (s_id, the_time, as_no)
select 'sss02', current_timestamp, if( 
	(select max(t.tt_endtime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01'
	) > hour(current_time)
,4,5) from dual
where exists (select 1 from 
					attendance a2 
					where a2.s_id='sss01' and date(a2.the_time)=current_date and a2.as_no between 2 and 3)
		and not exists (select 1 from 
					attendance a3 
					where a3.s_id='sss01' and date(a3.the_time)=current_date and a3.as_no between 4 and 5)
,
INSERT INTO attendance (s_id, the_time, as_no)
select 'sss01', current_timestamp, if(
	(select min(t.tt_starttime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01' and cr.reg_month = '201707'
	) > hour(current_time)
,2,3) from dual
where not exists (select 1 from attendance a2 
					where a2.s_id='sss01' and date(a2.the_time)=current_date and a2.as_no between 2 and 4));
					
INSERT INTO attendance (s_id, the_time, as_no)
select 'sss01', current_timestamp, if(
	(select min(t.tt_starttime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01' and cr.reg_month = '201707'
	) > hour(current_time)
,2,3) from dual
where not exists (select 1 from attendance a2 
					where a2.s_id='sss01' and date(a2.the_time)=current_date and a2.as_no between 2 and 4);
					
select 1 from attendance a2 
		where a2.s_id='sss02' and date(a2.the_time)=current_date and a2.as_no between 2 and 3;
		
		
		SELECT e.*, ei.ei_title, c.c_name FROM examination e inner join exam_item ei on e.ei_no = ei.ei_no 
inner join subject sb on sb.sb_no = e.sb_no left outer join course c on c.c_no = e.c_no WHERE 
e.s_id = 'sss01' and e.ei_no > 4;
		

select s.s_id, s.s_name, s.s_phone, s.school, att.the_time, ass.as_status from course_register cr
inner join timetable tt on tt.c_no = cr.reg_c_no
inner join student s on s.s_id = cr.reg_s_id
left outer join attendance att on cr.reg_s_id = att.s_id and date(att.the_time) = '2017-07-15'
left outer join attendance_status ass on att.as_no = ass.as_no
where tt.tt_day = 1 and cr.reg_c_no = 4 and cr.reg_month='201707'
group by cr.reg_s_id; 

select current_date;



select s.s_id, s.s_name, s.s_phone, s.school, att.the_time, ass.as_no, ass.as_status from course_register cr 
inner join timetable tt on tt.c_no = cr.reg_c_no inner join student s on s.s_id = cr.reg_s_id 
left outer join attendance att on cr.reg_s_id = att.s_id and date(att.the_time) = '2017-07-28'
left outer join attendance_status ass on att.as_no = ass.as_no
WHERE  cr.reg_c_no = 4 and cr.reg_month=201707
group by  s.s_id, att.the_time;

select s.s_id, s.s_name, s.s_phone, s.school, att.the_time, ass.as_no, ass.as_status from course_register 
cr inner join timetable tt on tt.c_no = cr.reg_c_no inner join student s on s.s_id = cr.reg_s_id 
left outer join attendance att on cr.reg_s_id = att.s_id and date(att.the_time) = current_date 
left outer join attendance_status ass on att.as_no = ass.as_no 
WHERE cr.reg_c_no = 4 and cr.reg_month=201707
group by s.s_id, att.the_time;


select s.s_id, s.s_name, s.s_phone, s.school, att.the_time, att.at_no, ass.as_no, ass.as_status 
from course_register cr inner join timetable tt on tt.c_no = cr.reg_c_no inner join student 
s on s.s_id = cr.reg_s_id left outer join attendance att on cr.reg_s_id = att.s_id and date(att.the_time) 
= current_date left outer join attendance_status ass on att.as_no = ass.as_no WHERE tt.tt_day 
= 4 and cr.reg_c_no = 4 and cr.reg_month=201707 group by s.s_id, att.the_time ;


select * from course_register cr
inner join student s on s.s_id = cr.reg_s_id 
WHERE cr.reg_c_no = 4 and cr.reg_month=201707;

select s.s_id, s.s_name, s.s_phone, s.school, att.the_time, ass.as_no, ass.as_status from course_register cr 
inner join timetable tt on tt.c_no = cr.reg_c_no 
inner join student s on s.s_id = cr.reg_s_id 
left outer join attendance att on cr.reg_s_id = att.s_id and date(att.the_time) = current_date 
left outer join attendance_status ass on att.as_no = ass.as_no 
WHERE tt.tt_day =1 and cr.reg_c_no = 4 and cr.reg_month=201707;
group by att.the_time;