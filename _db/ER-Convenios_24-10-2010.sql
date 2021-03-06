

-- Generated by Oracle SQL Developer Data Modeler 3.0.0.665
--   at:        2011-10-24 10:18:37 COT
--   site:      Oracle Database 10g
--   type:      Oracle Database 10g



DROP TABLE Co_Banco CASCADE CONSTRAINTS 
;
DROP TABLE Co_Ciudad CASCADE CONSTRAINTS 
;
DROP TABLE Co_Convenio CASCADE CONSTRAINTS 
;
DROP TABLE Co_Departamento CASCADE CONSTRAINTS 
;
DROP TABLE Co_Dependencia CASCADE CONSTRAINTS 
;
DROP TABLE Co_DistribucionPresupuestal CASCADE CONSTRAINTS 
;
DROP TABLE Co_EstadoEstudiante CASCADE CONSTRAINTS 
;
DROP TABLE Co_Estudiante CASCADE CONSTRAINTS 
;
DROP TABLE Co_Materia CASCADE CONSTRAINTS 
;
DROP TABLE Co_Pagina CASCADE CONSTRAINTS 
;
DROP TABLE Co_PaginaRol CASCADE CONSTRAINTS 
;
DROP TABLE Co_Pago CASCADE CONSTRAINTS 
;
DROP TABLE Co_Pais CASCADE CONSTRAINTS 
;
DROP TABLE Co_PeriodoAcademico CASCADE CONSTRAINTS 
;
DROP TABLE Co_PlanPagos CASCADE CONSTRAINTS 
;
DROP TABLE Co_PorcentajePagos CASCADE CONSTRAINTS 
;
DROP TABLE Co_Rol CASCADE CONSTRAINTS 
;
DROP TABLE Co_TextoFormatoConvenio CASCADE CONSTRAINTS 
;
DROP TABLE Co_TipoDocumento CASCADE CONSTRAINTS 
;
DROP TABLE Co_TipoLabor CASCADE CONSTRAINTS 
;
DROP TABLE Co_TipoMonitor CASCADE CONSTRAINTS 
;
DROP TABLE Co_TipoMonitorDependencia CASCADE CONSTRAINTS 
;
DROP TABLE Co_Usuario CASCADE CONSTRAINTS 
;
CREATE TABLE Co_Banco 
    ( 
     banco NUMBER  NOT NULL , 
     nombre VARCHAR2 (200 CHAR)  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Banco PKX" ON Co_Banco 
    ( 
     banco ASC 
    ) 
;

ALTER TABLE Co_Banco 
    ADD CONSTRAINT "Banco PK" PRIMARY KEY ( banco ) ;
	
	
CREATE TABLE Co_Ciudad 
    ( 
     ciudad NUMBER  NOT NULL , 
     nombre VARCHAR2 (150 CHAR)  NOT NULL , 
     departamento NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Ciudad PKX" ON Co_Ciudad 
    ( 
     ciudad ASC 
    ) 
;
CREATE INDEX CiudadesDepartamentoX ON Co_Ciudad 
    ( 
     departamento ASC 
    ) 
;

ALTER TABLE Co_Ciudad 
    ADD CONSTRAINT "Ciudad PK" PRIMARY KEY ( ciudad ) ;


CREATE TABLE Co_Convenio 
    ( 
     convenio NUMBER  NOT NULL , 
     fechaInicio DATE  NOT NULL , 
     FechaFin DATE  NOT NULL , 
     estudiante NUMBER  NOT NULL , 
     tipoCuenta VARCHAR2 (50 CHAR)  NOT NULL , 
     numeroCuenta VARCHAR2 (100 CHAR)  NOT NULL , 
     banco NUMBER  NOT NULL , 
     dependencia NUMBER  NOT NULL , 
     tipoMonitor NUMBER  NOT NULL , 
     tipoLabor NUMBER  NOT NULL , 
     periodoAcademico NUMBER  NOT NULL , 
     valorHora NUMBER  NOT NULL , 
     horasSemanales INTEGER  NOT NULL , 
     descripcionInvestigacion VARCHAR2 (4000 CHAR) , 
     estado INTEGER 
    ) 
;


CREATE UNIQUE INDEX "Convenio PKX" ON Co_Convenio 
    ( 
     convenio ASC 
    ) 
;
CREATE INDEX BancoConvenioX ON Co_Convenio 
    ( 
     banco ASC 
    ) 
;
CREATE INDEX ConvenioEstudianteX ON Co_Convenio 
    ( 
     estudiante ASC 
    ) 
;
CREATE INDEX PeriodoAcademicoConvenioX ON Co_Convenio 
    ( 
     periodoAcademico ASC 
    ) 
;
CREATE INDEX TipoLaborConvenioX ON Co_Convenio 
    ( 
     tipoLabor ASC 
    ) 
;
CREATE INDEX TipoMonitorConvenioX ON Co_Convenio 
    ( 
     tipoMonitor ASC 
    ) 
;
CREATE INDEX DependenciaConvenioX ON Co_Convenio 
    ( 
     dependencia ASC 
    ) 
;

ALTER TABLE Co_Convenio 
    ADD CONSTRAINT "Convenio PK" PRIMARY KEY ( convenio ) ;


CREATE TABLE Co_Departamento 
    ( 
     departamento NUMBER  NOT NULL , 
     nombre VARCHAR2 (150)  NOT NULL , 
     pais NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Departamento PKX" ON Co_Departamento 
    ( 
     departamento ASC 
    ) 
;
CREATE INDEX DepartamentosPaisX ON Co_Departamento 
    ( 
     pais ASC 
    ) 
;

ALTER TABLE Co_Departamento 
    ADD CONSTRAINT "Departamento PK" PRIMARY KEY ( departamento ) ;



CREATE TABLE Co_Dependencia 
    ( 
     dependencia NUMBER  NOT NULL , 
     nombre VARCHAR2 (150 CHAR)  NOT NULL , 
     facultad NUMBER 
    ) 
;


CREATE UNIQUE INDEX "DepartamentoAcademico PKX" ON Co_Dependencia 
    ( 
     dependencia ASC 
    ) 
;
CREATE INDEX Dependencia_Dependencia_FKX ON Co_Dependencia 
    ( 
     facultad ASC 
    ) 
;

ALTER TABLE Co_Dependencia 
    ADD CONSTRAINT "DepartamentoAcademico PK" PRIMARY KEY ( dependencia ) ;


CREATE TABLE Co_DistribucionPresupuestal 
    ( 
     distribucionPresupuestal NUMBER  NOT NULL , 
     fondoPresupuestal VARCHAR2 (100 CHAR)  NOT NULL , 
     Porcentaje NUMBER (8,2)  NOT NULL , 
     objetoCosto VARCHAR2 (200 CHAR)  NOT NULL , 
     convenio NUMBER  NOT NULL , 
     tipoObjeto VARCHAR2 (200 CHAR) 
    ) 
;


CREATE UNIQUE INDEX "DistribucionPresupuestal PKX" ON Co_DistribucionPresupuestal 
    ( 
     distribucionPresupuestal ASC 
    ) 
;
CREATE INDEX DistribucionConvenioX ON Co_DistribucionPresupuestal 
    ( 
     convenio ASC 
    ) 
;

ALTER TABLE Co_DistribucionPresupuestal 
    ADD CONSTRAINT "DistribucionPresupuestal PK" PRIMARY KEY ( distribucionPresupuestal ) ;


CREATE TABLE Co_EstadoEstudiante 
    ( 
     estadoEstudiante VARCHAR2 (2 CHAR)  NOT NULL , 
     nombre VARCHAR2 (100 CHAR)  NOT NULL , 
     descripcion VARCHAR2 (1000) 
    ) 
;


CREATE UNIQUE INDEX "EstadoEstudiante PKX" ON Co_EstadoEstudiante 
    ( 
     estadoEstudiante ASC 
    ) 
;

ALTER TABLE Co_EstadoEstudiante 
    ADD CONSTRAINT "EstadoEstudiante PK" PRIMARY KEY ( estadoEstudiante ) ;


CREATE TABLE Co_Estudiante 
    ( 
     estudiante NUMBER  NOT NULL , 
     nombres VARCHAR2 (250 CHAR)  NOT NULL , 
     apellidos VARCHAR2 (250 CHAR)  NOT NULL , 
     direccion VARCHAR2 (250 CHAR)  NOT NULL , 
     telefono VARCHAR2 (50 CHAR)  NOT NULL , 
     email VARCHAR2 (100 CHAR)  NOT NULL , 
     genero VARCHAR2 (1 CHAR)  NOT NULL , 
     lugarExpedicionDocumento VARCHAR2 (100 CHAR)  NOT NULL , 
     codigo VARCHAR2 (150 CHAR)  NOT NULL , 
     documento VARCHAR2 (150 CHAR)  NOT NULL , 
     tipoDocumento NUMBER  NOT NULL , 
     ciudad NUMBER  NOT NULL , 
     estado VARCHAR2 (2 CHAR) 
    ) 
;


CREATE UNIQUE INDEX "Estudiante PKX" ON Co_Estudiante 
    ( 
     estudiante ASC 
    ) 
;
CREATE INDEX CiudadEstudianteX ON Co_Estudiante 
    ( 
     ciudad ASC 
    ) 
;
CREATE INDEX EstadoEstudianteX ON Co_Estudiante 
    ( 
     estado ASC 
    ) 
;
CREATE INDEX TipoDocumentoEstudianteX ON Co_Estudiante 
    ( 
     tipoDocumento ASC 
    ) 
;

ALTER TABLE Co_Estudiante 
    ADD CONSTRAINT "Estudiante PK" PRIMARY KEY ( estudiante ) ;


CREATE TABLE Co_Materia 
    ( 
     materia NUMBER  NOT NULL , 
     curso VARCHAR2 (100 CHAR)  NOT NULL , 
     convenio NUMBER , 
     crn INTEGER  NOT NULL , 
     nombre VARCHAR2 (500 CHAR)  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Materia PKX" ON Co_Materia 
    ( 
     materia ASC 
    ) 
;
CREATE INDEX ConvenioMateriaX ON Co_Materia 
    ( 
     convenio ASC 
    ) 
;

ALTER TABLE Co_Materia 
    ADD CONSTRAINT "Materia PK" PRIMARY KEY ( materia ) ;


CREATE TABLE Co_Pagina 
    ( 
     pagina NUMBER  NOT NULL , 
     url VARCHAR2 (4000 CHAR)  NOT NULL , 
     descripcion VARCHAR2 (1000 CHAR) 
    ) 
;


CREATE UNIQUE INDEX "Pagina PKX" ON Co_Pagina 
    ( 
     pagina ASC 
    ) 
;

ALTER TABLE Co_Pagina 
    ADD CONSTRAINT "Pagina PK" PRIMARY KEY ( pagina ) ;


CREATE TABLE Co_PaginaRol 
    ( 
     rol NUMBER  NOT NULL , 
     pagina NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX PaginaRol__IDXX ON Co_PaginaRol 
    ( 
     rol ASC , 
     pagina ASC 
    ) 
;
CREATE INDEX FK_ASS_12X ON Co_PaginaRol 
    ( 
     rol ASC 
    ) 
;
CREATE INDEX FK_ASS_13X ON Co_PaginaRol 
    ( 
     pagina ASC 
    ) 
;

ALTER TABLE Co_PaginaRol 
    ADD CONSTRAINT PaginaRol__IDX PRIMARY KEY ( rol, pagina ) ;


CREATE TABLE Co_Pago 
    ( 
     pago NUMBER  NOT NULL , 
     valor NUMBER  NOT NULL , 
     convenio NUMBER  NOT NULL , 
     porcentajePagos NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Pago_PKX ON Co_Pago 
    ( 
     pago ASC 
    ) 
;
CREATE INDEX PagoConvenioX ON Co_Pago 
    ( 
     convenio ASC 
    ) 
;
CREATE INDEX PagoPorcentajeX ON Co_Pago 
    ( 
     porcentajePagos ASC 
    ) 
;

ALTER TABLE Co_Pago 
    ADD CONSTRAINT Pago_PK PRIMARY KEY ( pago ) ;


CREATE TABLE Co_Pais 
    ( 
     pais NUMBER  NOT NULL , 
     Nombre VARCHAR2 (150 CHAR)  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Pais PKX" ON Co_Pais 
    ( 
     pais ASC 
    ) 
;

ALTER TABLE Co_Pais 
    ADD CONSTRAINT "Pais PK" PRIMARY KEY ( pais ) ;


CREATE TABLE Co_PeriodoAcademico 
    ( 
     periodoAcademico NUMBER  NOT NULL , 
     fechaInicial DATE  NOT NULL , 
     fechaFinal DATE  NOT NULL , 
     fechaInicialReceso DATE  NOT NULL , 
     fechaFinalReceso DATE  NOT NULL , 
     minimoHoras INTEGER  NOT NULL , 
     maximoHoras INTEGER  NOT NULL , 
     periodoSemestre VARCHAR2 (50 CHAR)  NOT NULL , 
     minimoValorHora NUMBER  NOT NULL , 
     maximoValorHora NUMBER  NOT NULL , 
     fechaLimite DATE 
    ) 
;


CREATE UNIQUE INDEX "PeriodoAcademico PKX" ON Co_PeriodoAcademico 
    ( 
     periodoAcademico ASC 
    ) 
;

ALTER TABLE Co_PeriodoAcademico 
    ADD CONSTRAINT "PeriodoAcademico PK" PRIMARY KEY ( periodoAcademico ) ;


CREATE TABLE Co_PlanPagos 
    ( 
     planPagos NUMBER  NOT NULL , 
     nombre VARCHAR2 (150 CHAR)  NOT NULL , 
     periodoAcademico NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "PlanPagos PKX" ON Co_PlanPagos 
    ( 
     planPagos ASC 
    ) 
;
CREATE INDEX PlanPagosPeriodoAcademicoX ON Co_PlanPagos 
    ( 
     periodoAcademico ASC 
    ) 
;

ALTER TABLE Co_PlanPagos 
    ADD CONSTRAINT "PlanPagos PK" PRIMARY KEY ( planPagos ) ;


CREATE TABLE Co_PorcentajePagos 
    ( 
     porcentajePagos NUMBER  NOT NULL , 
     posicion INTEGER  NOT NULL , 
     porcentaje NUMBER (5,2)  NOT NULL , 
     planPagos NUMBER  NOT NULL , 
     fecha DATE  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX PorcentajePagos_PKX ON Co_PorcentajePagos 
    ( 
     porcentajePagos ASC 
    ) 
;
CREATE INDEX PorcentajesPlanPagosX ON Co_PorcentajePagos 
    ( 
     planPagos ASC 
    ) 
;

ALTER TABLE Co_PorcentajePagos 
    ADD CONSTRAINT PorcentajePagos_PK PRIMARY KEY ( porcentajePagos ) ;


CREATE TABLE Co_Rol 
    ( 
     rol NUMBER  NOT NULL , 
     nombre VARCHAR2 (200 CHAR)  NOT NULL , 
     descripcion VARCHAR2 (1000 CHAR) 
    ) 
;


CREATE UNIQUE INDEX "Rol PKX" ON Co_Rol 
    ( 
     rol ASC 
    ) 
;

ALTER TABLE Co_Rol 
    ADD CONSTRAINT "Rol PK" PRIMARY KEY ( rol ) ;


CREATE TABLE Co_TextoFormatoConvenio 
    ( 
     textoFormatoConvenio NUMBER  NOT NULL , 
     texto VARCHAR2 (4000 CHAR)  NOT NULL , 
     etiqueta VARCHAR2 (50 CHAR)  NOT NULL , 
     periodoAcademico NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "textoFormatoConvenio PKX" ON Co_TextoFormatoConvenio 
    ( 
     textoFormatoConvenio ASC 
    ) 
;
CREATE INDEX textoFormatoPeriodoX ON Co_TextoFormatoConvenio 
    ( 
     periodoAcademico ASC 
    ) 
;

ALTER TABLE Co_TextoFormatoConvenio 
    ADD CONSTRAINT "textoFormatoConvenio PK" PRIMARY KEY ( textoFormatoConvenio ) ;


CREATE TABLE Co_TipoDocumento 
    ( 
     tipoDocumento NUMBER  NOT NULL , 
     nombre VARCHAR2 (100 CHAR)  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Documentos PKX" ON Co_TipoDocumento 
    ( 
     tipoDocumento ASC 
    ) 
;

ALTER TABLE Co_TipoDocumento 
    ADD CONSTRAINT "Documentos PK" PRIMARY KEY ( tipoDocumento ) ;


CREATE TABLE Co_TipoLabor 
    ( 
     tipoLabor NUMBER  NOT NULL , 
     descripcion VARCHAR2 (4000 CHAR)  NOT NULL , 
     labor VARCHAR2 (200 CHAR)  NOT NULL , 
     nombre VARCHAR2 (200 CHAR)  NOT NULL , 
     tipoMonitorDefecto NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "TipoLabor PKX" ON Co_TipoLabor 
    ( 
     tipoLabor ASC 
    ) 
;
CREATE INDEX TipoMonitorTipoLaborX ON Co_TipoLabor 
    ( 
     tipoMonitorDefecto ASC 
    ) 
;

ALTER TABLE Co_TipoLabor 
    ADD CONSTRAINT "TipoLabor PK" PRIMARY KEY ( tipoLabor ) ;


CREATE TABLE Co_TipoMonitor 
    ( 
     tipoMonitor NUMBER  NOT NULL , 
     nombre VARCHAR2 (150 CHAR)  NOT NULL , 
     minimoValorHora NUMBER , 
     maximoValorHora NUMBER 
    ) 
;


CREATE UNIQUE INDEX "TipoMonitor PKX" ON Co_TipoMonitor 
    ( 
     tipoMonitor ASC 
    ) 
;

ALTER TABLE Co_TipoMonitor 
    ADD CONSTRAINT "TipoMonitor PK" PRIMARY KEY ( tipoMonitor ) ;


CREATE TABLE Co_TipoMonitorDependencia 
    ( 
     dependencia NUMBER  NOT NULL , 
     tipoMonitor NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX TipoMonitorDependencia__IDXX ON Co_TipoMonitorDependencia 
    ( 
     dependencia ASC , 
     tipoMonitor ASC 
    ) 
;
CREATE INDEX FK_ASS_23X ON Co_TipoMonitorDependencia 
    ( 
     dependencia ASC 
    ) 
;
CREATE INDEX FK_ASS_24X ON Co_TipoMonitorDependencia 
    ( 
     tipoMonitor ASC 
    ) 
;

ALTER TABLE Co_TipoMonitorDependencia 
    ADD CONSTRAINT TipoMonitorDependencia__IDX PRIMARY KEY ( dependencia, tipoMonitor ) ;


CREATE TABLE Co_Usuario 
    ( 
     usuario NUMBER  NOT NULL , 
     nombreUsuario VARCHAR2 (100)  NOT NULL , 
     contrasena VARCHAR2 (100 CHAR)  NOT NULL , 
     email VARCHAR2 (150 CHAR)  NOT NULL , 
     nombre VARCHAR2 (200) , 
     apellidos VARCHAR2 (200 CHAR)  NOT NULL , 
     direccion VARCHAR2 (250 CHAR)  NOT NULL , 
     rol NUMBER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Usuario PKX" ON Co_Usuario 
    ( 
     usuario ASC 
    ) 
;
CREATE INDEX RolUsuarioX ON Co_Usuario 
    ( 
     rol ASC 
    ) 
;

ALTER TABLE Co_Usuario 
    ADD CONSTRAINT "Usuario PK" PRIMARY KEY ( usuario ) ;



ALTER TABLE Co_Convenio 
    ADD CONSTRAINT BancoConvenio FOREIGN KEY 
    ( 
     banco
    ) 
    REFERENCES Co_Banco 
    ( 
     banco
    ) 
;


ALTER TABLE Co_Estudiante 
    ADD CONSTRAINT CiudadEstudiante FOREIGN KEY 
    ( 
     ciudad
    ) 
    REFERENCES Co_Ciudad 
    ( 
     ciudad
    ) 
;


ALTER TABLE Co_Ciudad 
    ADD CONSTRAINT CiudadesDepartamento FOREIGN KEY 
    ( 
     departamento
    ) 
    REFERENCES Co_Departamento 
    ( 
     departamento
    ) 
;


ALTER TABLE Co_Convenio 
    ADD CONSTRAINT ConvenioEstudiante FOREIGN KEY 
    ( 
     estudiante
    ) 
    REFERENCES Co_Estudiante 
    ( 
     estudiante
    ) 
;


ALTER TABLE Co_Materia 
    ADD CONSTRAINT ConvenioMateria FOREIGN KEY 
    ( 
     convenio
    ) 
    REFERENCES Co_Convenio 
    ( 
     convenio
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE Co_Departamento 
    ADD CONSTRAINT DepartamentosPais FOREIGN KEY 
    ( 
     pais
    ) 
    REFERENCES Co_Pais 
    ( 
     pais
    ) 
;


ALTER TABLE Co_DistribucionPresupuestal 
    ADD CONSTRAINT DistribucionConvenio FOREIGN KEY 
    ( 
     convenio
    ) 
    REFERENCES Co_Convenio 
    ( 
     convenio
    ) 
;


ALTER TABLE Co_Estudiante 
    ADD CONSTRAINT EstadoEstudiante FOREIGN KEY 
    ( 
     estado
    ) 
    REFERENCES Co_EstadoEstudiante 
    ( 
     estadoEstudiante
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE Co_PaginaRol 
    ADD CONSTRAINT FK_ASS_12 FOREIGN KEY 
    ( 
     rol
    ) 
    REFERENCES Co_Rol 
    ( 
     rol
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Co_PaginaRol 
    ADD CONSTRAINT FK_ASS_13 FOREIGN KEY 
    ( 
     pagina
    ) 
    REFERENCES Co_Pagina 
    ( 
     pagina
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Co_TipoMonitorDependencia 
    ADD CONSTRAINT FK_ASS_23 FOREIGN KEY 
    ( 
     dependencia
    ) 
    REFERENCES Co_Dependencia 
    ( 
     dependencia
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Co_TipoMonitorDependencia 
    ADD CONSTRAINT FK_ASS_24 FOREIGN KEY 
    ( 
     tipoMonitor
    ) 
    REFERENCES Co_TipoMonitor 
    ( 
     tipoMonitor
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Co_Pago 
    ADD CONSTRAINT PagoConvenio FOREIGN KEY 
    ( 
     convenio
    ) 
    REFERENCES Co_Convenio 
    ( 
     convenio
    ) 
;


ALTER TABLE Co_Pago 
    ADD CONSTRAINT PagoPorcentaje FOREIGN KEY 
    ( 
     porcentajePagos
    ) 
    REFERENCES Co_PorcentajePagos 
    ( 
     porcentajePagos
    ) 
;


ALTER TABLE Co_Convenio 
    ADD CONSTRAINT PeriodoAcademicoConvenio FOREIGN KEY 
    ( 
     periodoAcademico
    ) 
    REFERENCES Co_PeriodoAcademico 
    ( 
     periodoAcademico
    ) 
;


ALTER TABLE Co_PlanPagos 
    ADD CONSTRAINT PlanPagosPeriodoAcademico FOREIGN KEY 
    ( 
     periodoAcademico
    ) 
    REFERENCES Co_PeriodoAcademico 
    ( 
     periodoAcademico
    ) 
;


ALTER TABLE Co_PorcentajePagos 
    ADD CONSTRAINT PorcentajesPlanPagos FOREIGN KEY 
    ( 
     planPagos
    ) 
    REFERENCES Co_PlanPagos 
    ( 
     planPagos
    ) 
;


ALTER TABLE Co_Usuario 
    ADD CONSTRAINT RolUsuario FOREIGN KEY 
    ( 
     rol
    ) 
    REFERENCES Co_Rol 
    ( 
     rol
    ) 
;


ALTER TABLE Co_Estudiante 
    ADD CONSTRAINT TipoDocumentoEstudiante FOREIGN KEY 
    ( 
     tipoDocumento
    ) 
    REFERENCES Co_TipoDocumento 
    ( 
     tipoDocumento
    ) 
;


ALTER TABLE Co_Convenio 
    ADD CONSTRAINT TipoLaborConvenio FOREIGN KEY 
    ( 
     tipoLabor
    ) 
    REFERENCES Co_TipoLabor 
    ( 
     tipoLabor
    ) 
;


ALTER TABLE Co_Convenio 
    ADD CONSTRAINT TipoMonitorConvenio FOREIGN KEY 
    ( 
     tipoMonitor
    ) 
    REFERENCES Co_TipoMonitor 
    ( 
     tipoMonitor
    ) 
;


ALTER TABLE Co_TipoLabor 
    ADD CONSTRAINT TipoMonitorTipoLabor FOREIGN KEY 
    ( 
     tipoMonitorDefecto
    ) 
    REFERENCES Co_TipoMonitor 
    ( 
     tipoMonitor
    ) 
;


ALTER TABLE Co_Convenio 
    ADD CONSTRAINT DependenciaConvenio FOREIGN KEY 
    ( 
     dependencia
    ) 
    REFERENCES Co_Dependencia 
    ( 
     dependencia
    ) 
;


ALTER TABLE Co_Dependencia 
    ADD CONSTRAINT Dependencia_Dependencia_FK FOREIGN KEY 
    ( 
     facultad
    ) 
    REFERENCES Co_Dependencia 
    ( 
     dependencia
    ) 
;


ALTER TABLE Co_TextoFormatoConvenio 
    ADD CONSTRAINT textoFormatoPeriodo FOREIGN KEY 
    ( 
     periodoAcademico
    ) 
    REFERENCES Co_PeriodoAcademico 
    ( 
     periodoAcademico
    ) 
;

CREATE SEQUENCE co_banco_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_banco_trg
 BEFORE INSERT ON co_banco FOR EACH ROW
BEGIN
   IF :NEW.banco IS NULL THEN
     SELECT co_banco_seq.NEXTVAL INTO :NEW.banco FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_ciudad_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_ciudad_trg
 BEFORE INSERT ON co_ciudad FOR EACH ROW
BEGIN
   IF :NEW.ciudad IS NULL THEN
     SELECT co_ciudad_seq.NEXTVAL INTO :NEW.ciudad FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_convenio_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_convenio_trg
 BEFORE INSERT ON co_convenio FOR EACH ROW
BEGIN
   IF :NEW.convenio IS NULL THEN
     SELECT co_convenio_seq.NEXTVAL INTO :NEW.convenio FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_departamento_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_departamento_trg
 BEFORE INSERT ON co_departamento FOR EACH ROW
BEGIN
   IF :NEW.departamento IS NULL THEN
     SELECT co_departamento_seq.NEXTVAL INTO :NEW.departamento FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_dependencia_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_dependencia_trg
 BEFORE INSERT ON co_dependencia FOR EACH ROW
BEGIN
   IF :NEW.dependencia IS NULL THEN
     SELECT co_dependencia_seq.NEXTVAL INTO :NEW.dependencia FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_distribucionP_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_distribucionP_trg
 BEFORE INSERT ON co_distribucionPresupuestal FOR EACH ROW
BEGIN
   IF :NEW.DistribucionPresupuestal IS NULL THEN
     SELECT co_distribucionP_seq.NEXTVAL INTO :NEW.DistribucionPresupuestal FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_estadoEstudiante_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_estadoEstudiante_trg
 BEFORE INSERT ON co_estadoEstudiante FOR EACH ROW
BEGIN
   IF :NEW.EstadoEstudiante IS NULL THEN
     SELECT co_estadoEstudiante_seq.NEXTVAL INTO :NEW.EstadoEstudiante FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_estudiante_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_estudiante_trg
 BEFORE INSERT ON co_estudiante FOR EACH ROW
BEGIN
   IF :NEW.Estudiante IS NULL THEN
     SELECT co_estudiante_seq.NEXTVAL INTO :NEW.Estudiante FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_materia_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_materia_trg
 BEFORE INSERT ON co_materia FOR EACH ROW
BEGIN
   IF :NEW.materia IS NULL THEN
     SELECT co_materia_seq.NEXTVAL INTO :NEW.materia FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_pagina_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_pagina_trg
 BEFORE INSERT ON co_pagina FOR EACH ROW
BEGIN
   IF :NEW.pagina IS NULL THEN
     SELECT co_pagina_seq.NEXTVAL INTO :NEW.pagina FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_pago_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_pago_trg
 BEFORE INSERT ON co_pago FOR EACH ROW
BEGIN
   IF :NEW.pago IS NULL THEN
     SELECT co_pago_seq.NEXTVAL INTO :NEW.pago FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_pais_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_pais_trg
 BEFORE INSERT ON co_pais FOR EACH ROW
BEGIN
   IF :NEW.pais IS NULL THEN
     SELECT co_pais_seq.NEXTVAL INTO :NEW.pais FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_periodoAcademico_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_periodoAcademico_trg
 BEFORE INSERT ON co_periodoAcademico FOR EACH ROW
BEGIN
   IF :NEW.periodoAcademico IS NULL THEN
     SELECT co_periodoAcademico_seq.NEXTVAL INTO :NEW.periodoAcademico FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_planPagos_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_planPagos_trg
 BEFORE INSERT ON co_planPagos FOR EACH ROW
BEGIN
   IF :NEW.planPagos IS NULL THEN
     SELECT co_planPagos_seq.NEXTVAL INTO :NEW.planPagos FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_porcentajePagos_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_porcentajePagos_trg
 BEFORE INSERT ON co_porcentajePagos FOR EACH ROW
BEGIN
   IF :NEW.porcentajePagos IS NULL THEN
     SELECT co_porcentajePagos_seq.NEXTVAL INTO :NEW.porcentajePagos FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_rol_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_rol_trg
 BEFORE INSERT ON co_rol FOR EACH ROW
BEGIN
   IF :NEW.rol IS NULL THEN
     SELECT co_rol_seq.NEXTVAL INTO :NEW.rol FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_TextoFormatoConvenio_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_TextoFormatoConvenio_trg
 BEFORE INSERT ON co_TextoFormatoConvenio FOR EACH ROW
BEGIN
   IF :NEW.TextoFormatoConvenio IS NULL THEN
     SELECT co_TextoFormatoConvenio_seq.NEXTVAL INTO :NEW.TextoFormatoConvenio FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_TipoDocumento_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_TipoDocumento_trg
 BEFORE INSERT ON co_TipoDocumento FOR EACH ROW
BEGIN
   IF :NEW.TipoDocumento IS NULL THEN
     SELECT co_TipoDocumento_seq.NEXTVAL INTO :NEW.TipoDocumento FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_TipoLabor_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_TipoLabor_trg
 BEFORE INSERT ON co_TipoLabor FOR EACH ROW
BEGIN
   IF :NEW.TipoLabor IS NULL THEN
     SELECT co_TipoLabor_seq.NEXTVAL INTO :NEW.TipoLabor FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_TipoMonitor_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_TipoMonitor_trg
 BEFORE INSERT ON co_TipoMonitor FOR EACH ROW
BEGIN
   IF :NEW.TipoMonitor IS NULL THEN
     SELECT co_TipoMonitor_seq.NEXTVAL INTO :NEW.TipoMonitor FROM DUAL;
   END IF;
END;
/

CREATE SEQUENCE co_Usuario_seq START WITH 100 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER co_Usuario_trg
 BEFORE INSERT ON co_Usuario FOR EACH ROW
BEGIN
   IF :NEW.Usuario IS NULL THEN
     SELECT co_Usuario_seq.NEXTVAL INTO :NEW.Usuario FROM DUAL;
   END IF;
END;
/



















