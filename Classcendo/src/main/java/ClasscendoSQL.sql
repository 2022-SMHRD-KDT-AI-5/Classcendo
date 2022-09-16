drop table user_info cascade constraints;
drop table student_record_list cascade constraints;
drop table student_record cascade constraints;
drop table analysis_result_list cascade constraints;
drop table student_consulting cascade constraints;
drop table tendency_list cascade constraints;
drop table job_list cascade constraints;
drop table job_tendency cascade constraints;
drop sequence student_record_list_SEQ;
drop sequence job_list_SEQ;
drop sequence student_record_SEQ;
drop sequence tendency_list_SEQ;
drop sequence analysis_result_list_SEQ;
drop sequence student_consulting_SEQ;

CREATE TABLE user_info
(
    user_num         VARCHAR2(30)    NOT NULL, 
    user_pw          VARCHAR2(30)    NOT NULL, 
    user_name        VARCHAR2(20)    NOT NULL, 
    user_email       VARCHAR2(50)    NOT NULL, 
    user_joindate    DATE            NOT NULL, 
    user_type        CHAR(1)         NOT NULL, 
    CONSTRAINT ui_usernum_pk PRIMARY KEY (user_num)
);

CREATE TABLE student_record_list
(
    srl_seq     NUMBER          NOT NULL, 
    user_num    VARCHAR2(30)    NOT NULL, 
    srl_name    VARCHAR2(30)    NOT NULL, 
    CONSTRAINT srl_srlseq_pk PRIMARY KEY (srl_seq),
	CONSTRAINT srl_usernum_fk FOREIGN KEY (user_num) REFERENCES user_info (user_num)
);

CREATE SEQUENCE student_record_list_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE job_list
(
    job_seq          NUMBER           NOT NULL, 
    job_name         VARCHAR2(30)     , 
    relation_dept    VARCHAR2(500)    , 
    relation_cert    VARCHAR2(500)    , 
    CONSTRAINT jl_jobseq_pk PRIMARY KEY (job_seq)
);

CREATE SEQUENCE job_list_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE student_record
(
    sr_seq        NUMBER            NOT NULL, 
    srl_seq       NUMBER            NOT NULL, 
    std_num       NUMBER            , 
    std_name      VARCHAR2(20)      , 
    sr_content    VARCHAR2(2000)    , 
    sr_date       DATE              , 
    CONSTRAINT sr_srseq_pk PRIMARY KEY (sr_seq),
	CONSTRAINT srl_srlseq_fk FOREIGN KEY (srl_seq) REFERENCES student_record_list (srl_seq)
)

CREATE SEQUENCE student_record_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE tendency_list
(
    tendency_seq     NUMBER          NOT NULL, 
    tendency_name    VARCHAR2(30)    NOT NULL, 
    CONSTRAINT tl_tendencyseq_pk PRIMARY KEY (tendency_seq)
)

CREATE SEQUENCE tendency_list_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE analysis_result_list
(
    arl_seq            NUMBER           NOT NULL, 
    sr_seq             NUMBER           NOT NULL, 
    tendency_1_rate    NUMBER(18, 2)    NOT NULL, 
    tendency_2_rate    NUMBER(18, 2)    NOT NULL, 
    tendency_3_rate    NUMBER(18, 2)    NOT NULL, 
    tendency_4_rate    NUMBER(18, 2)    NOT NULL, 
    arl_graph_path     VARCHAR2(500)    NOT NULL, 
    jobs_seq           VARCHAR(200)     NOT NULL, 
    CONSTRAINT arl_arlseq_pk PRIMARY KEY (arl_seq),
	CONSTRAINT arl_srseq_fk FOREIGN KEY (sr_seq) REFERENCES student_record (sr_seq)
)

CREATE SEQUENCE analysis_result_list_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE student_consulting
(
    sc_seq        NUMBER            NOT NULL, 
    sr_seq        NUMBER            NOT NULL, 
    sc_content    VARCHAR2(2000)    NOT NULL, 
    sc_date       DATE              NOT NULL, 
    CONSTRAINT sc_scseq_pk PRIMARY KEY (sc_seq),
	CONSTRAINT sc_srseq_fk FOREIGN KEY (sr_seq) REFERENCES student_record (sr_seq)
)

CREATE SEQUENCE student_consulting_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE job_tendency
(
    job_seq          NUMBER          NOT NULL, 
    tendency_named   VARCHAR2(20)    NOT NULL,
	CONSTRAINT jt_jobseq_fk FOREIGN KEY (job_seq) REFERENCES job_list (job_seq)
)
select * from user_tables