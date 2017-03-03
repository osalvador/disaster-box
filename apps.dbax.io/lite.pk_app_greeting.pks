DROP PACKAGE LITE.PK_APP_GREETING
/

CREATE OR REPLACE PACKAGE LITE.pk_app_greeting
AS
   /**
   * Application router
   */
   FUNCTION router
      RETURN CLOB;

   /**
   * Greeting Controller
   */   
   FUNCTION greeting_controller
      RETURN CLOB;

   /**
   * Reretrive user input data and save it in session. 
   */
   FUNCTION user_inputs_controller
      RETURN CLOB;

   /**
   * Greeting View
   */
   FUNCTION greeting_view
      RETURN CLOB;
END;
/


