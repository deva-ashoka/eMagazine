<%@ page import="process.General" %>
<%@ page import="process.Miscellaneous" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
    response.addHeader("Pragma", "no-cache");
    response.addDateHeader("Expires", 0);

    if (session.getAttribute("email") == null) {
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "login.jsp");
    }

%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/icon/android-icon-192x192.png">
    <link rel="manifest" href="images/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--favicons over-->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-tap-highlight" content="no">
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection"/>


</head>
<body>

<header>
    <nav style="height: 7em; background-color: #009688;">
        <div class="nav-wrapper container">
            <div class="row">
                <a href="index.jsp" class="left hide-on-small-and-down" style="margin-top: 0.5%; margin-left: 10%;">
                    <img src="images/gkLogo.png" style="height: 90px;">
                </a>
                <a href="index.jsp" class="brand-logo center" style="margin-top: 2%;">eMagazine
                </a>
                <a href="index.jsp" class="right hide-on-small-and-down" style="margin-top: 0.5%; margin-right: 10%;">
                    <img src="images/mrcLogo.png" style="height: 90px;">
                </a>
            </div>
        </div>
    </nav>
</header>
<br><br/>

<div class="container">
    <nav>
        <div class="nav-wrapper" style="background-color: #795548;">
            <a href="adminMiscellaneous.jsp" class="brand-logo" style="margin-left: 10px">Miscellaneous</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminEvents.jsp"> Events </a></li>
                <li><a href="adminNewsFeed.jsp">News Feed</a></li>
                <li><a href="adminOtherStories.jsp">Other Stories</a></li>
                <li><a href="adminMostReadArticles.jsp">Most Read Articles</a></li>
                <li><a href="adminAdvertisements.jsp">Advertisements</a></li>
            </ul>
        </div>
    </nav>
</div>
<br/><br/>

<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Miscellaneous 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Miscellaneous 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Miscellaneous 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Miscellaneous 4</a></li>

        </ul>
    </div>


    <!-- Miscellaneous form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=miscellaneous&number=1" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input required name="misc1TitleEnglish" id="misc1TitleEnglish" type="text">
                        <label for="misc1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input required name="misc1TitleKannada" id="misc1TitleKannada" type="text">
                        <label for="misc1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc1ContentEnglish"
                                  id="misc1ContentEnglish"
                                  type="text"></textarea>
                        <label for="misc1ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc1ContentKannada"
                                  id="misc1ContentKannada"
                                  type="text"></textarea>
                        <label for="misc1ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload English File
                            <input required name="misc1FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input required class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input required name="misc1FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input required class="file-path validate" type="text">
                        </div>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

    <div id="test2" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=miscellaneous&number=2" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input required name="misc2TitleEnglish" id="misc2TitleEnglish" type="text">
                        <label for="misc2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input required name="misc2TitleKannada" id="misc2TitleKannada" type="text">
                        <label for="misc2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc2ContentEnglish"
                                  id="misc2ContentEnglish"
                                  type="text"></textarea>
                        <label for="misc2ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc2ContentKannada"
                                  id="misc2ContentKannada"
                                  type="text"></textarea>
                        <label for="misc1ContentEnglish">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload English File
                            <input required name="misc2FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input required class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input required name="misc2FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input required class="file-path validate" type="text">
                        </div>
                    </div>
                </div>
        </div>
        <center>
            <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                <i class="material-icons right">send</i>
            </button>
        </center>
        </form>
    </div>
</div>

<div id="test3" class="col s12">
    <br/><br/>
    <div class="container">
        <form action="controller.jsp?requestFor=upload&upload=miscellaneous&number=3" method="post"
              enctype="multipart/form-data">
            <div class="row">
                <span style="font-size: 1.5em;"> Miscellaneous 3: </span> <br/>
                <div class="input-field col s12">
                    <i class="material-icons prefix">label</i>
                    <input required name="misc3TitleEnglish" id="misc3TitleEnglish" type="text">
                    <label for="misc3TitleEnglish">Title in English</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">label</i>
                    <input required name="misc3TitleKannada" id="misc3TitleKannada" type="text">
                    <label for="misc3TitleKannada">Title in Kannada</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc3ContentEnglish"
                                  id="misc3ContentEnglish"
                                  type="text"></textarea>
                    <label for="misc3ContentEnglish">Content in English</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc3ContentKannada"
                                  id="misc3ContentKannada"
                                  type="text"></textarea>
                    <label for="misc3ContentKannada">Content in Kannada</label>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn"><i class="material-icons left">perm_media</i>Upload English File
                        <input required name="misc3FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input required class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                        <input required name="misc3FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input required class="file-path validate" type="text">
                    </div>
                </div>
            </div>
    </div>
    <center>
        <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
        </button>
    </center>
    </form>
</div>
</div>

<div id="test4" class="col s12">
    <br/><br/>
    <div class="container">
        <form action="controller.jsp?requestFor=upload&upload=miscellaneous&number=4" method="post"
              enctype="multipart/form-data">
            <div class="row">
                <span style="font-size: 1.5em;"> Miscellaneous 4: </span> <br/>
                <div class="input-field col s12">
                    <i class="material-icons prefix">label</i>
                    <input required name="misc4TitleEnglish" id="misc4TitleEnglish" type="text">
                    <label for="misc4TitleEnglish">Title in English</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">label</i>
                    <input required name="misc4TitleKannada" id="misc4TitleKannada" type="text">
                    <label for="misc4TitleKannada">Title in Kannada</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc4ContentEnglish"
                                  id="misc4ContentEnglish"
                                  type="text"></textarea>
                    <label for="misc4ContentEnglish">Content in English</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">subject</i>
                        <textarea required class="materialize-textarea" name="misc4ContentKannada"
                                  id="misc4ContentKannada"
                                  type="text"></textarea>
                    <label for="misc4ContentKannada">Content in Kannada</label>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn"><i class="material-icons left">perm_media</i>Upload English File
                        <input required name="misc4FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input required class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                        <input required name="misc4FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input required class="file-path validate" type="text">
                    </div>
                </div>
            </div>
    </div>
    <center>
        <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
            <i class="material-icons right">send</i>
        </button>
    </center>
    </form>
</div>
</div>

</div>
<!-- Button containing logout and home -->
<div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large" style="color: #009688;">
        <i class="material-icons">menu</i>
    </a>
    <ul>
        <li><a href="createEdition.jsp" class="btn-floating tooltipped blue" data-position="top" data-delay="50"
               data-tooltip="Home"><i
                class="material-icons">store</i></a></li>

        <li><a href="userControl.jsp?requestFor=logout" class="btn-floating tooltipped red" data-position="top"
               data-delay="50" data-tooltip="Logout"><i
                class="material-icons">power_settings_new</i></a></li>
    </ul>
</div>
</body>
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
    //for miscellaneous
    var miscellaneous_title = [];
    var miscellaneous_title_kannada = [];
    var miscellaneous_content = [];
    var miscellaneous_content_kannada = [];
    var miscellaneous_link = [];
    var miscellaneous_link_kannada = [];
    <%

            General escape = new General(); //to escape all the HTML inputs
            //to select the area
        String pageToDisplay = session.getAttribute("area").toString();
        String monthName = session.getAttribute("month").toString();
        int year = Integer.parseInt(session.getAttribute("year").toString());
  /*
            String pageToDisplay = "mrc";
            int isDistrict = 0;
            int isUlb = 0;
            if(escape.escapeHtml(request.getParameter("district")) != null ){
                pageToDisplay = escape.escapeHtml(request.getParameter("district"));
                isDistrict = 1;
            }else if(escape.escapeHtml(request.getParameter("ulb")) != null){
                pageToDisplay = escape.escapeHtml(request.getParameter("ulb"));
                isUlb = 1;
            } */

            //get status=approved for clients
            //status=editing for preview purposes
            String status = "editing";

            //get month
/*
            String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                    "August", "September", "October", "November", "December" };
            Calendar now = Calendar.getInstance();
            String monthName = monthNames[now.get(Calendar.MONTH)];
            int year = now.get(Calendar.YEAR);
            if(escape.escapeHtml(request.getParameter("month")) != null && escape.escapeHtml(request.getParameter("year")) != null)
            {
                monthName = escape.escapeHtml(request.getParameter("month"));
                year =  Integer.parseInt(request.getParameter("year"));
            }
*/
               //for miscellaneous section

              Miscellaneous rows = new Miscellaneous();
              List<Miscellaneous> allMiscellaneous = rows.getAllMiscellaneous(pageToDisplay, monthName, year, status);
                            for(int i=0; i<allMiscellaneous.size(); i++)
                            {
                                    Miscellaneous row = allMiscellaneous.get(i);

                                    out.print("miscellaneous_content["+i+"]=\""+escape.escapeHtml(row.getContent())+"\";");
                                    out.print("miscellaneous_content_kannada["+i+"]=\""+escape.escapeHtml(row.getContentKannada())+"\";");
                                    out.print("miscellaneous_title["+i+"]=\""+escape.escapeHtml(row.getTitle())+"\";");
                                    out.print("miscellaneous_title_kannada["+i+"]=\""+escape.escapeHtml(row.getTitleKannada())+"\";");
                            }


    %>
    function addto_miscellaneous() {
        for (var i = 0; i < 4; i++) {
            if (miscellaneous_title[i] != undefined)
                document.getElementById("misc" + (i + 1) + "TitleEnglish").value = miscellaneous_title[i];
            if (miscellaneous_title_kannada[i] != undefined)
                document.getElementById("misc" + (i + 1) + "TitleKannada").value = miscellaneous_title_kannada[i];
            if (miscellaneous_content[i] != undefined)
                document.getElementById("misc" + (i + 1) + "ContentEnglish").value = miscellaneous_content[i];
            if (miscellaneous_content_kannada[i] != undefined)
                document.getElementById("misc" + (i + 1) + "ContentKannada").value = miscellaneous_content_kannada[i];


        }

    }
    addto_miscellaneous();
</script>

</html>
