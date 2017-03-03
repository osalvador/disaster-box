DROP PACKAGE TAPIGEN.TAPIWEB
/

CREATE OR REPLACE PACKAGE TAPIGEN.tapiweb
AS
   FUNCTION create_tapi (p_tablename       VARCHAR2
                       , p_columns         VARCHAR2
                       , p_primary         VARCHAR2
                       , p_createdby       VARCHAR2
                       , p_createddate     VARCHAR2
                       , p_modifiedby      VARCHAR2
                       , p_modifieddate    VARCHAR2
                       , p_logger          VARCHAR2
                       , p_userdate        VARCHAR2)
      RETURN CLOB;
END;
/


