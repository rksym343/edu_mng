
	INSERT INTO edu_manager.subject (sb_name, sb_is_del) VALUES('국어', 0),('영어', 0),('수학', 0),('사회', 0),('과학', 0);


INSERT INTO edu_manager.student_grade (gd_no, gd_name) values
(1, '초1'), (2, '초2'), (3, '초3'), (4, '초4'), (5, '초5'), (6, '초6'), 
(7, '중1'), (8, '중2'), (9, '중3'), (10, '고1'), (11, '고2'), (12, '고3');

INSERT INTO edu_manager.teacher (t_id, t_password, t_name, t_phone, t_subject, t_picture)
		VALUES('aaa01', 'aaa01', '김선생', '010-7777-7777', 1, '사진');
		
		select date('2017-01-03 00:08:00');
		
SELECT e.*, ei.ei_title, c.c_name FROM examination e left outer join exam_item ei on e.ei_no = ei.ei_no 
inner join subject sb on sb.sb_no = e.sb_no left outer join course c on c.c_no = e.c_no 
WHERE 
(e.sb_no=1 and e.c_no = 4) or (e.sb_no=1 and e.c_no is null)
and e.e_date ='2017-08-03';

SELECT e.*, ei.ei_title, c.c_name, s.s_name FROM examination e left outer join exam_item ei 
on e.ei_no = ei.ei_no inner join subject sb on sb.sb_no = e.sb_no left outer join course c 
on c.c_no = e.c_no left outer join student s on s.s_id = e.s_id WHERE e.ei_no = 1 and e.c_no 
= 4 and e.e_date =date('2017-08-03 00:00:00') ;

SELECT e.*, ei.ei_title, c.c_name, s.s_name FROM examination e 
inner join course_register cr on e.s_id = cr.reg_s_id and cr.reg_c_no=4 and cr.reg_month = '201708'
left outer join exam_item ei on e.ei_no = ei.ei_no 
inner join subject sb on sb.sb_no = e.sb_no 
left outer join course c on c.c_no = e.c_no 
left outer join student s on s.s_id = e.s_id 
WHERE e.ei_no = 2 
and ((e.sb_no=1 and e.c_no = 4) or (e.sb_no=1 and e.c_no is null))
group by e.s_id;

SELECT e.*, ei.ei_title, c.c_name FROM examination e 
left outer join exam_item ei on e.ei_no = ei.ei_no 
inner join subject sb on sb.sb_no = e.sb_no 
left outer join course c on c.c_no = e.c_no 
WHERE e.c_no = 1 and e.e_date =date('2017-08-03 00:00:00');
		

SELECT e.*, ei.ei_title, c.c_name, s.s_name FROM examination e inner join course_register cr 
on e.s_id = cr.reg_s_id and cr.reg_c_no=1 and cr.reg_month = '201708' left outer join exam_item 
ei on e.ei_no = ei.ei_no inner join subject sb on sb.sb_no = e.sb_no left outer join course 
c on c.c_no = e.c_no left outer join student s on s.s_id = e.s_id WHERE e.ei_no = 2 and ((e.sb_no=1 
and e.c_no = 1) or (e.sb_no=1 and e.c_no is null));


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
values (1, 'aaa01', 7, 1, '중1 국어', 0);
INSERT INTO edu_manager.course (c_no, t_id, gd_no, sb_no, c_name, is_canceled)
values 
(2, 'aaa01', 7, 1, '중1 국어 비문학독해', 0),(3, 'aaa01', 7, 1, '중1 국어 시 특강', 0),(4, 'aaa01', 7, 1, '중1 국어 논술', 0),
(5, 'aaa01', 7, 1, '중1 국어 문학', 0),(6, 'aaa01', 7, 1, '중1 국어 작문', 0),(7, 'aaa01', 7, 1, '중1 국어 특강', 0);


INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values 
('sss01', '2017-05-31 17:55:50', 2),
('sss01', '2017-05-31 19:55:50', 5);
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) 
values  ('sss01', current_date, 1);
INSERT INTO edu_manager.attendance (s_id, the_time, as_no) values
('sss01', '2017-06-05 20:55:50', 3),
('sss01', '2017-06-05 22:55:50', 5),
('sss01', '2017-07-20 17:55:50', 1);


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
(1,'sss01', 2, 6, 70, '지문을 빨리 읽는 연습이 필요합니다', '2017-06-05'),
(1,'sss01', 2, 6, 80, '핵심키워드에 대한 공부가 필요합니다','2017-06-20'),
(1,'sss01', 2, 6, 90, '1단원에 대한 복습이 필요합니다', '2017-07-05'),
(1,'sss01', 2, 6, 60, '정확한 독해 연습이 필요합니다', '2017-07-15'),
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
('aaa01', null, 'sss01', null, '가입을 축하합니다', 1, '2017-05-01 17:00:00'),
('aaa01', 1, 'sss01', null, '국어과제 마감기한 2017-07-31까지 입니다', 1, current_timestamp),
('aaa01', 1, 'sss01', null, '내일은 휴강입니다', 0, current_timestamp),
('aaa01', null, 'sss02', null, '가입을 축하합니다', 0, current_timestamp),
('aaa01', null, null, 'sp01', '가입을 축하합니다', 1, current_timestamp);

-- --------------------------
-- 1. 결석
select a.s_id, a.at_no a1_no, a2.at_no a2_no, a.the_time a1_time, a2.the_time a2_time, a.as_no a1_as_no, a2.as_no a2_as_no from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no <> a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 1;

-- 2. 등원하원
select count(a.at_no) from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 2 and a2.as_no = 5; 

-- 3. 등원조퇴
select count(a.at_no) from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 2 and a2.as_no = 4; 

-- 4. 지각 하원
select count(a.at_no) from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 3 and a2.as_no = 5; 

-- 5. 지각 조퇴
select count(a.at_no) from attendance a 
left outer join attendance a2 on Date(a.the_time) = Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id
where a.s_id ='sss01' and a.as_no= 3 and a2.as_no = 4; 


-- --------------------

where a.as_no = 2 and a2.as_no = 4 ;
Date(a.the_time) in
	(select Date(a2.the_time) from attendance a2);
	
	select count(a.at_no) from attendance a left outer join attendance a2 on Date(a.the_time) = 
Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id WHERE a.s_id = 'sss01' and a.as_no= 
1 and a.as_no= 3 and a2.as_no = 4 ;

select count(a.at_no) from attendance a left outer join attendance a2 on Date(a.the_time) = 
Date(a2.the_time) and a.at_no != a2.at_no and a.s_id = a2.s_id WHERE a.s_id = 'sss01' and a.as_no= 
1 and a.as_no= 3 and a2.as_no = 4;

 SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201707 and cr.rs_no =1;

SELECT m.*, t.t_name FROM message m inner join teacher t on t.t_id = m.t_id WHERE m.s_id = 
'sss01' and m.is_del = 0 order by m.is_checked, m.reg_date desc;


select count(c_no) from course  c              WHERE c.is_canceled=0;

 select count(c_no)  from course c    where t.t_name like CONCAT('%','김','%')         and c.is_canceled=0
 
 SELECT count(distinct(c.c_no)) FROM course c 
		inner join subject s on c.sb_no = s.sb_no
		inner join teacher t on c.t_id = t.t_id
		inner join student_grade sg on c.gd_no = sg.gd_no
		left outer join timetable ttt on ttt.c_no = c.c_no;
		
		SELECT c.*, t.t_name, sg.gd_name, s.sb_name, ttt.* FROM course c 
		inner join subject s on c.sb_no = s.sb_no
		inner join teacher t on c.t_id = t.t_id
		inner join student_grade sg on c.gd_no = sg.gd_no
		left outer join timetable ttt on ttt.c_no = c.c_no;
		
		SELECT m.*, t.t_name, p.sp_name, s.s_name FROM message m
		inner join teacher t on t.t_id = m.t_id
		left outer join student s on s.s_id = m.s_id
		left outer join parents p on p.sp_id = m.sp_id;
		
		SELECT cr.*, c.c_name, ttt.*, t.t_name, sb.sb_no, sb.sb_name FROM course c inner join subject 
sb on sb.sb_no = c.sb_no inner join teacher t on t.t_id = c.t_id inner join course_register 
cr on cr.reg_c_no = c.c_no inner join timetable ttt on ttt.c_no = cr.reg_c_no WHERE t.t_id 
='aaa01' and cr.reg_month =201706 and cr.rs_no =1 
group by cr.reg_c_no, ttt.tt_day;

select ifnull((select 1 from attendance a2 
					where a2.s_id='sss03' 
					and date(a2.the_time)=current_date
					and a2.as_no between 4 and 5),0);
					
		select ifnull((select min(t.tt_starttime) from course_register cr 
	inner join timetable t on cr.reg_c_no = t.c_no
	where t.tt_day = 1 and cr.reg_s_id='sss01' and cr.reg_month = '201707'), 0);
	
	INSERT INTO attendance (s_id, the_time, as_no)
				values('sss03', current_timestamp, if( 
					(select min(t.tt_starttime) from course_register cr 
					inner join timetable t on cr.reg_c_no = t.c_no
					where t.tt_day = 1 and cr.reg_s_id='sss03'
					) > hour(current_time)
				,2,3));
				
				select * from attendance order by at_no desc;
				
				select ifnull((select 1 from attendance a2 
		where a2.s_id='sss03' and date(a2.the_time)=current_date 
				and a2.as_no between 2 and 3),0);

					
				
				INSERT INTO edu_manager.student
(s_id, s_password, s_name, s_phone, tm_no, school, gd_no, join_date, s_picture)
VALUES('sss03', 'sss03', '삼학생', '01077777777', 3, '삼학고등학교', 10, now(), '');

select ifnull((select 1 from attendance a2 
		where a2.s_id='sss02' and date(a2.the_time)=current_date and a2.as_no between 2 and 3),0); 
		
		select ifnull((select 1 from attendance a2 where a2.s_id='sss02' and date(a2.the_time)=current_date 
and a2.as_no between 2 and 3 ,0) ;

INSERT INTO attendance (s_id, the_time, as_no)
				values ('sss03', current_timestamp, if( 
					(select max(t.tt_endtime) from course_register cr 
					inner join timetable t on cr.reg_c_no = t.c_no
					where t.tt_day = 1 and cr.reg_s_id='sss03'
					) > hour(current_time)
				,4,5))	;
				select if( 
					(select min(t.tt_starttime) from course_register cr 
					inner join timetable t on cr.reg_c_no = t.c_no
					where t.tt_day = 1 and cr.reg_s_id='sss02'
					) > hour(current_time),2,3);
				select if( 
					(select max(t.tt_endtime) from course_register cr 
					inner join timetable t on cr.reg_c_no = t.c_no
					where t.tt_day = 1 and cr.reg_s_id='sss04'
					) > hour(current_time),4,5);

select max(t.tt_endtime) from course_register cr 
					inner join timetable t on cr.reg_c_no = t.c_no
					where t.tt_day = 1 and cr.reg_s_id='sss04';
					
					
select 1 exists (
	if())
);

-- 일치하는 요일 있으면 숫자 아니면 -1
select ifnull((select tt1.tt_day from timetable tt1 where c_no = 10 and tt1.tt_day in (select tt2.tt_day from timetable tt2 where c_no = 4)), -1); -- 일치하는 요일
select ifnull((select tt1.tt_day from timetable tt1 where c_no = #{firstCNo} and tt1.tt_day in (select tt2.tt_day from timetable tt2 where c_no = #{lastCNo})), -1)

-- 1. 시작시간 겹치는지
select ifnull(
(select tt1.tt_starttime from timetable tt1 
where c_no = 10 and tt1.tt_day = 6 and tt1.tt_starttime = (select tt2.tt_day from timetable tt2 where c_no = 4 and tt2.tt_day= 6)),-1);

select ifnull(
(select tt1.tt_starttime from timetable tt1 
where c_no = #{firstCNo} and tt1.tt_day = #{ttDay} and tt1.tt_starttime = (select tt2.tt_day from timetable tt2 where c_no = #{lastCNo} and tt2.tt_day= #{ttDay})),-1);

-- 2. 시작시간이 사이// 겹치면 시간 아니면 -1
select ifnull(
(select tt1.tt_starttime from timetable tt1 
where c_no = 10 and tt1.tt_day = 6 and tt1.tt_starttime 
		between (select tt2.tt_starttime from timetable tt2 where c_no = 4 and tt2.tt_day= 6)
		and (select tt2.tt_endtime from timetable tt2 where c_no = 4 and tt2.tt_day= 6)
		), -1);
		
		select tt2.tt_starttime from timetable tt2 where c_no = 4 and tt2.tt_day= 6;
select ifnull(
(select tt1.tt_starttime from timetable tt1 
where c_no = #{firstCNo} and tt1.tt_day = #{ttDay} and tt1.tt_starttime 
		between (select tt2.tt_starttime from timetable tt2 where c_no = #{lastCNo} and tt2.tt_day= #{ttDay})
		and (select tt2.tt_endtime from timetable tt2 where c_no = #{lastCNo} and tt2.tt_day= #{ttDay})
		), -1)

-- 3. 끝 시간이 사이// 겹치면 시간 아니면 -1
select ifnull(
(select tt1.tt_endtime from timetable tt1 where c_no = 10 and tt1.tt_day = 6 and tt1.tt_endtime between (select tt2.tt_starttime from timetable tt2 where c_no = 4 and tt2.tt_day= 6)
and (select tt2.tt_endtime from timetable tt2 where c_no = 4 and tt2.tt_day= 6)), -1);

select ifnull(
(select tt1.tt_endtime from timetable tt1 where c_no = #{firstCNo} and tt1.tt_day = #{ttDay} and tt1.tt_endtime 
between (select tt2.tt_starttime from timetable tt2 where c_no = #{lastCNo} and tt2.tt_day= #{ttDay})
and (select tt2.tt_endtime from timetable tt2 where c_no = #{lastCNo} and tt2.tt_day= #{ttDay})), -1)
