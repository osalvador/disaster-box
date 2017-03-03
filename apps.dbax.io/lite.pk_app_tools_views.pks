DROP PACKAGE LITE.PK_APP_TOOLS_VIEWS
/

CREATE OR REPLACE PACKAGE LITE.pk_app_tools_views
AS
   /**
    * LAYOUTs
    */
   FUNCTION layout
      RETURN CLOB;

   FUNCTION assets
      RETURN CLOB;

   FUNCTION main_header
      RETURN CLOB;

   FUNCTION left_column
      RETURN CLOB;

   FUNCTION footer
      RETURN CLOB;

   FUNCTION scripts
      RETURN CLOB;

   /**
    * HOME
    */
   FUNCTION home
      RETURN CLOB;

   /**
    * Examples
    */
   FUNCTION hello_world
      RETURN CLOB;

   FUNCTION greeting
      RETURN CLOB;

   /**
   * TOOLS
   */
   FUNCTION tapigen2
      RETURN CLOB;      
      
   FUNCTION tapigen2_result
      RETURN CLOB;      
END;
/


