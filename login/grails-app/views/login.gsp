<%--
  Created by IntelliJ IDEA.
  User: matthias
  Date: 1/24/13
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    	</style>
	</head>
<%@ page contentType="text/html;charset=UTF-8" %>

  <title></title>
</head>
<body>
<div id="page-body" role="main">


    <div id="controller-list" role="navigation">
        <h2>Available Controllers:</h2>
        <ul>

            <li class="controller"><a href="/Bookstore/login/index">LoginController</a></li>

            <li class="controller"><a href="/Bookstore/logout/index">LogoutController</a></li>

            <li class="controller"><a href="/Bookstore/book/index">fr.xebia.bookstore.domain.BookController</a></li>





        </ul>
    </div>
</div>

<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>

<script src="/Bookstore/static/js/application.js" type="text/javascript" ></script>

</body>
</html>