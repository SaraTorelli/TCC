CREATE TABLE MATERIA (
  ID_MATERIA INT   NOT NULL ,
  NOME_MATERIA VARCHAR(30)      ,
PRIMARY KEY(ID_MATERIA));




CREATE TABLE HORARIO (
  ID_HORARIO INT   NOT NULL ,
  DATA_INICIAL DATE    ,
  STATUS_HORARIO CHAR(1)      ,
PRIMARY KEY(ID_HORARIO));




CREATE TABLE CURSO (
  ID_CURSO INT   NOT NULL ,
  NOME_CURSO VARCHAR(30)      ,
PRIMARY KEY(ID_CURSO));




CREATE TABLE ADM (
  COD_ADM INT   NOT NULL ,
  NOME_ADM VARCHAR(50)    ,
  FOTO_ADM VARCHAR(50)    ,
  CPF_ADM CHAR(11)    ,
  RG_ADM CHAR(7)    ,
  EMAIL_ADM VARCHAR(50)    ,
  SEXO_ADM CHAR(1)      ,
PRIMARY KEY(COD_ADM));




CREATE TABLE ALUNO (
  RM INT   NOT NULL ,
  NOME_ALUNO VARCHAR(50)    ,
  FOTO_ALUNO VARCHAR(50)    ,
  CPF_ALUNO CHAR(11)    ,
  RG_ALUNO CHAR(7)    ,
  EMAIL_ALUNO VARCHAR(50)    ,
  SEXO CHAR(1)      ,
PRIMARY KEY(RM));




CREATE TABLE LOGIN_ALUNO (
  ID_LOGIN_ALUNO INT   NOT NULL ,
  ALUNO_RM INT   NOT NULL ,
  NIVEL_ACESSO CHAR(1)    ,
  STATUS_LOGIN CHAR(1)    ,
  USUARIO_ALUNO VARCHAR(30)    ,
  SENHA_ALUNO VARCHAR(30)      ,
PRIMARY KEY(ID_LOGIN_ALUNO),
  FOREIGN KEY(ALUNO_RM)
    REFERENCES ALUNO(RM));


CREATE INDEX IFK_LOGIN_ALUNO ON LOGIN_ALUNO (ALUNO_RM);


CREATE TABLE LOGIN_ADM (
  ID_LOGIN_ADM INT   NOT NULL ,
  ADM_COD_ADM INT   NOT NULL ,
  NIVEL_ACESSO CHAR(1)    ,
  STATUS_LOGIN CHAR(1)    ,
  USUARIO_ADM VARCHAR(30)    ,
  SENHA_ADM VARCHAR(30)      ,
PRIMARY KEY(ID_LOGIN_ADM),
  FOREIGN KEY(ADM_COD_ADM)
    REFERENCES ADM(COD_ADM));


CREATE INDEX IFK_LOGIN_ADM ON LOGIN_ADM (ADM_COD_ADM);


CREATE TABLE REPORT_ERRO_ADM (
  ID_ERRO_ADM INT   NOT NULL ,
  ADM_COD_ADM INT   NOT NULL ,
  TIT_ERRO_ADM VARCHAR(30)    ,
  DESCRI_ERRO_ADM VARCHAR(300)    ,
  DATA_ERRO_ADM DATE      ,
PRIMARY KEY(ID_ERRO_ADM),
  FOREIGN KEY(ADM_COD_ADM)
    REFERENCES ADM(COD_ADM));


CREATE INDEX IFK_ERRO_ADM ON REPORT_ERRO_ADM (ADM_COD_ADM);


CREATE TABLE AVISOS_ADM_PROF (
  ID_AVISO_PROF INT   NOT NULL ,
  ADM_COD_ADM INT   NOT NULL ,
  TIT_AVISO_PROF VARCHAR(30)    ,
  DESCRI_AVISO_PROF VARCHAR(300)    ,
  DATA_AVISO_PROF DATE      ,
PRIMARY KEY(ID_AVISO_PROF),
  FOREIGN KEY(ADM_COD_ADM)
    REFERENCES ADM(COD_ADM));


CREATE INDEX IFK_AVISOS_ADM_PROF ON AVISOS_ADM_PROF (ADM_COD_ADM);


CREATE TABLE AVISOS_ADM_TURMA (
  ID_AVISOS_ADM_TURMA INT   NOT NULL ,
  ADM_COD_ADM INT   NOT NULL ,
  TIT_AVISO_TURMA VARCHAR(30)    ,
  DESCRI_AVISO_TURMA VARCHAR(300)    ,
  DATA_AVISO_TURMA DATE      ,
PRIMARY KEY(ID_AVISOS_ADM_TURMA),
  FOREIGN KEY(ADM_COD_ADM)
    REFERENCES ADM(COD_ADM));


CREATE INDEX IFK_AVISOS_ADM_TURMA ON AVISOS_ADM_TURMA (ADM_COD_ADM);


CREATE TABLE REPORT_ERRO_ALUNO (
  ID_ERRO_ALUNO INT   NOT NULL ,
  ALUNO_RM INT   NOT NULL ,
  TIT_ERRO_ALUNO VARCHAR(30)    ,
  DESCRI_ERRO_ALUNO VARCHAR(300)    ,
  DATA_ERRO_ALUNO DATE      ,
PRIMARY KEY(ID_ERRO_ALUNO),
  FOREIGN KEY(ALUNO_RM)
    REFERENCES ALUNO(RM));


CREATE INDEX IFK_ERRO_ALUNO ON REPORT_ERRO_ALUNO (ALUNO_RM);


CREATE TABLE CURSO_has_MATERIA (
  CURSO_ID_CURSO INT   NOT NULL ,
  MATERIA_ID_MATERIA INT   NOT NULL   ,
PRIMARY KEY(CURSO_ID_CURSO, MATERIA_ID_MATERIA),
  FOREIGN KEY(CURSO_ID_CURSO)
    REFERENCES CURSO(ID_CURSO),
  FOREIGN KEY(MATERIA_ID_MATERIA)
    REFERENCES MATERIA(ID_MATERIA));


CREATE INDEX IFK_CURSO_MATERIA ON CURSO_has_MATERIA (CURSO_ID_CURSO);
CREATE INDEX IFK_CURSO_MATERIA ON CURSO_has_MATERIA (MATERIA_ID_MATERIA);


CREATE TABLE PROFESSOR (
  COD_PROF INT   NOT NULL ,
  AVISOS_ADM_PROF_ID_AVISO_PROF INT   NOT NULL ,
  NOME_PROF VARCHAR(50)    ,
  FOTO_PROF VARCHAR(50)    ,
  CPF_PROF CHAR(11)    ,
  RG_PROF CHAR(7)    ,
  EMAIL_PROF VARCHAR(50)    ,
  SEXO_PROF CHAR(1)      ,
PRIMARY KEY(COD_PROF),
  FOREIGN KEY(AVISOS_ADM_PROF_ID_AVISO_PROF)
    REFERENCES AVISOS_ADM_PROF(ID_AVISO_PROF));


CREATE INDEX IFK_AVISOS_ADM_PROF ON PROFESSOR (AVISOS_ADM_PROF_ID_AVISO_PROF);


CREATE TABLE LOGIN_PROF (
  ID_LOGIN_PROF INT   NOT NULL ,
  PROFESSOR_COD_PROF INT   NOT NULL ,
  NIVEL_ACESSO CHAR(1)    ,
  STATUS_LOGIN CHAR(1)    ,
  USUARIO_PROF VARCHAR(30)    ,
  SENHA_PROF VARCHAR(30)      ,
PRIMARY KEY(ID_LOGIN_PROF),
  FOREIGN KEY(PROFESSOR_COD_PROF)
    REFERENCES PROFESSOR(COD_PROF));


CREATE INDEX IFK_LOGIN_PROF ON LOGIN_PROF (PROFESSOR_COD_PROF);


CREATE TABLE ATIVIDADES (
  ID_ATIVIDADE INT   NOT NULL ,
  PROFESSOR_COD_PROF INT   NOT NULL ,
  TIT_ATIVIDADE VARCHAR(30)    ,
  DESCRI_ATIVIDADE VARCHAR(300)    ,
  DATA_ENTREGA DATE      ,
PRIMARY KEY(ID_ATIVIDADE),
  FOREIGN KEY(PROFESSOR_COD_PROF)
    REFERENCES PROFESSOR(COD_PROF));


CREATE INDEX IFK_ATIVIDADES ON ATIVIDADES (PROFESSOR_COD_PROF);


CREATE TABLE REPORT_ERRO_PROF (
  ID_ERRO_PROF INT   NOT NULL ,
  PROFESSOR_COD_PROF INT   NOT NULL ,
  TIT_ERRO_PROF VARCHAR(30)    ,
  DESCRI_ERRO_PROF VARCHAR(300)    ,
  DATA_ERRO_PROF DATE      ,
PRIMARY KEY(ID_ERRO_PROF),
  FOREIGN KEY(PROFESSOR_COD_PROF)
    REFERENCES PROFESSOR(COD_PROF));


CREATE INDEX IFK_ERRO_PROF ON REPORT_ERRO_PROF (PROFESSOR_COD_PROF);


CREATE TABLE AVISOS_PROF_TURMA (
  ID_AVISO_PROF_TURMA INTEGER   NOT NULL ,
  PROFESSOR_COD_PROF INT   NOT NULL ,
  TIT_AVISO_PROF_TURMA VARCHAR(30)    ,
  DESCRI_AVISO_PROF_TURMA VARCHAR(300)    ,
  DATA_AVISO_PROF_TURMA DATE      ,
PRIMARY KEY(ID_AVISO_PROF_TURMA),
  FOREIGN KEY(PROFESSOR_COD_PROF)
    REFERENCES PROFESSOR(COD_PROF));


CREATE INDEX IFK_AVISOS_PROF_TURMA ON AVISOS_PROF_TURMA (PROFESSOR_COD_PROF);


CREATE TABLE CURSO_has_MATERIA_has_PROFESSOR (
  CURSO_has_MATERIA_MATERIA_ID_MATERIA INT   NOT NULL ,
  CURSO_has_MATERIA_CURSO_ID_CURSO INT   NOT NULL ,
  PROFESSOR_COD_PROF INT   NOT NULL   ,
PRIMARY KEY(CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_CURSO_ID_CURSO, PROFESSOR_COD_PROF),
  FOREIGN KEY(CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_MATERIA_ID_MATERIA)
    REFERENCES CURSO_has_MATERIA(CURSO_ID_CURSO, MATERIA_ID_MATERIA),
  FOREIGN KEY(PROFESSOR_COD_PROF)
    REFERENCES PROFESSOR(COD_PROF));


CREATE INDEX IFK_PROFESSOR_CURSO_MATERIA ON CURSO_has_MATERIA_has_PROFESSOR (CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_MATERIA_ID_MATERIA);
CREATE INDEX IFK_PROFESSOR_CURSO_MATERIA ON CURSO_has_MATERIA_has_PROFESSOR (PROFESSOR_COD_PROF);


CREATE TABLE TURMA (
  ID_TURMA INT   NOT NULL ,
  ATIVIDADES_ID_ATIVIDADE INT   NOT NULL ,
  AVISOS_PROF_TURMA_ID_AVISO_PROF_TURMA INTEGER   NOT NULL ,
  AVISOS_ADM_TURMA_ID_AVISOS_ADM_TURMA INT   NOT NULL ,
  NOME_TURMA VARCHAR(30)    ,
  ANO_TURMA INT      ,
PRIMARY KEY(ID_TURMA),
  FOREIGN KEY(AVISOS_ADM_TURMA_ID_AVISOS_ADM_TURMA)
    REFERENCES AVISOS_ADM_TURMA(ID_AVISOS_ADM_TURMA),
  FOREIGN KEY(AVISOS_PROF_TURMA_ID_AVISO_PROF_TURMA)
    REFERENCES AVISOS_PROF_TURMA(ID_AVISO_PROF_TURMA),
  FOREIGN KEY(ATIVIDADES_ID_ATIVIDADE)
    REFERENCES ATIVIDADES(ID_ATIVIDADE));


CREATE INDEX IFK_AVISOS_ADM_TURMA ON TURMA (AVISOS_ADM_TURMA_ID_AVISOS_ADM_TURMA);
CREATE INDEX IFK_AVISOS_PROF_TURMA ON TURMA (AVISOS_PROF_TURMA_ID_AVISO_PROF_TURMA);
CREATE INDEX IFK_ATIVIDADES ON TURMA (ATIVIDADES_ID_ATIVIDADE);


CREATE TABLE ALUNO_has_TURMA (
  ALUNO_RM INT   NOT NULL ,
  TURMA_ID_TURMA INT   NOT NULL   ,
PRIMARY KEY(ALUNO_RM, TURMA_ID_TURMA),
  FOREIGN KEY(ALUNO_RM)
    REFERENCES ALUNO(RM),
  FOREIGN KEY(TURMA_ID_TURMA)
    REFERENCES TURMA(ID_TURMA));


CREATE INDEX IFK_ALUNO_TURMA ON ALUNO_has_TURMA (ALUNO_RM);
CREATE INDEX IFK_ALUNO_TURMA ON ALUNO_has_TURMA (TURMA_ID_TURMA);


CREATE TABLE CURSO_has_MATERIA_has_PROFESSOR_has_TURMA (
  CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA INT   NOT NULL ,
  TURMA_ID_TURMA INT   NOT NULL   ,
PRIMARY KEY(CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, TURMA_ID_TURMA),
  FOREIGN KEY(CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF)
    REFERENCES CURSO_has_MATERIA_has_PROFESSOR(CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_CURSO_ID_CURSO, PROFESSOR_COD_PROF),
  FOREIGN KEY(TURMA_ID_TURMA)
    REFERENCES TURMA(ID_TURMA));


CREATE INDEX IFK_CURSO_MATERIA_PROF_TURMA ON CURSO_has_MATERIA_has_PROFESSOR_has_TURMA (CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF);
CREATE INDEX IFK_CURSO_MATERIA_PROF_TURMA ON CURSO_has_MATERIA_has_PROFESSOR_has_TURMA (TURMA_ID_TURMA);


CREATE TABLE BOLETIM (
  ID_BOLETIM INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF INT   NOT NULL ,
  MEDIA_PERIODO DECIMAL(10,2)    ,
  PERIODO VARCHAR(20)    ,
  PORCENTAGEM_FREQ INTEGER    ,
  QTDE_FALTAS INT      ,
PRIMARY KEY(ID_BOLETIM),
  FOREIGN KEY(CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA)
    REFERENCES CURSO_has_MATERIA_has_PROFESSOR_has_TURMA(CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, TURMA_ID_TURMA));


CREATE INDEX IFK_BOLETIM ON BOLETIM (CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA);


CREATE TABLE BOLETIM_has_ALUNO (
  BOLETIM_ID_BOLETIM INT   NOT NULL ,
  ALUNO_RM INT   NOT NULL   ,
PRIMARY KEY(BOLETIM_ID_BOLETIM, ALUNO_RM),
  FOREIGN KEY(BOLETIM_ID_BOLETIM)
    REFERENCES BOLETIM(ID_BOLETIM),
  FOREIGN KEY(ALUNO_RM)
    REFERENCES ALUNO(RM));


CREATE INDEX IFK_BOLETIM_ALUNO ON BOLETIM_has_ALUNO (BOLETIM_ID_BOLETIM);
CREATE INDEX IFK_BOLETIM_ALUNO ON BOLETIM_has_ALUNO (ALUNO_RM);


CREATE TABLE HORARIOS (
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF INT   NOT NULL ,
  HORARIO_ID_HORARIO INT   NOT NULL ,
  AULA DATETIME    ,
  DIA_SEMANA VARCHAR(20)    ,
  FOREIGN KEY(HORARIO_ID_HORARIO)
    REFERENCES HORARIO(ID_HORARIO),
  FOREIGN KEY(CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA)
    REFERENCES CURSO_has_MATERIA_has_PROFESSOR_has_TURMA(CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, TURMA_ID_TURMA));


CREATE INDEX IFK_HORARIO ON HORARIOS (HORARIO_ID_HORARIO);
CREATE INDEX IFK_HORARIO ON HORARIOS (CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA);


CREATE TABLE CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_has_ALUNO (
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO INT   NOT NULL ,
  CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF INT   NOT NULL ,
  ALUNO_RM INT   NOT NULL ,
  NUM_CHAMADA INT    ,
  PRESEN�A CHAR(1)    ,
  DATA_PRESEN�A DATE      ,
PRIMARY KEY(CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, ALUNO_RM),
  FOREIGN KEY(CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA)
    REFERENCES CURSO_has_MATERIA_has_PROFESSOR_has_TURMA(CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, TURMA_ID_TURMA),
  FOREIGN KEY(ALUNO_RM)
    REFERENCES ALUNO(RM));


CREATE INDEX IFK_CURSO_MATERIA_PROF_MAT_ALU ON CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_has_ALUNO (CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_PROFESSOR_COD_PROF, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_CURSO_ID_CURSO, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_CURSO_has_MATERIA_has_PROFESSOR_CURSO_has_MATERIA_MATERIA_ID_MATERIA, CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_TURMA_ID_TURMA);
CREATE INDEX IFK_CURSO_MATERIA_PROF_MAT_ALU ON CURSO_has_MATERIA_has_PROFESSOR_has_TURMA_has_ALUNO (ALUNO_RM);


CREATE TABLE NOTA (
  ID_NOTA INT   NOT NULL ,
  BOLETIM_ID_BOLETIM INT   NOT NULL ,
  NOME_AVALIACAO VARCHAR(20)    ,
  NOTA DECIMAL(10,2)      ,
PRIMARY KEY(ID_NOTA),
  FOREIGN KEY(BOLETIM_ID_BOLETIM)
    REFERENCES BOLETIM(ID_BOLETIM));


CREATE INDEX IFK_BOLETIM_ NOTA ON NOTA (BOLETIM_ID_BOLETIM);



