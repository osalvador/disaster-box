DROP PACKAGE BODY LITE.PK_APP_TOOLS
/

CREATE OR REPLACE PACKAGE BODY LITE.pk_app_tools
AS
   FUNCTION router
      RETURN CLOB
   AS
      l_return   CLOB;
   BEGIN
      --Resources URL
      view_.data ('resources', 'https://dbax.io/resources/AdminLTE2');

      IF route_.get ('/')
      THEN
         RETURN view_.run (pk_app_tools_views.home (), 'home');
      END IF;

      IF route_.get ('hello')
      THEN
         RETURN view_.run (pk_app_tools_views.hello_world (), 'hello');
      END IF;

      IF route_.get ('greeting')
      THEN
         RETURN view_.run (pk_app_tools_views.greeting (), 'greeting');
      END IF;

      /**
      * Hello world Example
      */
      IF route_.get ('hello-world')
      THEN
         RETURN 'Hello World from dbax';
      END IF;


      /**
      * Greeting Application Example
      */
      IF route_.get ('greeting-app')
      THEN
         RETURN pk_app_greeting.greeting_controller ();
      END IF;

      IF route_.post ('greeting-app')
      THEN
         RETURN pk_app_greeting.user_inputs_controller ();
      END IF;


      /**
      * Tools tapigen2
      */
      IF route_.get ('tapigen2/result')
      THEN
         -- Si no hay datos en la session redirecciono.
         IF session_.has ('tablename')
         THEN
            l_return    :=
               tapigen.tapiweb.create_tapi (session_.pull ('tablename')
                                          , session_.pull ('columns')
                                          , session_.pull ('primaryKey')
                                          , session_.pull ('createdBy')
                                          , session_.pull ('createdDate')
                                          , session_.pull ('modifiedBy')
                                          , session_.pull ('modifiedDate')
                                          , session_.pull ('logger')
                                          , session_.pull ('userdate'));

            view_.data ('l_code', l_return);

            RETURN view_.run (pk_app_tools_views.tapigen2_result (), 'tapigen2_result');
         ELSE
            dbx.set_property ('base_path', 'http://apps.dbax.io');
            dbx.redirect ('/tapigen2');
            RETURN NULL;
         END IF;
      END IF;

      IF route_.get ('tapigen2@1,1,i')
      THEN
         dbx.set_property ('base_path', 'http://apps.dbax.io');

         RETURN view_.run (pk_app_tools_views.tapigen2 (), 'tapigen2');
      END IF;

      IF route_.post ('tapigen2')
      THEN
         --Guardo los datos en la sesion
         session_.set ('tablename', request_.input ('tablename'));
         session_.set ('columns', request_.input ('columns'));
         session_.set ('primaryKey', request_.input ('primaryKey'));
         session_.set ('createdBy', request_.input ('createdBy'));
         session_.set ('createdDate', request_.input ('createdDate'));
         session_.set ('modifiedBy', request_.input ('modifiedBy'));
         session_.set ('modifiedDate', request_.input ('modifiedDate'));
         session_.set ('logger', request_.input ('logger'));
         session_.set ('userdate', request_.input ('userdate'));

         dbx.set_property ('base_path', 'http://apps.dbax.io');
         dbx.redirect ('/tapigen2/result');
         RETURN NULL;
      END IF;


      dbx.set_property ('base_path', 'http://apps.dbax.io');
      dbx.redirect ('/');
   END;
END;
/


