-- 학원관리
DROP SCHEMA IF EXISTS edu_manager;

-- 학원관리
CREATE SCHEMA edu_manager;

-- 문의게시판
CREATE TABLE edu_manager.qna (
	qna_no       INTEGER      NOT NULL, -- 게시글번호
	s_id         VARCHAR(20)  NULL,     -- 학생아이디
	sp_id        VARCHAR(20)  NULL,     -- 학부모아이디
	qna_writer   VARCHAR(30)  NULL,     -- 게시자
	qna_title    VARCHAR(100) NULL,     -- 게시글제목
	qna_password CHAR(41)     NULL,     -- 비밀번호
	qna_is_open  TINYINT      NULL,     -- 공개여부
	qna_date     TIMESTAMP    NULL,     -- 등록일
	qna_viewcnt  INTEGER      NULL,     -- 조회수
	qna_level    INTEGER      NULL,     -- 계층단계
	qna_no2      INTEGER      NULL      -- 부모글번호
);

-- 문의게시판
ALTER TABLE edu_manager.qna
	ADD CONSTRAINT PK_qna -- 문의게시판 기본키
		PRIMARY KEY (
			qna_no -- 게시글번호
		);

ALTER TABLE edu_manager.qna
	MODIFY COLUMN qna_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.qna
	AUTO_INCREMENT = 1;

-- 강좌
CREATE TABLE edu_manager.course (
	c_no        INTEGER      NOT NULL, -- 강의번호
	t_id        VARCHAR(20)  NULL,     -- 담당선생님
	gd_no       INTEGER(2)   NULL,     -- 대상학년
	sb_no       INTEGER      NULL,     -- 대상과목
	c_name      VARCHAR(50)  NULL,     -- 강의명
	tuition     INTEGER      NULL,     -- 강의료
	capacity    INTEGER(3)   NULL,     -- 강의인원
	c_startdate DATE         NULL,     -- 강의시작일
	c_enddate   DATE         NULL,     -- 강의종료일
	classroom   VARCHAR(50)  NULL,     -- 강의실
	c_content   TEXT         NULL,     -- 강의세부사항
	c_picture   VARCHAR(150) NULL,     -- 강의이미지
	is_canceled TINYINT      NULL,     -- 폐강여부
	c_version   TINYINT      NULL     DEFAULT 1 -- 현재버전
);

-- 강좌
ALTER TABLE edu_manager.course
	ADD CONSTRAINT PK_course -- 강좌 기본키
		PRIMARY KEY (
			c_no -- 강의번호
		);

ALTER TABLE edu_manager.course
	MODIFY COLUMN c_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.course
	AUTO_INCREMENT = 1;

-- 메시지
CREATE TABLE edu_manager.message (
	msg_no      INTEGER     NOT NULL, -- 메시지번호
	t_id        VARCHAR(20) NULL,     -- 선생님아이디
	c_no        INTEGER     NULL,     -- 강의번호
	s_id        VARCHAR(20) NULL,     -- 학생아이디
	sp_id       VARCHAR(20) NULL,     -- 학부모아이디
	msg_content TEXT        NULL,     -- 메시지내용
	is_checked  TINYINT     NOT NULL, -- 확인여부
	reg_date    TIMESTAMP   NULL      -- 등록일
);

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT PK_message -- 메시지 기본키
		PRIMARY KEY (
			msg_no -- 메시지번호
		);

ALTER TABLE edu_manager.message
	MODIFY COLUMN msg_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.message
	AUTO_INCREMENT = 1;

-- 선생님
CREATE TABLE edu_manager.teacher (
	t_id       VARCHAR(20)  NOT NULL, -- 선생님아이디
	t_password CHAR(41)     NOT NULL, -- 선생님비밀번호
	t_name     VARCHAR(5)   NOT NULL, -- 선생님성함
	t_phone    VARCHAR(14)  NOT NULL, -- 선생님연락처
	t_subject  INTEGER      NULL,     -- 과목번호
	t_picture  VARCHAR(150) NULL      -- 선생님사진
);

-- 선생님
ALTER TABLE edu_manager.teacher
	ADD CONSTRAINT PK_teacher -- 선생님 기본키
		PRIMARY KEY (
			t_id -- 선생님아이디
		);

-- 학생
CREATE TABLE edu_manager.student (
	s_id       VARCHAR(20)  NOT NULL, -- 학생아이디
	s_password CHAR(41)     NOT NULL, -- 학생비밀번호
	s_name     VARCHAR(5)   NOT NULL, -- 학생이름
	s_phone    VARCHAR(14)  NOT NULL, -- 학생연락처
	tm_no      INTEGER      NOT NULL, -- 전송방법번호
	school     VARCHAR(10)  NOT NULL, -- 학교
	gd_no      INTEGER(2)   NULL,     -- 학년번호
	join_date  TIMESTAMP    NULL,     -- 등록일
	s_picture  VARCHAR(150) NULL      -- 학생사진
);

-- 학생
ALTER TABLE edu_manager.student
	ADD CONSTRAINT PK_student -- 학생 기본키
		PRIMARY KEY (
			s_id -- 학생아이디
		);

-- 학부모
CREATE TABLE edu_manager.parents (
	sp_id           VARCHAR(20) NOT NULL, -- 학부모아이디
	sp_password     CHAR(41)    NOT NULL, -- 학부모비밀번호
	sp_name         VARCHAR(5)  NOT NULL, -- 학부모성함
	sp_phone        VARCHAR(14) NOT NULL, -- 학부모연락처
	tm_no           INTEGER     NOT NULL, -- 전송방법번호
	sp_relationship VARCHAR(10) NULL,     -- 학생관계
	s_id            VARCHAR(20) NULL      -- 학생아이디
);

-- 학부모
ALTER TABLE edu_manager.parents
	ADD CONSTRAINT PK_parents -- 학부모 기본키
		PRIMARY KEY (
			sp_id -- 학부모아이디
		);

-- 학생평가
CREATE TABLE edu_manager.examination (
	e_no     INTEGER      NOT NULL, -- 평가번호
	s_id     VARCHAR(20)  NULL,     -- 학생아이디
	c_no     INTEGER      NULL,     -- 강의번호
	ei_no    INTEGER      NULL,     -- 평가항목번호
	e_result INTEGER(3)   NULL,     -- 평가결과
	e_memo   VARCHAR(250) NULL      -- 평가결과상세
);

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT PK_examination -- 학생평가 기본키
		PRIMARY KEY (
			e_no -- 평가번호
		);

ALTER TABLE edu_manager.examination
	MODIFY COLUMN e_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.examination
	AUTO_INCREMENT = 1;

-- 출결현황
CREATE TABLE edu_manager.attendance (
	at_no    INTEGER     NOT NULL, -- 출결번호
	s_id     VARCHAR(20) NULL,     -- 학생아이디
	the_time TIMESTAMP   NULL,     -- 시각
	as_no    TINYINT     NULL      -- 출결상태번호
);

-- 출결현황
ALTER TABLE edu_manager.attendance
	ADD CONSTRAINT PK_attendance -- 출결현황 기본키
		PRIMARY KEY (
			at_no -- 출결번호
		);

ALTER TABLE edu_manager.attendance
	MODIFY COLUMN at_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.attendance
	AUTO_INCREMENT = 1;

-- 강좌시간표
CREATE TABLE edu_manager.timetable (
	tt_no        INT     NOT NULL, -- 시간표번호
	c_no         INTEGER NOT NULL, -- 강의번호
	tt_day       INTEGER NOT NULL, -- 요일
	tt_starttime INTEGER NOT NULL, -- 시작시간
	tt_endtime   INTEGER NOT NULL, -- 종료시작
	tt_version   TINYINT NOT NULL  -- 시간표버전
);

-- 강좌시간표
ALTER TABLE edu_manager.timetable
	ADD CONSTRAINT PK_timetable -- 강좌시간표 기본키
		PRIMARY KEY (
			tt_no -- 시간표번호
		);

ALTER TABLE edu_manager.timetable
	MODIFY COLUMN tt_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.timetable
	AUTO_INCREMENT = 1;

-- 문의게시판상세
CREATE TABLE edu_manager.qna_detail (
	qna_no      INTEGER NOT NULL, -- 게시글번호
	qna_content TEXT    NULL      -- 게시글내용
);

-- 문의게시판상세
ALTER TABLE edu_manager.qna_detail
	ADD CONSTRAINT PK_qna_detail -- 문의게시판상세 기본키
		PRIMARY KEY (
			qna_no -- 게시글번호
		);

-- 메시지전송
CREATE TABLE edu_manager.transfer_method (
	tm_no     INTEGER     NOT NULL, -- 전송방법번호
	tm_method VARCHAR(50) NOT NULL  -- 전송방식
);

-- 메시지전송
ALTER TABLE edu_manager.transfer_method
	ADD CONSTRAINT PK_transfer_method -- 메시지전송 기본키
		PRIMARY KEY (
			tm_no -- 전송방법번호
		);

-- 수강등록
CREATE TABLE edu_manager.course_register (
	reg_no    INTEGER     NOT NULL, -- 수강등록번호
	reg_month INTEGER(6)  NOT NULL, -- 결제월
	reg_s_id  VARCHAR(20) NULL,     -- 학생아이디
	reg_c_no  INTEGER     NULL,     -- 강의번호
	rs_no     INT         NULL      -- 등록상태
);

-- 수강등록
ALTER TABLE edu_manager.course_register
	ADD CONSTRAINT PK_course_register -- 수강등록 기본키
		PRIMARY KEY (
			reg_no -- 수강등록번호
		);

ALTER TABLE edu_manager.course_register
	MODIFY COLUMN reg_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.course_register
	AUTO_INCREMENT = 1;

-- 평가항목
CREATE TABLE edu_manager.exam_item (
	ei_no    INTEGER     NOT NULL, -- 평가항목번호
	ei_title VARCHAR(50) NULL      -- 평가항목
);

-- 평가항목
ALTER TABLE edu_manager.exam_item
	ADD CONSTRAINT PK_exam_item -- 평가항목 기본키
		PRIMARY KEY (
			ei_no -- 평가항목번호
		);

ALTER TABLE edu_manager.exam_item
	MODIFY COLUMN ei_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.exam_item
	AUTO_INCREMENT = 1;

-- 공지
CREATE TABLE edu_manager.notice (
	noti_no INTEGER      NOT NULL, -- 공지번호
	t_id    VARCHAR(20)  NOT NULL, -- 선생님아이디
	n_title VARCHAR(100) NOT NULL  -- 공지제목
);

-- 공지
ALTER TABLE edu_manager.notice
	ADD CONSTRAINT PK_notice -- 공지 기본키
		PRIMARY KEY (
			noti_no -- 공지번호
		);

ALTER TABLE edu_manager.notice
	MODIFY COLUMN noti_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.notice
	AUTO_INCREMENT = 1;

-- 공지첨부
CREATE TABLE edu_manager.attachment (
	a_fullname VARCHAR(150) NOT NULL, -- 첨부파일경로
	noti_no    INTEGER      NOT NULL  -- 공지번호
);

-- 공지첨부
ALTER TABLE edu_manager.attachment
	ADD CONSTRAINT PK_attachment -- 공지첨부 기본키
		PRIMARY KEY (
			a_fullname -- 첨부파일경로
		);

-- 공지상세
CREATE TABLE edu_manager.notice_detail (
	noti_no   INTEGER NOT NULL, -- 공지번호
	n_content TEXT    NOT NULL  -- 공지내용
);

-- 공지상세
ALTER TABLE edu_manager.notice_detail
	ADD CONSTRAINT PK_notice_detail -- 공지상세 기본키
		PRIMARY KEY (
			noti_no -- 공지번호
		);

-- 학년
CREATE TABLE edu_manager.student_grade (
	gd_no   INTEGER(2) NOT NULL, -- 학년번호
	gd_name CHAR(2)    NOT NULL  -- 학년이름
);

-- 학년
ALTER TABLE edu_manager.student_grade
	ADD CONSTRAINT PK_student_grade -- 학년 기본키
		PRIMARY KEY (
			gd_no -- 학년번호
		);

ALTER TABLE edu_manager.student_grade
	MODIFY COLUMN gd_no INTEGER(2) NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.student_grade
	AUTO_INCREMENT = 1;

-- 과목
CREATE TABLE edu_manager.subject (
	sb_no     INTEGER     NOT NULL, -- 과목번호
	sb_name   VARCHAR(10) NOT NULL, -- 과목명
	sb_is_del TINYINT     NOT NULL  -- 삭제여부
);

-- 과목
ALTER TABLE edu_manager.subject
	ADD CONSTRAINT PK_subject -- 과목 기본키
		PRIMARY KEY (
			sb_no -- 과목번호
		);

ALTER TABLE edu_manager.subject
	MODIFY COLUMN sb_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.subject
	AUTO_INCREMENT = 1;

-- 수강등록상태
CREATE TABLE edu_manager.registration_status (
	rs_no  INT         NOT NULL, -- 등록상태번호
	status VARCHAR(10) NULL      -- 등록상태
);

-- 수강등록상태
ALTER TABLE edu_manager.registration_status
	ADD CONSTRAINT PK_registration_status -- 수강등록상태 기본키
		PRIMARY KEY (
			rs_no -- 등록상태번호
		);

-- 수강장바구니
CREATE TABLE edu_manager.cart_courses (
	cc_no     INT         NOT NULL, -- 장바구니번호
	s_id      VARCHAR(20) NOT NULL, -- 학생아이디
	c_no      INTEGER     NOT NULL, -- 강의번호
	cart_date TIMESTAMP   NOT NULL  -- 등록일
);

-- 수강장바구니
ALTER TABLE edu_manager.cart_courses
	ADD CONSTRAINT PK_cart_courses -- 수강장바구니 기본키
		PRIMARY KEY (
			cc_no -- 장바구니번호
		);

ALTER TABLE edu_manager.cart_courses
	MODIFY COLUMN cc_no INT NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.cart_courses
	AUTO_INCREMENT = 1;

-- 출결상태
CREATE TABLE edu_manager.attendance_status (
	as_no     TINYINT     NOT NULL, -- 출결상태번호
	as_status VARCHAR(10) NULL      -- 출결상태
);

-- 출결상태
ALTER TABLE edu_manager.attendance_status
	ADD CONSTRAINT PK_attendance_status -- 출결상태 기본키
		PRIMARY KEY (
			as_no -- 출결상태번호
		);

ALTER TABLE edu_manager.attendance_status
	MODIFY COLUMN as_no TINYINT NOT NULL AUTO_INCREMENT;

ALTER TABLE edu_manager.attendance_status
	AUTO_INCREMENT = 1;

-- 학생특이사항
CREATE TABLE edu_manager.student_memo (
	s_id   VARCHAR(20) NOT NULL, -- 학생아이디
	s_memo TEXT        NULL      -- 학생특이사항
);

-- 학부모특이사항
CREATE TABLE edu_manager.parents_memo (
	sp_id   VARCHAR(20) NOT NULL, -- 학부모아이디
	sp_memo TEXT        NULL      -- 학부모특이사항
);

-- 선생님특이사항
CREATE TABLE edu_manager.teacher_memo (
	t_id   VARCHAR(20) NOT NULL, -- 선생님아이디
	t_memo TEXT        NULL      -- 선생님특이사항
);

-- 문의게시판
ALTER TABLE edu_manager.qna
	ADD CONSTRAINT FK_qna_TO_qna -- 문의게시판 -> 문의게시판
		FOREIGN KEY (
			qna_no2 -- 부모글번호
		)
		REFERENCES edu_manager.qna ( -- 문의게시판
			qna_no -- 게시글번호
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 문의게시판
ALTER TABLE edu_manager.qna
	ADD CONSTRAINT FK_student_TO_qna -- 학생 -> 문의게시판
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 문의게시판
ALTER TABLE edu_manager.qna
	ADD CONSTRAINT FK_parents_TO_qna -- 학부모 -> 문의게시판
		FOREIGN KEY (
			sp_id -- 학부모아이디
		)
		REFERENCES edu_manager.parents ( -- 학부모
			sp_id -- 학부모아이디
		);

-- 강좌
ALTER TABLE edu_manager.course
	ADD CONSTRAINT FK_teacher_TO_course -- 선생님 -> 강좌
		FOREIGN KEY (
			t_id -- 담당선생님
		)
		REFERENCES edu_manager.teacher ( -- 선생님
			t_id -- 선생님아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 강좌
ALTER TABLE edu_manager.course
	ADD CONSTRAINT FK_student_grade_TO_course -- 학년 -> 강좌
		FOREIGN KEY (
			gd_no -- 대상학년
		)
		REFERENCES edu_manager.student_grade ( -- 학년
			gd_no -- 학년번호
		);

-- 강좌
ALTER TABLE edu_manager.course
	ADD CONSTRAINT FK_subject_TO_course -- 과목 -> 강좌
		FOREIGN KEY (
			sb_no -- 대상과목
		)
		REFERENCES edu_manager.subject ( -- 과목
			sb_no -- 과목번호
		);

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_teacher_TO_message -- 선생님 -> 메시지
		FOREIGN KEY (
			t_id -- 선생님아이디
		)
		REFERENCES edu_manager.teacher ( -- 선생님
			t_id -- 선생님아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_student_TO_message -- 학생 -> 메시지
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_parents_TO_message -- 학부모 -> 메시지
		FOREIGN KEY (
			sp_id -- 학부모아이디
		)
		REFERENCES edu_manager.parents ( -- 학부모
			sp_id -- 학부모아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_course_TO_message -- 강좌 -> 메시지
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

-- 선생님
ALTER TABLE edu_manager.teacher
	ADD CONSTRAINT FK_subject_TO_teacher -- 과목 -> 선생님
		FOREIGN KEY (
			t_subject -- 과목번호
		)
		REFERENCES edu_manager.subject ( -- 과목
			sb_no -- 과목번호
		);

-- 학생
ALTER TABLE edu_manager.student
	ADD CONSTRAINT FK_transfer_method_TO_student -- 메시지전송 -> 학생
		FOREIGN KEY (
			tm_no -- 전송방법번호
		)
		REFERENCES edu_manager.transfer_method ( -- 메시지전송
			tm_no -- 전송방법번호
		);

-- 학생
ALTER TABLE edu_manager.student
	ADD CONSTRAINT FK_student_grade_TO_student -- 학년 -> 학생
		FOREIGN KEY (
			gd_no -- 학년번호
		)
		REFERENCES edu_manager.student_grade ( -- 학년
			gd_no -- 학년번호
		);

-- 학부모
ALTER TABLE edu_manager.parents
	ADD CONSTRAINT FK_transfer_method_TO_parents -- 메시지전송 -> 학부모
		FOREIGN KEY (
			tm_no -- 전송방법번호
		)
		REFERENCES edu_manager.transfer_method ( -- 메시지전송
			tm_no -- 전송방법번호
		);

-- 학부모
ALTER TABLE edu_manager.parents
	ADD CONSTRAINT FK_student_TO_parents -- 학생 -> 학부모
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_student_TO_examination -- 학생 -> 학생평가2
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_course_TO_examination -- 강좌 -> 학생평가
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_exam_item_TO_examination -- 평가항목 -> 학생평가
		FOREIGN KEY (
			ei_no -- 평가항목번호
		)
		REFERENCES edu_manager.exam_item ( -- 평가항목
			ei_no -- 평가항목번호
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 출결현황
ALTER TABLE edu_manager.attendance
	ADD CONSTRAINT FK_student_TO_attendance -- 학생 -> 출결현황
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 출결현황
ALTER TABLE edu_manager.attendance
	ADD CONSTRAINT FK_attendance_status_TO_attendance -- 출결상태 -> 출결현황
		FOREIGN KEY (
			as_no -- 출결상태번호
		)
		REFERENCES edu_manager.attendance_status ( -- 출결상태
			as_no -- 출결상태번호
		);

-- 강좌시간표
ALTER TABLE edu_manager.timetable
	ADD CONSTRAINT FK_course_TO_timetable -- 강좌 -> 강좌시간표
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 문의게시판상세
ALTER TABLE edu_manager.qna_detail
	ADD CONSTRAINT FK_qna_TO_qna_detail -- 문의게시판 -> 문의게시판상세
		FOREIGN KEY (
			qna_no -- 게시글번호
		)
		REFERENCES edu_manager.qna ( -- 문의게시판
			qna_no -- 게시글번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 수강등록
ALTER TABLE edu_manager.course_register
	ADD CONSTRAINT FK_student_TO_course_register -- 학생 -> 수강등록
		FOREIGN KEY (
			reg_s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 수강등록
ALTER TABLE edu_manager.course_register
	ADD CONSTRAINT FK_course_TO_course_register -- 강좌 -> 수강등록
		FOREIGN KEY (
			reg_c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

-- 수강등록
ALTER TABLE edu_manager.course_register
	ADD CONSTRAINT FK_registration_status_TO_course_register -- 수강등록상태 -> 수강등록
		FOREIGN KEY (
			rs_no -- 등록상태
		)
		REFERENCES edu_manager.registration_status ( -- 수강등록상태
			rs_no -- 등록상태번호
		)
		ON DELETE SET NULL
		ON UPDATE CASCADE;

-- 공지
ALTER TABLE edu_manager.notice
	ADD CONSTRAINT FK_teacher_TO_notice -- 선생님 -> 공지
		FOREIGN KEY (
			t_id -- 선생님아이디
		)
		REFERENCES edu_manager.teacher ( -- 선생님
			t_id -- 선생님아이디
		);

-- 공지첨부
ALTER TABLE edu_manager.attachment
	ADD CONSTRAINT FK_notice_TO_attachment -- 공지 -> 공지첨부
		FOREIGN KEY (
			noti_no -- 공지번호
		)
		REFERENCES edu_manager.notice ( -- 공지
			noti_no -- 공지번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 공지상세
ALTER TABLE edu_manager.notice_detail
	ADD CONSTRAINT FK_notice_TO_notice_detail -- 공지 -> 공지상세
		FOREIGN KEY (
			noti_no -- 공지번호
		)
		REFERENCES edu_manager.notice ( -- 공지
			noti_no -- 공지번호
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

-- 수강장바구니
ALTER TABLE edu_manager.cart_courses
	ADD CONSTRAINT FK_student_TO_cart_courses -- 학생 -> 수강장바구니
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 수강장바구니
ALTER TABLE edu_manager.cart_courses
	ADD CONSTRAINT FK_course_TO_cart_courses -- 강좌 -> 수강장바구니
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

-- 학생특이사항
ALTER TABLE edu_manager.student_memo
	ADD CONSTRAINT FK_student_TO_student_memo -- 학생 -> 학생특이사항
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 학부모특이사항
ALTER TABLE edu_manager.parents_memo
	ADD CONSTRAINT FK_parents_TO_parents_memo -- 학부모 -> 학부모특이사항
		FOREIGN KEY (
			sp_id -- 학부모아이디
		)
		REFERENCES edu_manager.parents ( -- 학부모
			sp_id -- 학부모아이디
		);

-- 선생님특이사항
ALTER TABLE edu_manager.teacher_memo
	ADD CONSTRAINT FK_teacher_TO_teacher_memo -- 선생님 -> 선생님특이사항
		FOREIGN KEY (
			t_id -- 선생님아이디
		)
		REFERENCES edu_manager.teacher ( -- 선생님
			t_id -- 선생님아이디
		);
-- -------------------------

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


INSERT INTO edu_manager.message (t_id, c_no, s_id, sp_id, msg_content, is_checked, reg_date) values
('aaa01', null, 'sss01', null, '가입을 축하합니다', 1, current_timestamp),
('aaa01', 1, 'sss01', null, '국어과제 마감기한 2017-07-28까지 입니다', 1, current_timestamp),
('aaa01', 1, 'sss01', null, '내일은 휴강입니다', 0, current_timestamp),
('aaa01', null, 'sss02', null, '가입을 축하합니다', 0, current_timestamp),
('aaa01', null, null, 'sp01', '가입을 축하합니다', 1, current_timestamp);


select * from examination;
delete from message where msg_no = 11;

SELECT e.*, ei.ei_title, c.c_name FROM examination e inner join exam_item ei on e.ei_no = ei.ei_no 
inner join course c on c.c_no = e.c_no WHERE e.s_id = 'sss01';

SELECT cr.*, c.c_name, ttt.*, t.t_name FROM course c inner join course_register cr on cr.reg_c_no 
= c.c_no inner join teacher t on t.t_id = c.t_id inner join timetable ttt on ttt.c_no = cr.reg_c_no 
WHERE cr.reg_s_id ='sss01' and cr.reg_month =201703 and cr.rs_no =1 order by ttt.tt_day, ttt.tt_starttime ;

SELECT e.*, ei.ei_title, c.c_name FROM examination e inner join exam_item ei on e.ei_no = ei.ei_no 
inner join course c on c.c_no = e.c_no WHERE e.s_id = 'sss01' and e.e_no =0 ;