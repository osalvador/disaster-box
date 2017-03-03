DROP PACKAGE BODY LITE.PK_APP_TOOLS_VIEWS
/

CREATE OR REPLACE PACKAGE BODY LITE.pk_app_tools_views
AS
   FUNCTION assets
      RETURN CLOB
   AS
   BEGIN
      return q'[
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${resources}/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${resources}/dist/css/skins/skin-red.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
   
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/styles/monokai-sublime.min.css">
   
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-74703333-1', 'auto');
        ga('send', 'pageview');
   </script>
   
   
  ]';
   END;

   FUNCTION main_header
      RETURN CLOB
   AS
   BEGIN
      return
q'[<!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="/" class="logo">
      <span class="logo-mini"><b>dbx</b></span>
      <span class="logo-lg"><b>dbax</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li><a href="https://dbax.io"><i class="fa fa-home"></i></a></li>
          <li><a href="https://github.com/osalvador/dbax-lite"><i class="fa fa-github"></i></a></li>
          <li><a href="https://twitter.com/dbaxio"><i class="fa fa-twitter"></i></a></li>
          <li><a href="https://dbax.io/blog"><i class="fa fa-rss"></i></a></li>
        </ul>
      </div>

    </nav>
  </header>]';
  END;

   FUNCTION left_column
      RETURN CLOB
   AS
   BEGIN
      return
q'[<!-- Left side column-->
  <aside class="main-sidebar">

    <section class="sidebar">
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">TOOLS</li>
        <li class="${tapiGen2}"><a href="/tapigen2"><i class="fa fa-superpowers"></i> <span>tapiGen2</span></a></li>
        <!--<li class="${codeGen}"><a href="/codegen"><i class="fa fa-free-code-camp"></i> <span>Code Generator</span></a></li>
        <li class="${tePLSQL}"><a href="/teplsql"><i class="fa fa-themeisle"></i> <span>tePLSQL</span></a></li> -->
        <li class="header">DEMOS</li>
        <li class="${helloWorld}"><a href="/hello"><i class="fa fa-hand-spock-o"></i> <span>Hello World</span></a></li>
        <li class="${greeting}"><a href="/greeting"><i class="fa fa-handshake-o"></i> <span>Greeting</span></a></li>
        <!--<li class="${crud}"><a href="/crud"><i class="fa fa-pencil-square-o"></i> <span>CRUD</span></a></li>
        <li class="${datatable}"><a href="/datatable"><i class="fa fa-table"></i> <span>Datatable</span></a></li>-->
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>]';
  END;

   FUNCTION footer
      RETURN CLOB
   AS
   BEGIN
      return
q'[  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      dbax the PL/SQL Web Framework
    </div>
    <strong>Copyright © 2017 <a href="https://dbax.io">dbax.io</a></strong>
  </footer>]';
  END;

   FUNCTION scripts
      RETURN CLOB
   AS
   BEGIN
      return
q'[<!-- jQuery 2.2.3 -->
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${resources}/dist/js/app.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${resources}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- fastClick -->
<script src="${resources}/plugins/fastclick/fastclick.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.9.0/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>]';
    END;


   FUNCTION layout
      RETURN CLOB
   AS
   BEGIN
      return q'[<!DOCTYPE html>
<html>
<head>
  <title>Tools | dbax </title>
  <%@ include(pk_app_tools_views.assets) %>
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

  <!-- Content Wrapper. -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      <p>My page content</p>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>


</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

</body>
</html>
      ]';      
   END;
   
   FUNCTION home
      RETURN CLOB
   AS
   BEGIN
      return q'[<!DOCTYPE html>
<html>
<head>
  <title> Tools | dbax </title>
  <%@ include(pk_app_tools_views.assets) %>
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

  <!-- Content Wrapper. -->
  <div class="content-wrapper">

    <!-- Main content -->
    <section class="content">

      <div class="jumbotron text-center">
            <h1>dbax Demo Applications</h1>
            <p>Working demos and sample code of applications made with dbax.</p> 
      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>


</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

</body>
</html>]';      
   END;
   

   FUNCTION hello_world
      RETURN CLOB
   AS
   BEGIN
      --Active selected Menu
      view_.data ('helloWorld', 'active');
      
      return q'[<!DOCTYPE html>
<html>
<head>
  <title> Hello World Example | dbax </title>
  <%@ include(pk_app_tools_views.assets) %>
</head>
<body class="hold-transition skin-red sidebar-mini sidebar-collapse">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

  <!-- Content Wrapper. -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Hello World 
        <small>Example application</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="box box-default box-solid">

        <div class="box-header with-border">
            <h3 class="box-title"><i class="fa fa-hand-spock-o"></i> Hello world</h3>
        </div><!-- /.box-header -->

        <div class="box-body">                            
          <h4>Description:</h4>
          <p>Simple hello world from dbax.</p>
          
          <a class="btn btn-app" href="/hello-world" target="_blank">
            <i class="fa fa-play"></i> Run App
          </a>
           
          <hr>
          <h4>Front controller:</h4>
          <pre><code class="sql">
CREATE OR REPLACE PROCEDURE hello (name_array    IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr
                                 , value_array   IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr )
AS
   -- Unique application ID Name
   l_appid CONSTANT   VARCHAR2 (100) := 'HELLO';
BEGIN
   -- Aplication properties
   dbx.set_property('error_style', 'DebugStyle');   
   -- dbax framework kernel 
   dbx.dispatcher (p_appid     => l_appid
                 , name_array  => name_array
                 , value_array => value_array
                 , router      => 'PK_APP_HELLO.ROUTER');
END hello;
/            
          </code></pre>
          
          <hr>
          <h4>Routing:</h4>
          <pre><code class="sql">
CREATE OR REPLACE PACKAGE pk_app_hello
AS   
   FUNCTION router
      RETURN CLOB;
END;
/

CREATE OR REPLACE PACKAGE BODY pk_app_hello
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
          </code></pre>
          
          </div><!-- /.box-body -->
      </div> <!-- /.box -->            

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>


</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

</body>
</html>]';      
   END;   
   
   FUNCTION greeting
      RETURN CLOB
   AS
   BEGIN
      --Active selected Menu
      view_.data ('greeting', 'active');
      
      return q'[<!DOCTYPE html>
<html>
<head>
  <title> Greeting Application | dbax </title>
  <%@ include(pk_app_tools_views.assets) %>
</head>
<body class="hold-transition skin-red sidebar-mini sidebar-collapse">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

  <!-- Content Wrapper. -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Greeting Application
        <small>Example application</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="box box-default box-solid">

        <div class="box-header with-border">
            <h3 class="box-title"><i class="fa fa-handshake-o"></i> Greeting</h3>
        </div><!-- /.box-header -->

        <div class="box-body">                            
          <h4>Description:</h4>
          <p>Simple application that greets the user. The PRG pattern is used to prevent duplicate form submissions. Saving user inputs in session and pull when needed.</p>
          
          <a class="btn btn-app" href="/greeting-app" target="_blank">
            <i class="fa fa-play"></i> Run App
          </a>
          
          
          <hr>
          <h4>Front controller:</h4>
          <pre><code class="sql">
CREATE OR REPLACE PROCEDURE greeting (name_array    IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr
                                    , value_array   IN owa_util.vc_arr DEFAULT dbx.empty_vc_arr )
AS
   -- Unique application ID Name
   l_appid CONSTANT   VARCHAR2 (100) := 'GREETING';
BEGIN
   -- Custom aplication properties  
   dbx.set_property('error_style', 'DebugStyle');   
   -- dbax framework kernel 
   dbx.dispatcher (p_appid     => l_appid
                 , name_array  => name_array
                 , value_array => value_array
                 , router      => 'PK_APP_GREETING.ROUTER');
END greeting;
/          
          </code></pre>
          
          <hr>
          <h4>Router:</h4>
          <pre><code class="sql">
FUNCTION router
  RETURN CLOB
AS
BEGIN
    IF route_.get ('/')
    THEN
     RETURN greeting_controller ();
    END IF;

    IF route_.post ('/')
    THEN
     RETURN user_inputs_controller ();
    END IF;
END;
          </code></pre>
          
          

          <hr>
          <h4>Controller:</h4>
          <pre><code class="sql">          
  /**
   * Greeting Controller
   */
   FUNCTION greeting_controller
      RETURN CLOB
   AS
      l_input_name   VARCHAR2 (3000);
      l_input_age    PLS_INTEGER;
   BEGIN
      l_input_name := session_.pull ('l_input_name');
      l_input_age := session_.pull ('l_input_age');

      view_.data ('l_input_name', l_input_name);
      view_.data ('l_input_age', l_input_age);
      
      /* Properties frequently  used in views  */   
      view_.data ('base_path', dbx.get_property ('base_path'));
      view_.data ('resources_url', 'http://v4-alpha.getbootstrap.com');

      RETURN view_.run (greeting_view (), 'greeting');
   END greeting_controller;

   /**
   * Reretrive user input data and save it in session. 
   */
   FUNCTION user_inputs_controller
      RETURN CLOB
   AS
      l_input_name   VARCHAR2 (300);
      l_input_age    PLS_INTEGER;
   BEGIN
      l_input_name := request_.input ('inputName');
      l_input_age := request_.input ('inputAge');

      session_.set ('l_input_name', l_input_name);
      session_.set ('l_input_age', l_input_age);

      dbx.redirect ('/');
      RETURN NULL;
   END user_inputs_controller;          
          </code></pre>
          
          
          <hr>
          <h4>View:</h4>
          
<pre><code class="html">FUNCTION greeting_view
  RETURN CLOB
AS
BEGIN
    RETURN q<span class="string">'[<span class="hljs-meta">&lt;!DOCTYPE html&gt;</span>
    <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">html</span></span></span><span class="hljs-tag"> <span class="hljs-attr">lang</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"en"</span></span></span><span class="hljs-tag">&gt;</span>
      <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">head</span></span></span><span class="hljs-tag">&gt;</span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">meta</span></span></span><span class="hljs-tag"> <span class="hljs-attr">charset</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"utf-8"</span></span></span><span class="hljs-tag">&gt;</span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">meta</span></span></span><span class="hljs-tag"> <span class="hljs-attr">name</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"viewport"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">content</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"width=device-width, initial-scale=1, shrink-to-fit=no"</span></span></span><span class="hljs-tag">&gt;</span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">meta</span></span></span><span class="hljs-tag"> <span class="hljs-attr">name</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"description"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">content</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"Simple Greerting application"</span></span></span><span class="hljs-tag">&gt;</span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">meta</span></span></span><span class="hljs-tag"> <span class="hljs-attr">name</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"author"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">content</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"Oscar Salvador Magallanes"</span></span></span><span class="hljs-tag">&gt;</span>

        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">title</span></span></span><span class="hljs-tag">&gt;</span>Greeting from dbax<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">title</span></span></span><span class="hljs-tag">&gt;</span>

        <span class="comment"><span class="hljs-comment">&lt;!-- Bootstrap core CSS --&gt;</span></span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">link</span></span></span><span class="hljs-tag"> <span class="hljs-attr">href</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"${resources_url}/dist/css/bootstrap.min.css"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">rel</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"stylesheet"</span></span></span><span class="hljs-tag">&gt;</span>

        <span class="comment"><span class="hljs-comment">&lt;!-- Custom styles for this template --&gt;</span></span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">link</span></span></span><span class="hljs-tag"> <span class="hljs-attr">href</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"${resources_url}/examples/signin/signin.css"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">rel</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"stylesheet"</span></span></span><span class="hljs-tag">&gt;</span>
      <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">head</span></span></span><span class="hljs-tag">&gt;</span>

      <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">body</span></span></span><span class="hljs-tag">&gt;</span>

        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">div</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"container"</span></span></span><span class="hljs-tag">&gt;</span>

          <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">%</span></span></span><span class="hljs-tag"> <span class="hljs-attr">if</span> <span class="hljs-attr">l_input_name</span> <span class="hljs-attr">is</span> <span class="hljs-attr">not</span> <span class="hljs-attr">null</span> <span class="hljs-attr">then</span>%&gt;</span>
              <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">h2</span></span></span><span class="hljs-tag">&gt;</span>Hi <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">%=</span></span></span><span class="hljs-tag"> <span class="hljs-attr">l_input_name</span> %&gt;</span>! you are <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">%=</span></span></span><span class="hljs-tag"> <span class="hljs-attr">l_input_age</span> %&gt;</span> years old<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">h2</span></span></span><span class="hljs-tag">&gt;</span>
          <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">%</span></span></span><span class="hljs-tag"> <span class="hljs-attr">else</span> %&gt;</span>
              <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">form</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"form-signin"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">method</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"POST"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">action</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"${base_path}/"</span></span></span><span class="hljs-tag">&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">h2</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"form-signin-heading"</span></span></span><span class="hljs-tag">&gt;</span>Greeting App!<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">h2</span></span></span><span class="hljs-tag">&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">label</span></span></span><span class="hljs-tag"> <span class="hljs-attr">for</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputName"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"sr-only"</span></span></span><span class="hljs-tag">&gt;</span>Your name<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">label</span></span></span><span class="hljs-tag">&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">input</span></span></span><span class="hljs-tag"> <span class="hljs-attr">type</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"text"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">name</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputName"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">id</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputName"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"form-control"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">placeholder</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"Your name"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">required</span> <span class="hljs-attr">autofocus</span>&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">label</span></span></span><span class="hljs-tag"> <span class="hljs-attr">for</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputAge"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"sr-only"</span></span></span><span class="hljs-tag">&gt;</span>Your age<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">label</span></span></span><span class="hljs-tag">&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">input</span></span></span><span class="hljs-tag"> <span class="hljs-attr">type</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"number"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">name</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputAge"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">id</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"inputAge"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"form-control"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">placeholder</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"Your age"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">required</span>&gt;</span>
                <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">button</span></span></span><span class="hljs-tag"> <span class="hljs-attr">class</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"btn btn-lg btn-primary btn-block"</span></span></span><span class="hljs-tag"> <span class="hljs-attr">type</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"submit"</span></span></span><span class="hljs-tag">&gt;</span>Greet me!<span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">button</span></span></span><span class="hljs-tag">&gt;</span>
              <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">form</span></span></span><span class="hljs-tag">&gt;</span>
          <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">%</span></span></span><span class="hljs-tag"> <span class="hljs-attr">end</span> <span class="hljs-attr">if</span>; %&gt;</span>

        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">div</span></span></span><span class="hljs-tag">&gt;</span> <span class="comment"><span class="hljs-comment">&lt;!-- /container --&gt;</span></span>


        <span class="hljs-comment">&lt;!-- Bootstrap core JavaScript
        ================================================== --&gt;</span>
        <span class="comment"><span class="hljs-comment">&lt;!-- Placed at the end of the document so the pages load faster --&gt;</span></span>
        <span class="comment"><span class="hljs-comment">&lt;!-- IE10 viewport hack for Surface/desktop Windows 8 bug --&gt;</span></span>
        <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag"><span class="hljs-name">script</span></span></span><span class="hljs-tag"> <span class="hljs-attr">src</span>=</span><span class="string"><span class="hljs-tag"><span class="hljs-string">"${resources_url}/assets/js/ie10-viewport-bug-workaround.js"</span></span></span><span class="hljs-tag">&gt;</span><span class="undefined"></span><span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">script</span></span></span><span class="hljs-tag">&gt;</span>
      <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">body</span></span></span><span class="hljs-tag">&gt;</span>
    <span class="hljs-tag">&lt;</span><span class="keyword"><span class="hljs-tag">/<span class="hljs-name">html</span></span></span><span class="hljs-tag">&gt;</span>\\]\\'</span>;
END greeting_view;</code></pre>          
          
          
               
          
          </div><!-- /.box-body -->
      </div> <!-- /.box -->            

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>


</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

</body>
</html>]';      
   END;   
 

   FUNCTION tapigen2
      RETURN CLOB
   AS
   BEGIN
   
         --Active selected Menu
      view_.data ('tapiGen2', 'active');
   
      return q'[<!DOCTYPE html>
<html>
<head>
  <title> Online Oracle TAPI Generator </title>
  <%@ include(pk_app_tools_views.assets) %>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/codemirror.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/theme/monokai.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/all.css">
  
<style type="text/css">
      .CodeMirror {border: 1px solid black; font-size:13px}
    </style>
<div id=nav>
  
</head>
<body class="hold-transition skin-red sidebar-mini sidebar-collapse">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

    <!-- Content Wrapper -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <i class="fa fa-rocket"></i> TapiGen2
            <small>Table API Generator</small>
          </h1>           
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box box-solid box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">TAPI Generator</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
             
                 <div class="row">
                   <div class="col-md-12">
                     <blockquote>   
                     <p><strong>PL/SQL Table API Generator</strong></p>

                        <p>tapiGen2 aims to automate the creation of PL/SQL TABLE APIs.</p>

                        <p>A table API, is a data access layer that provides the basic CRUD operations for a single table. The key principle, is to avoid repetition of SQL statements and consequently make it easier to optimize, maintain and enhance those statements. For this reason, a data access layer is critical. Some of us build apps that perform DML on individual tables, and so we find TAPIs useful.</p>
                   
                        <small><a href="https://github.com/osalvador/tapiGen2" target="_blank"> View on Github (Source Code and Documentation)</a></small>                        
                   </blockquote>

                   <a href="https://twitter.com/share" class="twitter-share-button" data-via="dbaxio" data-size="large">Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                   
                   </div>
                </div>     
                <hr>
                
                  
                <h4>tapiGen2 Parameters</h4>
                  <!-- form start -->
                  <form name="tapigenForm" id="tapigenForm" action="${base_path}/tapigen2" class="form-horizontal" method="POST">                        

                    <div class="form-group">
                      <label for="tablename" class="col-sm-2 control-label">*Table Name</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                               <input type="text" class="form-control" name="tablename" id="tablename" placeholder="The name of the table" required>
                            <div class="input-group-addon"><i class="fa fa-table"></i></div>
                         </div>
                      </div>
                    </div>
                    
                    <hr>
                    
                    <h4>Columns</h4>                                        
                    <div class="form-group">
                      <label for="columns"  class="col-sm-2 control-label" >*Columns Definitions</label>
                          <div class="col-sm-10">                        
                            <textarea id="columns" name="columns" class="form-control" rows="10" >/**
* [COLUMN_NAME] [DATATYPE],
* ID          NUMBER(10),
* NAME        VARCHAR2(32)
*/
</textarea>
                       </div>                      
                    </div>                         

                    <div class="form-group">
                      <label for="primaryKey" class="col-sm-2 control-label">*Primary Keys</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" class="form-control" name="primaryKey" id="primaryKey" placeholder="Names of primary key columns, comma separated" required>
                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                         </div>
                      </div>
                    </div>
                    
                    <hr>
                    
                    <h4>Audit Columns</h4>                  
                    <div class="form-group">
                      <label for="createdBy" class="col-sm-2 control-label">Created By</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" class="form-control" name="createdBy" id="createdBy" placeholder="Name of Created By audit column">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                         </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="createdDate" class="col-sm-2 control-label">Created Date</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" class="form-control" name="createdDate" id="createdDate" placeholder="Name of Created Date audit column">
                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                         </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="modifiedBy" class="col-sm-2 control-label">Modified By</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" class="form-control" name="modifiedBy" id="modifiedBy" placeholder="Name of Modified By audit column">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                         </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label for="modifiedDate" class="col-sm-2 control-label">Modified Date</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" class="form-control" name="modifiedDate" id="modifiedDate" placeholder="Name of Modified Date audit column">
                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                         </div>
                      </div>
                    </div>                                                          
                          
                    <hr>
                    <div class="form-group">
                      <label for="logger" class="col-sm-2 control-label">Use Logger</label>
                      <div class="col-sm-10">                        
                            <input type="checkbox" class="form-control" name="logger" id="logger">
                            <br>
                            <small>
                                 Check if you use logger as your logging solution.
                                <a href="https://github.com/OraOpenSource/Logger" target="_blank">View logger on github</a>
                            </small>                                                                                 
                      </div>
                      
                    </div>                      
                                  
                    <input type="hidden" name="userdate" id="userDate"/>
                    
                    
                   </form>
                </div><!-- /.box-body -->
                  
                <div class="box-footer">
                  <button id="createTapiBtn"  type="submit" form="tapigenForm" class="btn btn-info"><i class="fa fa-plus"></i> Create TAPI</button>
                  <div class="pull-right">
                    <form>
                        <input type="button" class="btn btn-danger" onClick="history.go(0)" value="Clear">
                    </form>
                  </div>
                </div><!-- /.box-footer -->                
            
            </div> <!-- /.box -->              
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>

</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/codemirror.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/mode/sql/sql.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/hint/sql-hint.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/selection/active-line.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/edit/matchbrackets.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.min.js"></script>

<script>
      var editor = CodeMirror.fromTextArea(document.getElementById("columns"), {
        lineNumbers: true,
        //styleActiveLine: true,
        matchBrackets: true,
        mode: "text/x-sql"   
      });
  
     $('input').iCheck({
          checkboxClass: 'icheckbox_square',
          radioClass: 'iradio_square',          
     }); 
     
    function getDate()
    {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
        if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
        today = yyyy+""+mm+""+dd;

        document.getElementById("userDate").value = today;
    }     
     
    
    //call getDate() when loading the page
    getDate();
      
</script> 


</body>
</html>
      ]';      
   END;


   FUNCTION tapigen2_result
      RETURN CLOB
   AS
   BEGIN
      --Active selected Menu
      view_.data ('tapiGen2', 'active');
      
      return q'[<!DOCTYPE html>
<html>
<head>
  <title> tapiGen2 | dbax </title>
  <%@ include(pk_app_tools_views.assets) %>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/codemirror.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/theme/monokai.min.css">  
  
    <style type="text/css">
          .CodeMirror {
                        border: 1px solid black;
                        font-size:12px;                        
                        height: 500px;
                      }
        </style>
    <div id=nav>
  
</head>
<body class="hold-transition skin-red sidebar-mini sidebar-collapse">
<div class="wrapper">
<%@ include(pk_app_tools_views.main_header) %>

<%@ include(pk_app_tools_views.left_column) %>

    <!-- Content Wrapper -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <i class="fa fa-rocket"></i> TapiGen2
            <small>Table API Generator</small>
          </h1>           
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box box-solid box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">tapiGen2 Generated Code</h3>
                </div><!-- /.box-header -->
                <div class="box-body">   
                  
                  <h4>TAPI Source Code</h4>
                                    
                  <form name="tapigenForm" id="tapigenForm" >                                            
                    <div class="col-sm-12 form-group">
                            <textarea id="code" name="code" class="form-control" rows="30" ><%= l_code %></textarea>      
                    </div>    
                   </form>
                   
                </div><!-- /.box-body -->                  
                               
            </div> <!-- /.box -->              
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<%@ include(pk_app_tools_views.footer) %>

</div>
<!-- ./wrapper -->

<%@ include(pk_app_tools_views.scripts) %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/codemirror.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/mode/sql/sql.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/hint/sql-hint.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/selection/active-line.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.24.0/addon/edit/matchbrackets.js"></script>

<script>
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,        
        matchBrackets: true,
        mode: "text/x-plsql"   
      });
  
</script> 

</body>
</html>]';      
   END;   


     
END;
/


