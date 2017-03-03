DROP PACKAGE BODY LITE.PK_APP_HELLO
/

CREATE OR REPLACE PACKAGE BODY LITE.pk_app_hello
AS
   FUNCTION router
      RETURN CLOB
   AS
   BEGIN
      if route_.get ('/')
      then
       return 'Hello World from dbax';
      end if;      
   END;
END;
/


