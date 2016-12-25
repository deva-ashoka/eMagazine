<%@ page import="process.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");

    String requestFor = request.getParameter("requestFor");
    if (requestFor != null && requestFor.intern() == "create_edition") {


        String month = request.getParameter("month");
        String requestYear = request.getParameter("year");
        String area = session.getAttribute("area").toString();

        session.setAttribute("month", month);
        session.setAttribute("year", requestYear);

        if (month != null && requestYear != null && area != null) { //check if parameter exists
            General validation = new General();
            int year = Integer.parseInt(requestYear);

            if (validation.isValidMonth(month, year) && validation.isValidYear(year)) {

                Edition magazine = new Edition();

                if (!magazine.editionExists(month, year, area, "approved")) { //if approved edition of this doesn't exists then do this block

                    if(!magazine.editionExists(month, year, area, "editing")) {
                        //if the editing version of the edition doesn't exist then create new
                        magazine.createEdition(month, year, area);

                    }

                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "adminEvents.jsp");
                } else {

                    //if approved edition already exist then redirect to same page with error message
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "createEdition.jsp?error=Edition already approved");
                }
            } else {
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "createEdition.jsp?error=Month and Year not valid");
            }

        } else {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "createEdition.jsp?error=Parameters cannot be empty");
        }


    } else if (requestFor != null && requestFor.intern() == "approveEdition") {

        String month = session.getAttribute("month").toString();
        String requestYear = session.getAttribute("year").toString();
        String area = session.getAttribute("area").toString();


        if (month != null && requestYear != null && area != null) { //check if parameter exists
            General validation = new General();
            int year = Integer.parseInt(requestYear);

            if (validation.isValidMonth(month, year) && validation.isValidYear(year)) {
                Edition magazine = new Edition();

                if (!magazine.approveEdition(month, year, area)) {
                    //in case the edition is not approved
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "index.jsp?error=Cannot approve edition");
                } else {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "createEdition.jsp?error=Edition Approved");
                }
            } else {
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "index.jsp?error=Month and Year not valid");
            }
        }

    } else if (requestFor != null && requestFor.intern() == "upload") {


        String upload = request.getParameter("upload");
        String directory = "C:\\Users\\admin\\IdeaProjects\\eMagazine\\resources\\";
        String contentType = request.getContentType();

        /*----to be removed
        session.setAttribute("month", "june");
        session.setAttribute("year", "2016");
        session.setAttribute("area", "mrc");
        */

        if (upload != null) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);

            if (upload.intern() == "mostReadArticles") {

                int articleNumber = Integer.parseInt(request.getParameter("number"));
                MostReadArticles articles = new MostReadArticles();
                articles.updateMostRead(directory, articleNumber, contentType, request, session);

                response.setHeader("Location", "adminMostReadArticles.jsp");

            } else if (upload.intern() == "newsFeed") {

                int newsNumber = Integer.parseInt(request.getParameter("number"));
                NewsFeed news = new NewsFeed();
                news.updateEvent(directory, newsNumber, contentType, request, session);

                response.setHeader("Location", "adminNewsFeed.jsp");

            } else if (upload.intern() == "stories") {

                int storyNumber = Integer.parseInt(request.getParameter("number"));
                Stories story = new Stories();
                story.updateStories(directory, storyNumber, contentType, request, session);

                response.setHeader("Location", "adminOtherStories.jsp");

            } else if (upload.intern() == "event") {

                int eventNumber = Integer.parseInt(request.getParameter("number"));
                Events event = new Events();
                event.updateEvent(directory, eventNumber, contentType, request, session);

                response.setHeader("Location", "adminEvents.jsp");

            } else if (upload.intern() == "miscellaneous") {

                int miscNumber = Integer.parseInt(request.getParameter("number"));
                Miscellaneous misc = new Miscellaneous();
                misc.updateMiscellaneous(directory, miscNumber, contentType, request, session);

                response.setHeader("Location", "adminMiscellaneous.jsp");

            } else if (upload.intern() == "advertisement") {

                int adNumber = Integer.parseInt(request.getParameter("number"));
                Advertisements ad = new Advertisements();
                ad.updateAdvertisements(directory, adNumber, contentType, request);

                response.setHeader("Location", "adminAdvertisements.jsp");

            }

        }

    } else if (requestFor != null && requestFor.intern() == "view_edition") {
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        General validate = new General();

        String month = validate.escapeHtml(request.getParameter("month"));
        String year = validate.escapeHtml(request.getParameter("year"));

        session.setAttribute("month", month);
        session.setAttribute("year", year);

        Edition magazine = new Edition();
        String status = "approved";
        if(magazine.editionExists(month, Integer.parseInt(year), session.getAttribute("area").toString(), status))
            response.setHeader("Location", "index.jsp");
        else
            response.setHeader("Location", "index.jsp?status=editing&month=" + month + "&year=" + year);


    }


%>