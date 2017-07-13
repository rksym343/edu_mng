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
	t_id        VARCHAR(20)  NOT NULL, -- 담당선생님
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
	is_canceled TINYINT      NULL      -- 폐강여부
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
	s_id        VARCHAR(20) NULL,     -- 학생아이디
	sp_id       VARCHAR(20) NULL,     -- 학부모아이디
	msg_content TEXT        NULL,     -- 메시지내용
	is_checked  TINYINT     NOT NULL  -- 확인여부
);

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT PK_message -- 메시지 기본키
		PRIMARY KEY (
			msg_no -- 메시지번호
		);

-- 선생님
CREATE TABLE edu_manager.teacher (
	t_id       VARCHAR(20)  NOT NULL, -- 선생님아이디
	t_password CHAR(41)     NOT NULL, -- 선생님비밀번호
	t_name     VARCHAR(5)   NOT NULL, -- 선생님성함
	t_phone    VARCHAR(11)  NOT NULL, -- 선생님연락처
	t_subject  INTEGER      NULL,     -- 과목번호
	t_picture  VARCHAR(150) NULL,     -- 선생님사진
	t_memo     TEXT         NULL      -- 선생님특이사항
);

-- 선생님
ALTER TABLE edu_manager.teacher
	ADD CONSTRAINT PK_teacher -- 선생님 기본키
		PRIMARY KEY (
			t_id -- 선생님아이디
		);

-- 학생
CREATE TABLE edu_manager.student (
	s_id         VARCHAR(20)  NOT NULL, -- 학생아이디
	s_password   CHAR(41)     NOT NULL, -- 학생비밀번호
	s_name       VARCHAR(5)   NOT NULL, -- 학생이름
	s_phone      VARCHAR(11)  NOT NULL, -- 학생연락처
	tm_no        INTEGER      NULL,     -- 전송방법번호
	s_school     VARCHAR(10)  NOT NULL, -- 학교
	gd_no        INTEGER(2)   NULL,     -- 학년번호
	s_enrollment TIMESTAMP    NULL,     -- 등록일
	s_picture    VARCHAR(150) NULL,     -- 학생사진
	s_memo       TEXT         NULL,     -- 학생특이사항
	sp_id        VARCHAR(20)  NULL      -- 학부모아이디
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
	sp_phone        VARCHAR(11) NOT NULL, -- 학부모연락처
	tm_no           INTEGER     NOT NULL, -- 전송방법번호
	sp_relationship VARCHAR(10) NULL,     -- 학생관계
	sp_memo         TEXT        NULL      -- 학부모특이사항
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
	s_id     VARCHAR(20)  NOT NULL, -- 학생아이디
	c_no     INTEGER      NOT NULL, -- 강의번호
	ei_no    INTEGER      NOT NULL, -- 평가항목번호
	e_result CHAR(1)      NOT NULL, -- 평가결과
	e_memo   VARCHAR(250) NULL      -- 평가결과상세
);

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT PK_examination -- 학생평가 기본키
		PRIMARY KEY (
			e_no -- 평가번호
		);

-- 출결현황
CREATE TABLE edu_manager.attendance (
	at_no    INTEGER     NOT NULL, -- 출결번호
	s_id     VARCHAR(20) NOT NULL, -- 학생아이디
	in_time  TIMESTAMP   NOT NULL, -- 등원시간
	out_time TIMESTAMP   NULL,     -- 하원시간
	is_delay TINYINT     NULL      -- 지각여부
);

-- 출결현황
ALTER TABLE edu_manager.attendance
	ADD CONSTRAINT PK_attendance -- 출결현황 기본키
		PRIMARY KEY (
			at_no -- 출결번호
		);

-- 강좌시간표
CREATE TABLE edu_manager.timetable (
	c_no         INTEGER NOT NULL, -- 강의번호
	tt_day       INTEGER NOT NULL, -- 요일
	tt_starttime INTEGER NOT NULL, -- 시작시간
	tt_endtime   INTEGER NOT NULL  -- 종료시작
);

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
CREATE TABLE edu_manager.register (
	reg_no        INTEGER     NOT NULL, -- 수강등록번호
	reg_month     INTEGER(6)  NOT NULL, -- 결제월
	reg_s_id      VARCHAR(20) NOT NULL, -- 학생아이디
	reg_c_no      INTEGER     NOT NULL, -- 강의번호
	is_registered TINYINT     NULL      -- 결제여부
);

-- 수강등록
ALTER TABLE edu_manager.register
	ADD CONSTRAINT PK_register -- 수강등록 기본키
		PRIMARY KEY (
			reg_no -- 수강등록번호
		);

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

-- 임시 테이블
CREATE TABLE edu_manager.Temporary (
);

-- 문의게시판
ALTER TABLE edu_manager.qna
	ADD CONSTRAINT FK_qna_TO_qna -- 문의게시판 -> 문의게시판
		FOREIGN KEY (
			qna_no2 -- 부모글번호
		)
		REFERENCES edu_manager.qna ( -- 문의게시판
			qna_no -- 게시글번호
		);

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
		);

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
		);

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_student_TO_message -- 학생 -> 메시지
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 메시지
ALTER TABLE edu_manager.message
	ADD CONSTRAINT FK_parents_TO_message -- 학부모 -> 메시지
		FOREIGN KEY (
			sp_id -- 학부모아이디
		)
		REFERENCES edu_manager.parents ( -- 학부모
			sp_id -- 학부모아이디
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
	ADD CONSTRAINT FK_parents_TO_student -- 학부모 -> 학생
		FOREIGN KEY (
			sp_id -- 학부모아이디
		)
		REFERENCES edu_manager.parents ( -- 학부모
			sp_id -- 학부모아이디
		)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

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

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_student_TO_examination -- 학생 -> 학생평가2
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_course_TO_examination -- 강좌 -> 학생평가
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

-- 학생평가
ALTER TABLE edu_manager.examination
	ADD CONSTRAINT FK_exam_item_TO_examination -- 평가항목 -> 학생평가
		FOREIGN KEY (
			ei_no -- 평가항목번호
		)
		REFERENCES edu_manager.exam_item ( -- 평가항목
			ei_no -- 평가항목번호
		);

-- 출결현황
ALTER TABLE edu_manager.attendance
	ADD CONSTRAINT FK_student_TO_attendance -- 학생 -> 출결현황
		FOREIGN KEY (
			s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 강좌시간표
ALTER TABLE edu_manager.timetable
	ADD CONSTRAINT FK_course_TO_timetable -- 강좌 -> 강좌시간표
		FOREIGN KEY (
			c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

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
ALTER TABLE edu_manager.register
	ADD CONSTRAINT FK_student_TO_register -- 학생 -> 수강등록
		FOREIGN KEY (
			reg_s_id -- 학생아이디
		)
		REFERENCES edu_manager.student ( -- 학생
			s_id -- 학생아이디
		);

-- 수강등록
ALTER TABLE edu_manager.register
	ADD CONSTRAINT FK_course_TO_register -- 강좌 -> 수강등록
		FOREIGN KEY (
			reg_c_no -- 강의번호
		)
		REFERENCES edu_manager.course ( -- 강좌
			c_no -- 강의번호
		);

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