DROP PACKAGE BODY TAPIGEN.TAPI_H_TAPIGEN
/

CREATE OR REPLACE PACKAGE BODY TAPIGEN.tapi_h_tapigen IS

   /**
   * TAPI_H_TAPIGEN
   * Generated by: tapiGen2 http://apps.dbax.io/tapiGen2 - DO NOT MODIFY!
   * Website: github.com/osalvador/tapiGen2
   * Created On: 23-02-2017
   */


   --GLOBAL_PRIVATE_CURSORS
   --By PK
   CURSOR h_tapigen_cur (
                       p_id IN h_tapigen.id%TYPE
                       )
   IS
      SELECT
            id,
            session_id,
            table_name,
            table_pks,
            table_sql,
            audit_created_by,
            audit_created_date,
            audit_modified_by,
            audit_modified_date,
            logger,
            tapigen_methods,
            error,
            created_by,
            created_date,
            modified_by,
            modified_date,
            tapi_h_tapigen.hash(id),
            ROWID
      FROM h_tapigen
      WHERE
           id = h_tapigen_cur.p_id
      FOR UPDATE;

    --By Rowid
    CURSOR h_tapigen_rowid_cur (p_rowid IN VARCHAR2)
    IS
      SELECT
             id,
             session_id,
             table_name,
             table_pks,
             table_sql,
             audit_created_by,
             audit_created_date,
             audit_modified_by,
             audit_modified_date,
             logger,
             tapigen_methods,
             error,
             created_by,
             created_date,
             modified_by,
             modified_date,
             tapi_h_tapigen.hash(id),
             ROWID
      FROM h_tapigen
      WHERE ROWID = p_rowid
      FOR UPDATE;


    FUNCTION hash (
                  p_id IN h_tapigen.id%TYPE
                  )
      RETURN varchar2
   IS
      l_retval hash_t;
      l_string CLOB;
      l_date_format VARCHAR2(64);
   BEGIN


     --Get actual NLS_DATE_FORMAT
     SELECT   VALUE
       INTO   l_date_format
       FROM   v$nls_parameters
      WHERE   parameter = 'NLS_DATE_FORMAT';

      --Alter session for date columns
      EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT=''YYYY/MM/DD hh24:mi:ss''';

      SELECT
            id||
            session_id||
            table_name||
            table_pks||
            table_sql||
            audit_created_by||
            audit_created_date||
            audit_modified_by||
            audit_modified_date||
            logger||
            tapigen_methods||
            error||
            created_by||
            created_date||
            modified_by||
            modified_date
      INTO l_string
      FROM h_tapigen
      WHERE
           id = hash.p_id
           ;

      --Restore NLS_DATE_FORMAT to default
      EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT=''' || l_date_format|| '''';

      l_retval := DBMS_CRYPTO.hash(l_string, DBMS_CRYPTO.hash_sh1);

      RETURN l_retval;

   END hash;

    FUNCTION hash_rowid (p_rowid IN varchar2)
      RETURN varchar2
   IS
      l_retval hash_t;
      l_string CLOB;
      l_date_format varchar2(64);
   BEGIN

      --Get actual NLS_DATE_FORMAT
      SELECT VALUE INTO l_date_format  FROM v$nls_parameters WHERE parameter ='NLS_DATE_FORMAT';

      --Alter session for date columns
      EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT=''YYYY/MM/DD hh24:mi:ss''';

      SELECT
            id||
            session_id||
            table_name||
            table_pks||
            table_sql||
            audit_created_by||
            audit_created_date||
            audit_modified_by||
            audit_modified_date||
            logger||
            tapigen_methods||
            error||
            created_by||
            created_date||
            modified_by||
            modified_date
      INTO l_string
      FROM h_tapigen
      WHERE  ROWID = hash_rowid.p_rowid;

      --Restore NLS_DATE_FORMAT to default
      EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT=''' || l_date_format|| '''';

      l_retval := DBMS_CRYPTO.hash(l_string, DBMS_CRYPTO.hash_sh1);

      RETURN l_retval;

   END hash_rowid;

   FUNCTION rt (
               p_id IN h_tapigen.id%TYPE
               )
      RETURN h_tapigen_rt 
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN

      SELECT a.*,
             tapi_h_tapigen.hash(id),
             rowid
      INTO l_h_tapigen_rec
      FROM h_tapigen a
      WHERE
           id = rt.p_id
           ;


      RETURN l_h_tapigen_rec;

   END rt;

   FUNCTION rt_for_update (
                          p_id IN h_tapigen.id%TYPE
                          )
      RETURN h_tapigen_rt 
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN


      SELECT a.*,
             tapi_h_tapigen.hash(id),
             rowid
      INTO l_h_tapigen_rec
      FROM h_tapigen a
      WHERE
           id = rt_for_update.p_id
      FOR UPDATE;


      RETURN l_h_tapigen_rec;

   END rt_for_update;

    FUNCTION tt (
                p_id IN h_tapigen.id%TYPE DEFAULT NULL
                )
       RETURN h_tapigen_tt
       PIPELINED
    IS
       l_h_tapigen_rec   h_tapigen_rt;
    BEGIN

       FOR c1 IN (SELECT   a.*, ROWID
                    FROM   h_tapigen a
                   WHERE
                        id = NVL(tt.p_id,id)
                        )
       LOOP
              l_h_tapigen_rec.id := c1.id;
              l_h_tapigen_rec.session_id := c1.session_id;
              l_h_tapigen_rec.table_name := c1.table_name;
              l_h_tapigen_rec.table_pks := c1.table_pks;
              l_h_tapigen_rec.table_sql := c1.table_sql;
              l_h_tapigen_rec.audit_created_by := c1.audit_created_by;
              l_h_tapigen_rec.audit_created_date := c1.audit_created_date;
              l_h_tapigen_rec.audit_modified_by := c1.audit_modified_by;
              l_h_tapigen_rec.audit_modified_date := c1.audit_modified_date;
              l_h_tapigen_rec.logger := c1.logger;
              l_h_tapigen_rec.tapigen_methods := c1.tapigen_methods;
              l_h_tapigen_rec.error := c1.error;
              l_h_tapigen_rec.created_by := c1.created_by;
              l_h_tapigen_rec.created_date := c1.created_date;
              l_h_tapigen_rec.modified_by := c1.modified_by;
              l_h_tapigen_rec.modified_date := c1.modified_date;
              l_h_tapigen_rec.hash := tapi_h_tapigen.hash( c1.id);
              l_h_tapigen_rec.row_id := c1.ROWID;
              PIPE ROW (l_h_tapigen_rec);
       END LOOP;

       RETURN;

    END tt;


    PROCEDURE ins (p_h_tapigen_rec IN OUT h_tapigen_rt)
    IS
        l_rowtype     h_tapigen%ROWTYPE;
        l_user_name   h_tapigen.created_by%TYPE := USER;/*dbax_core.g$username or apex_application.g_user*/
        l_date        h_tapigen.created_date%TYPE := SYSDATE;

    BEGIN

        p_h_tapigen_rec.created_by := l_user_name;
        p_h_tapigen_rec.created_date := l_date;
        p_h_tapigen_rec.modified_by := l_user_name;
        p_h_tapigen_rec.modified_date := l_date;

        l_rowtype.id := ins.p_h_tapigen_rec.id;
        l_rowtype.session_id := ins.p_h_tapigen_rec.session_id;
        l_rowtype.table_name := ins.p_h_tapigen_rec.table_name;
        l_rowtype.table_pks := ins.p_h_tapigen_rec.table_pks;
        l_rowtype.table_sql := ins.p_h_tapigen_rec.table_sql;
        l_rowtype.audit_created_by := ins.p_h_tapigen_rec.audit_created_by;
        l_rowtype.audit_created_date := ins.p_h_tapigen_rec.audit_created_date;
        l_rowtype.audit_modified_by := ins.p_h_tapigen_rec.audit_modified_by;
        l_rowtype.audit_modified_date := ins.p_h_tapigen_rec.audit_modified_date;
        l_rowtype.logger := ins.p_h_tapigen_rec.logger;
        l_rowtype.tapigen_methods := ins.p_h_tapigen_rec.tapigen_methods;
        l_rowtype.error := ins.p_h_tapigen_rec.error;
        l_rowtype.created_by := ins.p_h_tapigen_rec.created_by;
        l_rowtype.created_date := ins.p_h_tapigen_rec.created_date;
        l_rowtype.modified_by := ins.p_h_tapigen_rec.modified_by;
        l_rowtype.modified_date := ins.p_h_tapigen_rec.modified_date;

       INSERT INTO h_tapigen
         VALUES   l_rowtype;


    END ins;

    PROCEDURE upd (
                  p_h_tapigen_rec         IN h_tapigen_rt,
                  p_ignore_nulls         IN boolean := FALSE
                  )
    IS
    BEGIN

       IF NVL (p_ignore_nulls, FALSE)
       THEN
          UPDATE   h_tapigen
             SET id = NVL(p_h_tapigen_rec.id,id),
                session_id = NVL(p_h_tapigen_rec.session_id,session_id),
                table_name = NVL(p_h_tapigen_rec.table_name,table_name),
                table_pks = NVL(p_h_tapigen_rec.table_pks,table_pks),
                table_sql = NVL(p_h_tapigen_rec.table_sql,table_sql),
                audit_created_by = NVL(p_h_tapigen_rec.audit_created_by,audit_created_by),
                audit_created_date = NVL(p_h_tapigen_rec.audit_created_date,audit_created_date),
                audit_modified_by = NVL(p_h_tapigen_rec.audit_modified_by,audit_modified_by),
                audit_modified_date = NVL(p_h_tapigen_rec.audit_modified_date,audit_modified_date),
                logger = NVL(p_h_tapigen_rec.logger,logger),
                tapigen_methods = NVL(p_h_tapigen_rec.tapigen_methods,tapigen_methods),
                error = NVL(p_h_tapigen_rec.error,error),
                modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                modified_date = SYSDATE
           WHERE
                id = upd.p_h_tapigen_rec.id
                ;
       ELSE
          UPDATE   h_tapigen
             SET id = p_h_tapigen_rec.id,
                session_id = p_h_tapigen_rec.session_id,
                table_name = p_h_tapigen_rec.table_name,
                table_pks = p_h_tapigen_rec.table_pks,
                table_sql = p_h_tapigen_rec.table_sql,
                audit_created_by = p_h_tapigen_rec.audit_created_by,
                audit_created_date = p_h_tapigen_rec.audit_created_date,
                audit_modified_by = p_h_tapigen_rec.audit_modified_by,
                audit_modified_date = p_h_tapigen_rec.audit_modified_date,
                logger = p_h_tapigen_rec.logger,
                tapigen_methods = p_h_tapigen_rec.tapigen_methods,
                error = p_h_tapigen_rec.error,
                modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                modified_date = SYSDATE
           WHERE
                id = upd.p_h_tapigen_rec.id
                ;
       END IF;

       IF SQL%ROWCOUNT != 1 THEN RAISE e_upd_failed; END IF;

    EXCEPTION
       WHEN e_upd_failed
       THEN
          raise_application_error (-20000, 'No rows were updated. The update failed.');
    END upd;


    PROCEDURE upd_rowid (
                         p_h_tapigen_rec         IN h_tapigen_rt,
                         p_ignore_nulls         IN boolean := FALSE
                        )
    IS
    BEGIN

       IF NVL (p_ignore_nulls, FALSE)
       THEN
          UPDATE   h_tapigen
             SET id = NVL(p_h_tapigen_rec.id,id),
                session_id = NVL(p_h_tapigen_rec.session_id,session_id),
                table_name = NVL(p_h_tapigen_rec.table_name,table_name),
                table_pks = NVL(p_h_tapigen_rec.table_pks,table_pks),
                table_sql = NVL(p_h_tapigen_rec.table_sql,table_sql),
                audit_created_by = NVL(p_h_tapigen_rec.audit_created_by,audit_created_by),
                audit_created_date = NVL(p_h_tapigen_rec.audit_created_date,audit_created_date),
                audit_modified_by = NVL(p_h_tapigen_rec.audit_modified_by,audit_modified_by),
                audit_modified_date = NVL(p_h_tapigen_rec.audit_modified_date,audit_modified_date),
                logger = NVL(p_h_tapigen_rec.logger,logger),
                tapigen_methods = NVL(p_h_tapigen_rec.tapigen_methods,tapigen_methods),
                error = NVL(p_h_tapigen_rec.error,error),
                modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                modified_date = SYSDATE
           WHERE  ROWID = p_h_tapigen_rec.row_id;
       ELSE
          UPDATE   h_tapigen
             SET id = p_h_tapigen_rec.id,
                session_id = p_h_tapigen_rec.session_id,
                table_name = p_h_tapigen_rec.table_name,
                table_pks = p_h_tapigen_rec.table_pks,
                table_sql = p_h_tapigen_rec.table_sql,
                audit_created_by = p_h_tapigen_rec.audit_created_by,
                audit_created_date = p_h_tapigen_rec.audit_created_date,
                audit_modified_by = p_h_tapigen_rec.audit_modified_by,
                audit_modified_date = p_h_tapigen_rec.audit_modified_date,
                logger = p_h_tapigen_rec.logger,
                tapigen_methods = p_h_tapigen_rec.tapigen_methods,
                error = p_h_tapigen_rec.error,
                modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                modified_date = SYSDATE
           WHERE  ROWID = p_h_tapigen_rec.row_id;
       END IF;

       IF SQL%ROWCOUNT != 1 THEN RAISE e_upd_failed; END IF;

    EXCEPTION
       WHEN e_upd_failed
       THEN
          raise_application_error (-20000, 'No rows were updated. The update failed.');
    END upd_rowid;

   PROCEDURE web_upd (
                  p_h_tapigen_rec         IN h_tapigen_rt,
                  p_ignore_nulls         IN boolean := FALSE
                )
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN

      OPEN h_tapigen_cur(
                             web_upd.p_h_tapigen_rec.id
                        );

      FETCH h_tapigen_cur INTO l_h_tapigen_rec;

      IF h_tapigen_cur%NOTFOUND THEN
         CLOSE h_tapigen_cur;
         RAISE e_row_missing;
      ELSE
         IF p_h_tapigen_rec.hash != l_h_tapigen_rec.hash THEN
            CLOSE h_tapigen_cur;
            RAISE e_ol_check_failed;
         ELSE
            IF NVL(p_ignore_nulls, FALSE)
            THEN

                UPDATE   h_tapigen
                   SET id = NVL(p_h_tapigen_rec.id,id),
                       session_id = NVL(p_h_tapigen_rec.session_id,session_id),
                       table_name = NVL(p_h_tapigen_rec.table_name,table_name),
                       table_pks = NVL(p_h_tapigen_rec.table_pks,table_pks),
                       table_sql = NVL(p_h_tapigen_rec.table_sql,table_sql),
                       audit_created_by = NVL(p_h_tapigen_rec.audit_created_by,audit_created_by),
                       audit_created_date = NVL(p_h_tapigen_rec.audit_created_date,audit_created_date),
                       audit_modified_by = NVL(p_h_tapigen_rec.audit_modified_by,audit_modified_by),
                       audit_modified_date = NVL(p_h_tapigen_rec.audit_modified_date,audit_modified_date),
                       logger = NVL(p_h_tapigen_rec.logger,logger),
                       tapigen_methods = NVL(p_h_tapigen_rec.tapigen_methods,tapigen_methods),
                       error = NVL(p_h_tapigen_rec.error,error),
                       modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                       modified_date = SYSDATE
               WHERE CURRENT OF h_tapigen_cur;
            ELSE
                UPDATE   h_tapigen
                   SET id = p_h_tapigen_rec.id,
                       session_id = p_h_tapigen_rec.session_id,
                       table_name = p_h_tapigen_rec.table_name,
                       table_pks = p_h_tapigen_rec.table_pks,
                       table_sql = p_h_tapigen_rec.table_sql,
                       audit_created_by = p_h_tapigen_rec.audit_created_by,
                       audit_created_date = p_h_tapigen_rec.audit_created_date,
                       audit_modified_by = p_h_tapigen_rec.audit_modified_by,
                       audit_modified_date = p_h_tapigen_rec.audit_modified_date,
                       logger = p_h_tapigen_rec.logger,
                       tapigen_methods = p_h_tapigen_rec.tapigen_methods,
                       error = p_h_tapigen_rec.error,
                       modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                       modified_date = SYSDATE
               WHERE CURRENT OF h_tapigen_cur;
            END IF;

            CLOSE h_tapigen_cur;
         END IF;
      END IF;


   EXCEPTION
     WHEN e_ol_check_failed
     THEN
        raise_application_error (-20000 , 'Current version of data in database has changed since last page refresh.');
     WHEN e_row_missing
     THEN
        raise_application_error (-20000 , 'Update operation failed because the row is no longer in the database.');
   END web_upd;

   PROCEDURE web_upd_rowid (
                            p_h_tapigen_rec    IN h_tapigen_rt,
                            p_ignore_nulls         IN boolean := FALSE
                           )
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN

      OPEN h_tapigen_rowid_cur(web_upd_rowid.p_h_tapigen_rec.row_id);

      FETCH h_tapigen_rowid_cur INTO l_h_tapigen_rec;

      IF h_tapigen_rowid_cur%NOTFOUND THEN
         CLOSE h_tapigen_rowid_cur;
         RAISE e_row_missing;
      ELSE
         IF web_upd_rowid.p_h_tapigen_rec.hash != l_h_tapigen_rec.hash THEN
            CLOSE h_tapigen_rowid_cur;
            RAISE e_ol_check_failed;
         ELSE
            IF NVL(web_upd_rowid.p_ignore_nulls, FALSE)
            THEN
                UPDATE   h_tapigen
                   SET id = NVL(p_h_tapigen_rec.id,id),
                       session_id = NVL(p_h_tapigen_rec.session_id,session_id),
                       table_name = NVL(p_h_tapigen_rec.table_name,table_name),
                       table_pks = NVL(p_h_tapigen_rec.table_pks,table_pks),
                       table_sql = NVL(p_h_tapigen_rec.table_sql,table_sql),
                       audit_created_by = NVL(p_h_tapigen_rec.audit_created_by,audit_created_by),
                       audit_created_date = NVL(p_h_tapigen_rec.audit_created_date,audit_created_date),
                       audit_modified_by = NVL(p_h_tapigen_rec.audit_modified_by,audit_modified_by),
                       audit_modified_date = NVL(p_h_tapigen_rec.audit_modified_date,audit_modified_date),
                       logger = NVL(p_h_tapigen_rec.logger,logger),
                       tapigen_methods = NVL(p_h_tapigen_rec.tapigen_methods,tapigen_methods),
                       error = NVL(p_h_tapigen_rec.error,error),
                       modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                       modified_date = SYSDATE
               WHERE CURRENT OF h_tapigen_rowid_cur;
            ELSE
                UPDATE   h_tapigen
                   SET id = p_h_tapigen_rec.id,
                       session_id = p_h_tapigen_rec.session_id,
                       table_name = p_h_tapigen_rec.table_name,
                       table_pks = p_h_tapigen_rec.table_pks,
                       table_sql = p_h_tapigen_rec.table_sql,
                       audit_created_by = p_h_tapigen_rec.audit_created_by,
                       audit_created_date = p_h_tapigen_rec.audit_created_date,
                       audit_modified_by = p_h_tapigen_rec.audit_modified_by,
                       audit_modified_date = p_h_tapigen_rec.audit_modified_date,
                       logger = p_h_tapigen_rec.logger,
                       tapigen_methods = p_h_tapigen_rec.tapigen_methods,
                       error = p_h_tapigen_rec.error,
                       modified_by = USER /*dbax_core.g$username or apex_application.g_user*/,
                       modified_date = SYSDATE
               WHERE CURRENT OF h_tapigen_rowid_cur;
            END IF;

            CLOSE h_tapigen_rowid_cur;
         END IF;
      END IF;


   EXCEPTION
     WHEN e_ol_check_failed
     THEN
        raise_application_error (-20000 , 'Current version of data in database has changed since last page refresh.');
     WHEN e_row_missing
     THEN
        raise_application_error (-20000 , 'Update operation failed because the row is no longer in the database.');
   END web_upd_rowid;

    PROCEDURE del (
                  p_id IN h_tapigen.id%TYPE
                  )
    IS
    BEGIN

       DELETE FROM   h_tapigen
             WHERE
                  id = del.p_id
                   ;

       IF sql%ROWCOUNT != 1
       THEN
          RAISE e_del_failed;
       END IF;


    EXCEPTION
       WHEN e_del_failed
       THEN
          raise_application_error (-20000, 'No rows were deleted. The delete failed.');
    END del;

    PROCEDURE del_rowid (p_rowid IN varchar2)
    IS
    BEGIN

       DELETE FROM   h_tapigen
             WHERE   ROWID = del_rowid.p_rowid;

       IF sql%ROWCOUNT != 1
       THEN
          RAISE e_del_failed;
       END IF;


    EXCEPTION
       WHEN e_del_failed
       THEN
          raise_application_error (-20000, 'No rows were deleted. The delete failed.');
    END del_rowid;

    PROCEDURE web_del (
                      p_id IN h_tapigen.id%TYPE,
                      p_hash IN varchar2
                      )
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN


      OPEN h_tapigen_cur(
                            web_del.p_id
                            );

      FETCH h_tapigen_cur INTO l_h_tapigen_rec;

      IF h_tapigen_cur%NOTFOUND THEN
         CLOSE h_tapigen_cur;
         RAISE e_row_missing;
      ELSE
         IF web_del.p_hash != l_h_tapigen_rec.hash THEN
            CLOSE h_tapigen_cur;
            RAISE e_ol_check_failed;
         ELSE
            DELETE FROM h_tapigen
            WHERE CURRENT OF h_tapigen_cur;

            CLOSE h_tapigen_cur;
         END IF;
      END IF;



   EXCEPTION
     WHEN e_ol_check_failed
     THEN
        raise_application_error (-20000 , 'Current version of data in database has changed since last page refresh.');
     WHEN e_row_missing
     THEN
        raise_application_error (-20000 , 'Delete operation failed because the row is no longer in the database.');
   END web_del;

   PROCEDURE web_del_rowid (p_rowid IN varchar2, p_hash IN varchar2)
   IS
      l_h_tapigen_rec h_tapigen_rt;
   BEGIN


      OPEN h_tapigen_rowid_cur(web_del_rowid.p_rowid);

      FETCH h_tapigen_rowid_cur INTO l_h_tapigen_rec;

      IF h_tapigen_rowid_cur%NOTFOUND THEN
         CLOSE h_tapigen_rowid_cur;
         RAISE e_row_missing;
      ELSE
         IF web_del_rowid.p_hash != l_h_tapigen_rec.hash THEN
            CLOSE h_tapigen_rowid_cur;
            RAISE e_ol_check_failed;
         ELSE
            DELETE FROM h_tapigen
            WHERE CURRENT OF h_tapigen_rowid_cur;

            CLOSE h_tapigen_rowid_cur;
         END IF;
      END IF;

   EXCEPTION
     WHEN e_ol_check_failed
     THEN
        raise_application_error (-20000 , 'Current version of data in database has changed since last page refresh.');
     WHEN e_row_missing
     THEN
        raise_application_error (-20000 , 'Delete operation failed because the row is no longer in the database.');
   END web_del_rowid;

END tapi_h_tapigen;
/

