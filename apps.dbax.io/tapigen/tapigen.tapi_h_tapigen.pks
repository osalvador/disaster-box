DROP PACKAGE TAPIGEN.TAPI_H_TAPIGEN
/

CREATE OR REPLACE PACKAGE TAPIGEN.tapi_h_tapigen
IS
   /**
   * TAPI_H_TAPIGEN
   * Generated by: tapiGen2 http://apps.dbax.io/tapiGen2 - DO NOT MODIFY!
   * Website: github.com/osalvador/tapiGen2
   * Created On: 23-02-2017
   */

   --Scalar/Column types
   SUBTYPE hash_t IS varchar2 (40);
   SUBTYPE id IS h_tapigen.id%TYPE;
   SUBTYPE session_id IS h_tapigen.session_id%TYPE;
   SUBTYPE table_name IS h_tapigen.table_name%TYPE;
   SUBTYPE table_pks IS h_tapigen.table_pks%TYPE;
   SUBTYPE table_sql IS h_tapigen.table_sql%TYPE;
   SUBTYPE audit_created_by IS h_tapigen.audit_created_by%TYPE;
   SUBTYPE audit_created_date IS h_tapigen.audit_created_date%TYPE;
   SUBTYPE audit_modified_by IS h_tapigen.audit_modified_by%TYPE;
   SUBTYPE audit_modified_date IS h_tapigen.audit_modified_date%TYPE;
   SUBTYPE logger IS h_tapigen.logger%TYPE;
   SUBTYPE tapigen_methods IS h_tapigen.tapigen_methods%TYPE;
   SUBTYPE error IS h_tapigen.error%TYPE;
   SUBTYPE created_by IS h_tapigen.created_by%TYPE;
   SUBTYPE created_date IS h_tapigen.created_date%TYPE;
   SUBTYPE modified_by IS h_tapigen.modified_by%TYPE;
   SUBTYPE modified_date IS h_tapigen.modified_date%TYPE;

   --Record type
   TYPE h_tapigen_rt
   IS
      RECORD (
            id h_tapigen.id%TYPE,
            session_id h_tapigen.session_id%TYPE,
            table_name h_tapigen.table_name%TYPE,
            table_pks h_tapigen.table_pks%TYPE,
            table_sql h_tapigen.table_sql%TYPE,
            audit_created_by h_tapigen.audit_created_by%TYPE,
            audit_created_date h_tapigen.audit_created_date%TYPE,
            audit_modified_by h_tapigen.audit_modified_by%TYPE,
            audit_modified_date h_tapigen.audit_modified_date%TYPE,
            logger h_tapigen.logger%TYPE,
            tapigen_methods h_tapigen.tapigen_methods%TYPE,
            error h_tapigen.error%TYPE,
            created_by h_tapigen.created_by%TYPE,
            created_date h_tapigen.created_date%TYPE,
            modified_by h_tapigen.modified_by%TYPE,
            modified_date h_tapigen.modified_date%TYPE,
            hash               hash_t,
            row_id            VARCHAR2(64)
      );
   --Collection types (record)
   TYPE h_tapigen_tt IS TABLE OF h_tapigen_rt;

   --Global exceptions
   e_ol_check_failed EXCEPTION; --Optimistic lock check failed
   e_row_missing     EXCEPTION; --The cursor failed to get a row
   e_upd_failed      EXCEPTION; --The update operation failed
   e_del_failed      EXCEPTION; --The delete operation failed

   /**
   * Generates a SHA1 hash for optimistic locking purposes.
   *
   * @param    p_id        must be NOT NULL
   */
   FUNCTION hash (
                  p_id IN h_tapigen.id%TYPE
                 )
    RETURN VARCHAR2;

   /**
   * This function generates a SHA1 hash for optimistic locking purposes.
   * Access directly to the row by rowid
   *
   * @param  p_rowid  must be NOT NULL
   */
   FUNCTION hash_rowid (p_rowid IN varchar2)
   RETURN varchar2;

   /**
   * This is a table encapsulation function designed to retrieve information from the h_tapigen table.
   *
   * @param      p_id      must be NOT NULL
   * @return     h_tapigen Record Type
   */
   FUNCTION rt (
                p_id IN h_tapigen.id%TYPE 
               )
    RETURN h_tapigen_rt ;

   /**
   * This is a table encapsulation function designed to retrieve information
   * from the h_tapigen table while placing a lock on it for a potential
   * update/delete. Do not use this for updates in web based apps, instead use the
   * rt_for_web_update function to get a FOR_WEB_UPDATE_RT record which
   * includes all of the tables columns along with an md5 checksum for use in the
   * web_upd and web_del procedures.
   *
   * @param      p_id      must be NOT NULL
   * @return     h_tapigen Record Type
   */
   FUNCTION rt_for_update (
                          p_id IN h_tapigen.id%TYPE 
                          )
    RETURN h_tapigen_rt ;

   /**
   * This is a table encapsulation function designed to retrieve information from the h_tapigen table.
   * This function return Record Table as PIPELINED Function
   *
   * @param      p_id      must be NOT NULL
   * @return     h_tapigen Table Record Type
   */
   FUNCTION tt (
                p_id IN h_tapigen.id%TYPE DEFAULT NULL
               )
   RETURN h_tapigen_tt
   PIPELINED;

   /**
   * This is a table encapsulation function designed to insert a row into the h_tapigen table.
   *
   * @param      p_h_tapigen_rec       Record Type
   * @return     p_h_tapigen_rec       Record Type
   */
   PROCEDURE ins (p_h_tapigen_rec IN OUT h_tapigen_rt);

   /**
   * This is a table encapsulation function designed to update a row in the h_tapigen table.
   *
   * @param      p_h_tapigen_rec      Record Type
   * @param      p_ignore_nulls      IF TRUE then null values are ignored in the update
   */
   PROCEDURE upd (p_h_tapigen_rec IN h_tapigen_rt, p_ignore_nulls IN boolean := FALSE);

   /**
   * This is a table encapsulation function designed to update a row in the h_tapigen table,
   * access directly to the row by rowid
   *
   * @param      p_h_tapigen_rec      Record Type
   * @param      p_ignore_nulls      IF TRUE then null values are ignored in the update
   */
   PROCEDURE upd_rowid (p_h_tapigen_rec IN h_tapigen_rt, p_ignore_nulls IN boolean := FALSE);

   /**
   * This is a table encapsulation function designed to update a row
   * in the h_tapigen table whith optimistic lock validation
   *
   * @param      p_h_tapigen_rec      Record Type
   * @param      p_ignore_nulls      IF TRUE then null values are ignored in the update
   */
   PROCEDURE web_upd (p_h_tapigen_rec IN h_tapigen_rt, p_ignore_nulls IN boolean := FALSE);

   /**
   * This is a table encapsulation function designed to update a row
   * in the h_tapigen table whith optimistic lock validation
   * access directly to the row by rowid
   *
   * @param      p_h_tapigen_rec      Record Type
   * @param      p_ignore_nulls      IF TRUE then null values are ignored in the update
   */
   PROCEDURE web_upd_rowid (p_h_tapigen_rec IN h_tapigen_rt, p_ignore_nulls IN boolean := FALSE);

   /**
   * This is a table encapsulation function designed to delete a row from the h_tapigen table.
   *
   * @param    p_id        must be NOT NULL
   */
   PROCEDURE del (
                  p_id IN h_tapigen.id%TYPE
                );

   /**
   * This is a table encapsulation function designed to delete a row from the h_tapigen table
   * access directly to the row by rowid
   *
   * @param      p_rowid      must be NOT NULL
   */
    PROCEDURE del_rowid (p_rowid IN VARCHAR2);

   /**
   * This is a table encapsulation function designed to delete a row from the h_tapigen table
   * whith optimistic lock validation
   *
   * @param      p_id      must be NOT NULL
   * @param      p_hash       must be NOT NULL
   */
    PROCEDURE web_del (
                      p_id IN h_tapigen.id%TYPE,
                      p_hash IN varchar2
                      );

   /**
   * This is a table encapsulation function designed to delete a row from the h_tapigen table
   * whith optimistic lock validation, access directly to the row by rowid
   *
   * @param      p_rowid      must be NOT NULL
   * @param      p_hash       must be NOT NULL
   */
    PROCEDURE web_del_rowid (p_rowid IN varchar2, p_hash IN varchar2);

END tapi_h_tapigen;
/


