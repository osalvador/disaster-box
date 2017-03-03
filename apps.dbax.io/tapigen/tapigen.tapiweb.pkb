DROP PACKAGE BODY TAPIGEN.TAPIWEB
/

CREATE OR REPLACE PACKAGE BODY TAPIGEN.tapiweb
AS
   l_tapigen_rt   tapi_h_tapigen.h_tapigen_rt;

   PROCEDURE save_error (p_sqlerrm VARCHAR2)
   AS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      l_tapigen_rt.error := p_sqlerrm;

      tapi_h_tapigen.upd (l_tapigen_rt);
      COMMIT;
   END save_error;

   FUNCTION create_tapi (p_tablename       VARCHAR2
                       , p_columns         VARCHAR2
                       , p_primary         VARCHAR2
                       , p_createdby       VARCHAR2
                       , p_createddate     VARCHAR2
                       , p_modifiedby      VARCHAR2
                       , p_modifieddate    VARCHAR2
                       , p_logger          VARCHAR2
                       , p_userdate        VARCHAR2)
      RETURN CLOB
   AS
      l_sql                VARCHAR2 (32767);
      l_tapi               CLOB;
      l_dummy              VARCHAR2 (200);
      l_raise_exceptions   BOOLEAN := FALSE;
   BEGIN
      --Save data
      l_tapigen_rt.id := h_tapigen_seq.nextval;
      l_tapigen_rt.session_id := lite.session_.getid ();
      l_tapigen_rt.table_name := p_tablename;
      l_tapigen_rt.table_pks := p_primary;

      l_tapigen_rt.audit_created_by := p_createdby;
      l_tapigen_rt.audit_created_date := p_createddate;
      l_tapigen_rt.audit_modified_by := p_modifiedby;
      l_tapigen_rt.audit_modified_date := p_modifieddate;
      l_tapigen_rt.logger := p_logger;

      tapi_h_tapigen.ins (l_tapigen_rt);
      COMMIT;


      /**
      * Validations
      */
      BEGIN
         l_dummy     := sys.dbms_assert.simple_sql_name (p_tablename);
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid table name: ' || sqlerrm);

            RETURN 'Invalid table name: ' || sqlerrm;
      END;

      BEGIN
         l_dummy     := sys.dbms_assert.simple_sql_name (nvl (p_createdby, 'a'));
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid created_by column name: ' || sqlerrm);
            RETURN 'Invalid created_by column name: ' || sqlerrm;
      END;

      BEGIN
         l_dummy     := sys.dbms_assert.simple_sql_name (nvl (p_createddate, 'a'));
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid created_date column name: ' || sqlerrm);
            RETURN 'Invalid created_date column name: ' || sqlerrm;
      END;

      BEGIN
         l_dummy     := sys.dbms_assert.simple_sql_name (nvl (p_modifiedby, 'a'));
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid modified_by column name: ' || sqlerrm);
            RETURN 'Invalid modified_by column name: ' || sqlerrm;
      END;

      BEGIN
         l_dummy     := sys.dbms_assert.simple_sql_name (nvl (p_modifieddate, 'a'));
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid modified_date column name: ' || sqlerrm);
            RETURN 'Invalid modified_date column name: ' || sqlerrm;
      END;

      /**
      * Create table
      */
      l_sql       := 'CREATE TABLE ' || p_tablename || '(' || p_columns || ')';

      l_tapigen_rt.table_sql := l_sql;
      tapi_h_tapigen.upd (l_tapigen_rt);
      COMMIT;

      BEGIN
         EXECUTE IMMEDIATE l_sql;
      EXCEPTION
         WHEN OTHERS
         THEN
            IF sqlcode = -00955
            THEN
               save_error ('Table "' || p_tablename || '" is already used by an existing object');
               RETURN 'Table "' || p_tablename || '" is already used by an existing object';
            ELSE
               save_error ('Invalid Columns Definitions: ' || sqlerrm);
               RETURN 'Invalid Columns Definitions: ' || sqlerrm;
            END IF;
      END;

      /**
      * Creaate primary key
      */
      l_sql       :=
            'ALTER TABLE '
         || p_tablename
         || ' ADD (CONSTRAINT '
         || p_tablename
         || '_PK PRIMARY KEY ('
         || p_primary
         || '))';

      BEGIN
         EXECUTE IMMEDIATE l_sql;
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Invalid Primary Key Columns: ' || sqlerrm);

            EXECUTE IMMEDIATE 'DROP TABLE ' || p_tablename;

            RETURN 'Invalid Primary Key Columns: ' || sqlerrm;
      END;

      /**
      * Create TAPI
      */
      BEGIN
         IF p_logger = 'on'
         THEN
            l_raise_exceptions := TRUE;
         END IF;

         l_tapi      :=
            tapi_gen2.create_tapi_package (p_table_name => p_tablename
                                         --, p_unique_key => p_primary
                                         , p_created_by_col_name => p_createdby
                                         , p_created_date_col_name => p_createddate
                                         , p_modified_by_col_name => p_modifiedby
                                         , p_modified_date_col_name => p_modifieddate
                                         , p_raise_exceptions => l_raise_exceptions
                                         , p_user_date => to_date (p_userdate, 'YYYYMMDD'));
      EXCEPTION
         WHEN OTHERS
         THEN
            save_error ('Error creating TAPI: ' || sqlerrm);

            EXECUTE IMMEDIATE 'DROP TABLE ' || p_tablename;

            RETURN sqlerrm;
      END;

      BEGIN
         EXECUTE IMMEDIATE 'DROP TABLE ' || p_tablename;
      EXCEPTION
         WHEN OTHERS
         THEN
            NULL;
      END;

      RETURN l_tapi;
   EXCEPTION
      WHEN OTHERS
      THEN
         BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE ' || p_tablename;
         EXCEPTION
            WHEN OTHERS
            THEN
               NULL;
         END;

         save_error ('WHEN OTHERS: ' || sqlerrm);

         RETURN sqlerrm;
   END;
END;
/


