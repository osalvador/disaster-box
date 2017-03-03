DROP PROCEDURE LITE.TOOLS
/

CREATE OR REPLACE PROCEDURE LITE.tools (name_array    IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr
                                 , value_array   IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr )
AS
   -- Unique application ID Name
   l_appid CONSTANT   VARCHAR2 (100) := 'TOOLS';
BEGIN
   -- Aplication properties
   dbx.set_property('error_style', 'DebugStyle');   
   -- dbax framework kernel 
   dbx.dispatcher (p_appid     => l_appid
                 , name_array  => name_array
                 , value_array => value_array
                 , router      => 'PK_APP_TOOLS.ROUTER');
END tools;
/


