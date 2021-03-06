<%@page import="com.tyndalehouse.step.core.models.ClientSession" trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Locale"%>
<%@page import="javax.servlet.jsp.jstl.core.Config"%>
<%@ taglib prefix="search" tagdir="/WEB-INF/tags/search" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.google.inject.Injector"%>
<%@ page import="com.tyndalehouse.step.core.service.AppManagerService" %>
<%@ page import="java.util.Calendar" %>
<%
    Injector injector = (Injector) pageContext.getServletContext().getAttribute(Injector.class.getName());
    Locale locale = injector.getInstance(ClientSession.class).getLocale();
    Config.set(session, Config.FMT_LOCALE, locale.getLanguage());
    AppManagerService appManager = injector.getInstance(AppManagerService.class);
%>

<fmt:setBundle basename="HtmlBundle" scope="request" />
<!DOCTYPE html  xmlns:fb="http://ogp.me/ns/fb#">
<html>
<head>
    <%
        if(request.getParameter("translate") != null) {
    %>

    <script type="text/javascript">
        var _jipt = [];
        _jipt.push(['project', 'step']);
    </script>
    <script type="text/javascript" src="//cdn.crowdin.net/jipt/jipt.js"></script>
    <%
        }
    %>

    <TITLE>${ title }</TITLE>
    <META http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta step-local content="<%= appManager.isLocal() %>" />
    <meta step-domain content="<%= appManager.getAppDomain() %>" />
    <meta step-direction content="${ ltr }" />
    <c:if test="${ not languageComplete }">
        <meta step-incomplete-language content="true" />
    </c:if>
    <meta property="fb:admins" content="551996214" />
    <meta name="step.version" content="${project.version}" />
    <meta name="description" content="${ description }" />
    <link rel="shortcut icon"  href="images/step-favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <c:choose>
        <c:when test="${ empty canonicalUrl }">
            <link rel="canonical" href="http://${stepDomain}/" />
        </c:when>
        <c:otherwise>
            <link rel="canonical" href="http://${stepDomain}/?q=${canonicalUrl}" />
        </c:otherwise>
    </c:choose>

    <%
        if(request.getParameter("debug") != null) {
    %>
    <%-- 3rd party libs --%>
    <link rel="stylesheet" type="text/css" href="css/qtip.css" />
    <link rel="stylesheet" type="text/css" href="css/cardo.css" />

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" media="screen" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen" />
    <link href="css/select2.css" rel="stylesheet" media="screen" />
    <link href="css/select2-bootstrap.css" rel="stylesheet" media="screen" />
    <link href="scss/step-template.css" rel="stylesheet" media="screen" />
    <%
    } else {
    %>
    <%-- Contains the jquery ui css --%>
    <link rel="stylesheet" type="text/css" href="css/step.${project.version}.min.css"  />
    <%
        }
    %>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <%
        if(appManager.isLocal()) {
        %>
            <script src="libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="libs/respond.js/1.3.0/respond.min.js"></script>
        <% } else { %>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <% } %>
    <![endif]-->

    <% if(!appManager.isLocal()) { %>
        <script type="text/javascript">
            var _prum = [['id', '52698a2cabe53d8c20000000'], ['mark', 'firstbyte', (new Date()).getTime()]];
        </script>
    <% } %>
</head>
<body xmlns:fb="http://ogp.me/ns/fb#">
    <!-- Wrap all page content here -->
    <div id="wrap">

        <!-- Fixed navbar -->
        <div class="navbar navbar-default navbar-fixed-top">
            <div>
                <div class="navbar-header search-form">
                    <div class="navbar-brand col-xs-12">
                        <span class="hidden-xs title">
                            <a href="/" id="logo">
                                <svg width="90px" height="22px" viewBox="0 0 90 22" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                    <g>
                                        <path d="M57.8581076,11.1620647 C58.6059474,11.1620647 59.2634539,11.0624927 59.8306273,10.8625998 C60.3970602,10.6612097 60.8716792,10.3774666 61.2552248,10.0121193 C61.6380298,9.64527469 61.9260591,9.20655864 62.1200532,8.69746823 C62.3133068,8.18837782 62.4103039,7.62463511 62.4103039,7.00549128 C62.4103039,5.75971711 62.0341627,4.77971812 61.2818805,4.06474552 C60.5310792,3.35052153 59.3900682,2.99266101 57.8581076,2.99266101 L54.786782,2.99266101 L54.786782,11.1620647 L57.8581076,11.1620647 Z M57.8581076,0.608920042 C59.1316563,0.608920042 60.2378666,0.761647165 61.1782195,1.06710141 C62.1200532,1.37105843 62.8997316,1.80079053 63.5179951,2.35779533 C64.135518,2.91480012 64.5945881,3.58859625 64.8952048,4.37918371 C65.195081,5.16977117 65.3453894,6.04570604 65.3453894,7.00549128 C65.3453894,7.96827099 65.183234,8.85169277 64.8596639,9.65575606 C64.5375745,10.4605681 64.0629555,11.1530808 63.4350663,11.7340428 C62.8071772,12.3135075 62.0252775,12.762705 61.0893673,13.081635 C60.1534571,13.4013139 59.0761236,13.5607789 57.8581076,13.5607789 L54.786782,13.5607789 L54.786782,21.1132849 L51.8398494,21.1132849 L51.8398494,0.608920042 L57.8581076,0.608920042 Z" id="Shape"></path>
                                        <polygon points="47.1815992 18.4510415 47.1667905 20.9216273 34.8518705 20.9216273 34.8518705 0.417262477 47.1667905 0.417262477 47.1667905 2.88784828 37.8136117 2.88784828 37.8136117 9.38324295 45.3393961 9.38324295 45.3393961 11.7699786 37.8136117 11.7699786 37.8136117 18.4510415"></polygon>
                                        <polygon points="31.1576551 2.95971987 24.8461845 2.95971987 24.8461845 20.9216273 21.9140607 20.9216273 21.9140607 2.95971987 15.5759345 2.95971987 15.5759345 0.417262477 31.1576551 0.417262477"></polygon>
                                        <path d="M12.0056858,3.75929127 C11.9146122,3.92100234 11.8176151,4.04003971 11.7154351,4.11565456 C11.6147359,4.19201821 11.4851597,4.22945124 11.327447,4.22945124 C11.1615895,4.22945124 10.9720381,4.15159035 10.7587927,3.99586858 C10.5470283,3.83864958 10.2826928,3.66196507 9.96504608,3.46581563 C9.646659,3.2704148 9.26607516,3.09447909 8.82181397,2.93875732 C8.37903375,2.78153813 7.84888189,2.70218001 7.23135894,2.70218001 C6.65085766,2.70218001 6.14143817,2.78153813 5.70310046,2.93875732 C5.26476276,3.09447909 4.89750685,3.30859643 4.60133273,3.5796123 C4.30663938,3.85137679 4.0837684,4.17105548 3.93197921,4.53790013 C3.77944945,4.90324737 3.70392514,5.30078713 3.70392514,5.72977062 C3.70392514,6.28078612 3.84016524,6.73821887 4.11264543,7.10132007 C4.38512562,7.46292404 4.74201553,7.77212155 5.18479575,8.0296614 C5.62683558,8.28570383 6.1295912,8.50880531 6.69232203,8.70046288 C7.25505287,8.89062302 7.83111144,9.08826989 8.42197891,9.29340347 C9.0121058,9.49703963 9.58890495,9.73286833 10.1516358,10.0001407 C10.7143666,10.2659159 11.2163818,10.6013167 11.6591621,11.006343 C12.1034232,11.409872 12.4603132,11.9047378 12.7313124,12.4916891 C13.0037926,13.077143 13.1400327,13.7928644 13.1400327,14.6388528 C13.1400327,15.5432369 12.9897243,16.3907227 12.689848,17.1813101 C12.3914525,17.9718976 11.9560766,18.662913 11.3837201,19.2536076 C10.8106231,19.8428049 10.1072097,20.3062268 9.27199864,20.6431249 C8.43826858,20.9800231 7.49051139,21.1492207 6.42872706,21.1492207 C5.79269309,21.1492207 5.17442975,21.0848356 4.57467706,20.9575631 C3.97640533,20.8302906 3.40923198,20.6491142 2.8746376,20.4155316 C2.33930282,20.1819489 1.83876856,19.9019493 1.3730348,19.5740351 C0.906560461,19.2446236 0.488955138,18.8755331 0.120218261,18.4660148 L0.964314509,17.0106151 C1.04724326,16.8953212 1.14572111,16.7994924 1.26048863,16.7231288 C1.37673693,16.6475139 1.50927489,16.6093321 1.65736196,16.6093321 C1.85061552,16.6093321 2.0734865,16.7141448 2.32671547,16.9237703 C2.58142522,17.1333958 2.89536979,17.365481 3.26854918,17.618529 C3.64172857,17.8700795 4.0889515,18.1006675 4.61021795,18.310293 C5.13148441,18.5184212 5.76529703,18.6217365 6.51165582,18.6217365 C7.12177451,18.6217365 7.6667349,18.5393836 8.14653697,18.3731806 C8.62633905,18.2054803 9.02913586,17.9681543 9.35492739,17.6604541 C9.68219989,17.3512565 9.93394771,16.977674 10.1101714,16.5404552 C10.2856545,16.1017389 10.3737664,15.6151085 10.3737664,15.0820609 C10.3737664,14.483131 10.2390072,13.9935057 9.97096957,13.611688 C9.70441286,13.2306189 9.34900391,12.9124374 8.90474273,12.6563948 C8.46196251,12.398855 7.95994728,12.1794969 7.39721644,11.9975719 C6.83448561,11.8163957 6.25768646,11.6284814 5.66755957,11.4345778 C5.0766921,11.239177 4.50063353,11.0123323 3.9379027,10.7547924 C3.37517186,10.4972526 2.87241624,10.1618518 2.43037641,9.74859019 C1.9875962,9.33532856 1.63218725,8.81725421 1.36414957,8.19436712 C1.09759286,7.5699828 0.964314509,6.8003577 0.964314509,5.88549239 C0.964314509,5.1533005 1.10203538,4.44431738 1.37895828,3.75929127 C1.6551406,3.07501378 2.05867799,2.46784874 2.59031044,1.9385444 C3.12120251,1.40998868 3.77352596,0.986245874 4.54802139,0.668813031 C5.32177624,0.349882768 6.20733686,0.189669118 7.20470326,0.189669118 C8.31979893,0.189669118 9.34604217,0.373839964 10.2819524,0.740684618 C11.2193434,1.10603185 12.0338224,1.63159274 12.7253889,2.31587023 L12.0056858,3.75929127 Z" id="Shape"></path>
                                        <polygon points="64.932373 20.9216273 89.6913457 20.9216273 89.6913457 16.6409302 64.932373 16.6409302"></polygon>
                                        <polygon points="69.265686 14.072876 89.6913457 14.072876 89.6913457 10.580945 69.265686 10.580945"></polygon>
                                        <polygon points="73.8741455 7.76968271 89.6913457 7.76968271 89.6913457 5.03112793 73.8741455 5.03112793"></polygon>
                                        <polygon points="77.2799377 2.28634644 89.6913457 2.28634644 89.6913457 0.320198302 77.2799377 0.320198302"></polygon>
                                    </g>
                                </svg>
                            </a>
                            <span class="subtitle">
                                <a href="http://www.tyndale.cam.ac.uk" target="_blank">Tyndale House</a>
                            </span>
                        </span>
                        <span class="help"><jsp:include page="js/menu/top/menu.jsp" /></span>
                        <form role="form">
                            <div class="input-group">
                                <input id="masterSearch" type="text" class="form-control input-sm" placeholder="<fmt:message key="search_placeholder" />">
                                <span class="input-group-btn findButton">
                                    <span>Search</span>
                                    <i class="find glyphicon glyphicon-search"></i>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="mainPanel row row-offcanvas">
            <div class="" id='columnHolder'>
                <div class="col-sm-6 col-xs-12 column">
                    <div class="passageContainer active" passage-id=0>
                        <span class="activeMarker"></span>
                        <div class="passageText ui-widget">
                            <div class="passageOptionsGroup">
                                <div class="pull-right">
                                    <span class="nextPreviousChapterGroup" style="${ 'PASSAGE' ne searchType ? 'display: none' : '' }">
                                        <a class="previousChapter" href="/?q=${previousChapter}" title="<fmt:message key="passage_previous_chapter" />">
                                            <i class="glyphicon glyphicon-arrow-left"></i></a>
                                        <a class="nextChapter" href="/?q=${nextChapter}" title='<fmt:message key="passage_next_chapter" />'>
                                            <i class="glyphicon glyphicon-arrow-right"></i>
                                        </a>
                                    </span>
                                    <%
                                        if(!appManager.isLocal()) {
                                    %>
                                    <span class="dropdown">
                                        <a class="dropdown-share" data-toggle="dropdown" title="<fmt:message key="share" />">
                                            <i class="glyphicon glyphicon-thumbs-up"></i>
                                        </a>
                                    </span>
                                    <%
                                        }
                                    %>
                                    <span class="dropdown settingsDropdown">
                                        <a class="dropdown-toggle showSettings" data-toggle="dropdown" title="<fmt:message key="view" />">
                                            <i class="glyphicon glyphicon-cog"></i>
                                        </a>
                                    </span>

                                    <%--  this button starts hidden as there is only 1 column showing --%>
                                    <a class="openNewPanel" title="<fmt:message key="open_in_new_panel" />">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </a>
                                    <a class="closeColumn disabled" title="<fmt:message key="close" />">
                                        <i class="glyphicon glyphicon-remove"></i>
                                    </a>
                                </div>
                                <div class="resultsLabel pull-right" style="margin-right: 5px">
                                    <c:if test="${'PASSAGE' ne searchType}">
                                        <c:set var="pageMessage" scope="request"><fmt:message key="paging_showing" /></c:set>
                                        <%= String.format((String) request.getAttribute("pageMessage"), (Integer) request.getAttribute("numResults")) %>
                                    </c:if>
                                </div>
                            </div>
                            <div class="passageContent" itemprop="text">
                                <c:choose>
                                    <c:when test="${ 'PASSAGE' eq searchType }">
                                        ${ passageText }
                                    </c:when>
                                    <c:otherwise>
                                        <span>
                                            <%-- Do toolbar for original word search --%>
                                            <c:if test="${ ('ORIGINAL_GREEK_RELATED' eq searchType or 'ORIGINAL_HEBREW_RELATED' eq searchType or 'ORIGINAL_MEANING' eq searchType) and fn:length(definitions) gt 0  }">
                                                <div class="originalWordSearchToolbar">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 data-toggle="collapse" href="#relatedWords" class="panel-title lexicalGrouping"><span class="glyphicon glyphicon-plus"></span><fmt:message key="lexicon_related_words" />
                                                            <span class="pull-right sortOptions">
                                                                <span>Sort by </span>
                                                                <fmt:bundle basename="InteractiveBundle">
                                                                    <fmt:message key="scripture_help" var="scriptureHelp" />
                                                                    <fmt:message key="vocabulary_help" var="vocabularyHelp"  />
                                                                    <a data-value="SCRIPTURE_SORT" class="${ (empty param.sort or sort eq 'false' or not (param.sort  eq 'VOCABULARY')) ? 'active' : '' }" href="javascript:void(0)" title="${scriptureHelp}"><fmt:message key="scripture" /></a> |
                                                                    <a data-value="VOCABULARY" class="${param.sort eq 'VOCABULARY' ?  'active' : '' }" href="javascript:void(0)" title="${vocabularyHelp}"><fmt:message key="vocabulary" /></a></span>
                                                                </fmt:bundle>
                                                            </h4>
                                                        </div>
                                                            <div id="relatedWords" class="panel-body panel-collapse collapse">
                                                                <ul class="panel-collapse"style="height: auto;">
                                                                    <c:forEach items="${definitions}" var="definition">
                                                                        <%-- need to work out if the item is active --%>
                                                                        <c:set var="isActive" value="false" />
                                                                        <c:forEach var="item" items="${filter}">
                                                                            <c:if test="${item eq definition.strongNumber}">
                                                                                <c:set var="isActive" value="true" />
                                                                            </c:if>
                                                                        </c:forEach>

                                                                        <li class="sortable" strongnumber="${ definition.strongNumber}">
                                                                            <a href="javascript:void(0)" strong="${ definition.strongNumber}">
                                                                                <span class="glyphicon glyphicon-ok ${isActive ? 'active' : '' }"></span>
                                                                                ${ definition.gloss}
                                                                                (<span class="transliteration">${ definition.stepTransliteration }</span>
                                                                                - <span class="${fn:substring(definition.strongNumber, 0,1) == 'H' ?'hbFontMini' : 'unicodeFontMini'}">
                                                                                    ${ definition.matchingForm })
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                    </div>
                                                </div>
                                            </c:if>   
                                            
                                            <c:choose>
                                                <c:when test="${ 'SUBJECT_SIMPLE' eq searchType or 
                                                    'SUBJECT_EXTENDED' eq searchType or 
                                                    'SUBJECT_FULL' eq searchType or 
                                                    'SUBJECT_RELATED' eq searchType }">
                                                    <c:if test="${ 'SUBJECT_RELATED' ne searchType }">
                                                        <%-- Do search toolbar --%>
                                                        <div class="subjectToolbar">
                                                            <span class="radioGroup"><input <c:if test="${ 'SUBJECT_SIMPLE' eq searchType }">checked="checked"</c:if> type="radio" name="subjectSearchType"
                                                                   value="subject" id="0_esvHeadings"><label for="0_esvHeadings"><fmt:message key="search_subject_book_headings" /></label></span>
                                                            <span class="radioGroup"><input type="radio" <c:if test="${ 'SUBJECT_EXTENDED' eq searchType }">checked="checked"</c:if> name="subjectSearchType"
                                                                   value="nave" id="0_nave"><label for="0_nave"><fmt:message key="search_subject_nave" /></label></span>
                                                            <span class="radioGroup"><input type="radio" <c:if test="${ 'SUBJECT_FULL' eq searchType }">checked="checked"</c:if> name="subjectSearchType"
                                                                   value="xnave" id="0_extendedNave"><label for="0_extendedNave"><fmt:message key="search_subject_nave_extended" /></label></span>
                                                        </div>
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${ 'SUBJECT_SIMPLE' eq searchType }">
                                                            <search:display_results results="${searchResults[0].headingsSearch.results }" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="panel-group subjectSection searchResults">
                                                                <c:set var="previousHeading" value="not-set" />
                                                                <c:forEach var="result" items="${ searchResults }" varStatus="count">

                                                                    <c:if test="${ previousHeading ne result.root }">
                                                                        <h4 class="subjectHeading">${ result.root }</h4>
                                                                    </c:if>
                                                                    <c:set var="previousHeading" value="${result.root}" />
                                                                        <div class="panel panel-default"
                                                                             root="${ result.root }"
                                                                             fullheader="${ result.heading }"
                                                                              <c:if test="${ not empty result.seeAlso }">seeAlso="${result.seeAlso}"</c:if>
                                                                        >
                                                                            <div class="panel-heading">
                                                                                <h4 data-toggle="collapse" href="#subject-results-${ count.index }" class="panel-title expandableSearchHeading">
                                                                                <span class="glyphicon glyphicon-plus"></span>${ result.heading }</h4></div>
                                                                            <div class="results panel-collapse collapse"
                                                                                 id="subject-results-${ count.index }"><fmt:message key="results_loading" /></div>
                                                                        </div>
                                                                </c:forEach>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                            <c:otherwise>
                                                <div class="searchResults">
                                                    <search:display_results results="${searchResults}" sortType="${ sort }" />
                                                </div>
                                            </c:otherwise>
                                            </c:choose>
                                            
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                                <search:copyrightinfo />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hidden-xs col-sm-6 column examplesColumn" dir="${ ltr ? "ltr" : "rtl" }">
                    <div class="passageContainer examplesContainer">
                        <a class="closeColumn" title="<fmt:message key="close" />">
                            <i class="glyphicon glyphicon-remove"></i>
                        </a>

                        <h3><fmt:message key="simple_intro_welcome" /></h3>
                        <h4><fmt:message key="simple_intro_tyndale_house_project" /></h4>

                        <p><fmt:message key="simple_intro" /></p>

                        <fmt:bundle basename="InteractiveBundle">
                            <fmt:message key="the_pentateuch" var="pentateuch" />
                        </fmt:bundle>
                        <div class="parent-div">
                            <h5 id="accordion-heading1">Examples to use the search box to find Bibles, passages, search terms, etc.<span id="plusminus1">-</span></h5>
                            <div id="accordion-body1">
                                <br>
                                <search:sample_search explanation="simple_passage_explanation" option1="ESV" option1type="version" option2="Gen 1" option2type="reference" sampleURL="/?q=version=ESV|reference=Gen.1&options=VHNUG" />
                                <search:sample_search explanation="multiple_versions_explanation" option1="NIV" option1type="version" option2="ESV" option2type="version" option3="KJV" option3type="version" option4="Gen 1" option4type="reference" sampleURL="/?q=version=NIV|version=ESV|version=KJV|reference=Gen.1&options=HVGUN&display=COLUMN" />
                                <search:sample_search explanation="simple_search_explanation" option1="ESV" option1type="version" option2="brother" option2type="greekMeanings" sampleURL="/?q=version=ESV|strong=G0080&options=HVNGU" />
                                <%--<search:sample_search explanation="simple_search_restricted_explanation" option1="${ pentateuch }" option1type="reference" option2="ESV" option2type="version" option3="he.sed" option3type="hebrew" sampleURL="" />--%>
                                <search:sample_search explanation="chained_searches_explanation" option1="NIV" option1type="version" option2="ESV" option2type="version" option3="land" option3type="text" option4="he.sed" option4type="hebrewMeanings" sampleURL="/?q=version=NIV|version=ESV|text=land|strong=H2617a&options=VGUVNH&display=INTERLEAVED" />
                                <search:sample_search explanation="chained_searches_explanation_subject" option1="ESV" option1type="version" option2="throne" option2type="meanings" option3="David" option3type="subject" option4="Isa-Rev" option4type="reference" sampleURL="/?q=version=ESV|meanings=throne|subject=david|reference=Isa-Rev&options=HNVUG" />
                                <search:sample_search explanation="interlinear_versions_explanation" option1="KJV" option1type="version" option2="THGNT" option2type="version" option3="John 1" option3type="reference" sampleURL="/?q=version=KJV|version=THGNT|reference=John.1&options=HVLUNM&display=INTERLINEAR" showInterlinear="true" />
                            </div>
                        </div>
                        <div class="parent-div">
                            <h5 id="accordion-heading2">Examples of some Bible study tools <span id="plusminus2">+</span></h5>
                            <div id="accordion-body2">
                                <br>
                                <search:sample_search explanation="kjv_verb_imperative_explanation" option1="KJV" option1type="version" option2="Col 3" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=KJV|reference=Col.3&options=HVGUNC', 'verb, imperative mood', ' Words with a red underlines are verbs in imperative mood.')" />
                                <search:sample_search explanation="kjv_verb_main_supporting_explanation" option1="KJV" option1type="version" option2="Col 1" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=KJV|reference=Col.1&options=HVGUNC', 'verb, main vs supporting verbs', 'Words with a green underlines are usually main verbs in either indicative or imperative moods.  Words with a purple underline are support verbs in either subjunctive, optative, infinitive or particple moods.  Move your mouse over the word to see the verb grammar at the bottom of the screen.')" />
                                <search:sample_search explanation="kjv_verb_number_and_gender_explanation" option1="KJV" option1type="version" option2="Mat 1" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=KJV|reference=Mat.1&options=HVGUNC', 'gender and number', 'Word with blue color font are masculine, red are feminine and black are neuter.  Words with bold font are plural.  Mouse over a word to see the grammar of the word.')" />
                                <search:sample_search explanation="esv_word_frequency_explanation" option1="ESV" option1type="version" option2="1Jo 1" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Quick tryout links<span>&nbsp;<span class='glyphicon glyphicon-plus'>   </span></span><span class='glyphicon glyphicon-stats'></span></span>"
                                    option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=ESV|reference=1Jo.1&options=HVGUN', 'function:openStats', 'Mouse over the words on the analysis tool (on the right panel) to see where the words are located.  Select book next to Bible text field in the right panel to see the word frequency for the entire book.')" />
                            </div>
                        </div>
                        <div class="parent-div">
                            <h5 id="accordion-heading3">Examples to enable color code grammar <span id="plusminus3">+</span></h5>
                            <div id="accordion-body3">
                                <br>
                                <search:sample_search explanation="kjv_verb_color_explanation" option1="KJV" option1type="version" option2="Eph 1" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=KJV|reference=Eph.1&options=HVGUNC', 'verb, gender and number', 'Look at the color table on the lower right of the screen to see the definition of the different underlines.')" />
                                <search:sample_search explanation="sblg_verb_color_explanation" option1="SBLG" option1type="version" option2="Rom 12" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=SBLG|reference=Rom.12&options=CEMVALHUN', 'verb, gender and number', 'Look at the color table on the lower right of the screen to see the definition of the different underlines.')" />
                                <search:sample_search explanation="cun_verb_color_explanation" option1="CUn" option1type="version" option2="Col 1" option2type="reference"
                                    option3="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>" option3type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=CUn|reference=Col.1&options=HVGUNC', 'verb, gender and number', 'Look at the color table on the lower right of the screen to see the definition of the different underlines.')" />
                                <search:sample_search explanation="interlinear_verb_color_explanation" option1="SBLG" option1type="version" option2="KJV" option2type="version" option3="CUN" option3type="version" option4="Eph 5" option4type="reference"
                                    option5="<span class='glyphicon glyphicon-plus'></span><span> Color code grammar <span class='glyphicon glyphicon-ok'></span></span>"
                                    option5type="other"
                                    sampleURL="javascript:setupNextPageAndGotoUrl('/?q=version=SBLG|version=KJV|version=CUn|reference=Eph.5&options=CVLHUVNEAM&display=INTERLEAVED', 'verb, gender and number', 'Look at the color table on the lower right of the screen to see the definition of the different underlines.')" />
                                <div id='colorCodeTableDiv'></div>
                            </div>
                        </div>
                        <div class="text-muted step-copyright"><span>&copy; <a href="http://www.tyndale.cam.ac.uk" target="_blank">Tyndale House, Cambridge, UK</a> - <%= Calendar.getInstance().get(Calendar.YEAR) %><span></span></div>
                    </div>
                </div>
            </div>
            <div class="sidebar-offcanvas" id="sidebar" role="navigation"></div>
        </div>
    </div>

    <% if(request.getParameter("mobile") == null) { %>
        <%
            if(request.getParameter("lang") == null) {
        %>
        <script src="international/interactive.js?lang=<%= locale.getLanguage() %>&step.version=${project.version}" type="text/javascript"></script>
        <% } else { %>
        <script src="international/interactive.js?lang=<%= request.getParameter("lang") %>&step.version=${project.version}" type="text/javascript"></script>
        <% }
       }
     %>
    <%@include file="jsps/initLib.jsp" %>

    <%-- Now do javascript --%>
    <script type="text/javascript">
        window.tempModel = ${ not empty passageModel ? passageModel : 'undefined' };
        window.tempVersions = ${ versions };
        if(!window.step) { window.step = {} };
        step.userLanguage = "${ languageName }";
        step.userLanguageCode = "${ languageCode }";
    </script>


    <%
        if(request.getParameter("debug") != null) {
    %>

    <%-- NOTE: do not include in prod web minifying and use minified versions otherwise --%>
    <%@include file="jsps/offlineJqueryJs.jsp" %>

    <script src="libs/sprintf-0.7-beta1.js" type="text/javascript"></script>
    <script src="libs/underscore-min.js" type="text/javascript"></script>
    <script src="libs/json2.js" type="text/javascript"></script>

    <c:choose>
        <c:when test="${ param.debug eq '' }">
            <script src="libs/backbone.js" type="text/javascript"></script>
            <script src="libs/backbone.localStorage.js" type="text/javascript"></script>
            <script src="libs/select2.js" type="text/javascript"></script>
            <script src="libs/require-2.1.9.js" type="text/javascript"></script>
        </c:when>
        <c:otherwise>
            <script src="libs/backbone-min.js" type="text/javascript"></script>
            <script src="libs/backbone.localStorage-min.js" type="text/javascript"></script>
            <script src="libs/select2-3.4.5.min.js" type="text/javascript"></script>
            <script src="libs/require-2.1.9.min.js" type="text/javascript"></script>
        </c:otherwise>
    </c:choose>
    <script src="libs/jquery-sortable.js" type="text/javascript"></script>

    <%-- Do these need to use $.ready? --%>
    <script src="js/require_config_dev.js" type="text/javascript"></script>
    <script src="js/jquery-extensions/jquery-cookie.js" type="text/javascript"></script>
    <script src="js/jquery-extensions/jquery-sort.js" type="text/javascript"></script>
    <script src="js/step_constants.js" type="text/javascript"></script>
    <script src="js/step.util.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_main_search.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_restore.js" type="text/javascript"></script>

    <script src="js/backbone/step_router.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_display.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_display_passage.js" type="text/javascript"></script>
    <script src="js/backbone/models/model_history.js" type="text/javascript"></script>
    <script src="js/backbone/models/passage_model.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_menu_passage.js" type="text/javascript"></script>
    <script src="js/backbone/models/model_settings.js" type="text/javascript"></script>
    <script src="js/backbone/views/view_feedback.js" type="text/javascript"></script>
    <script src="js/state/step.state.js" type="text/javascript"></script>
    <script src="js/passage/step.passage.js" type="text/javascript"></script>
    <script src="js/defaults/step.defaults.js" type="text/javascript"></script>
    <script src="js/step_ready.js" type="text/javascript"></script>
    <script src="js/color_code_grammar.js" type="text/javascript"></script>

        <%
		} else {
	%>
        <%-- If local, then we need to include our own copy of JQuery. Otherwise, include from CDN --%>
        <%
            if(appManager.isLocal()) {
        %>
    <%@include file="jsps/offlineJqueryJs.jsp" %>
        <%
            } else {
        %>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript" ></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
        <%
            }
        %>

    <c:choose>
        <c:when test="${ param.mobile eq 'online' }">
            <script type="text/javascript">
                var languages = document.createElement("script");
                languages.src = 'international/interactive-en.js';
                languages.id = "international";
                languages.async = false;
                document.head.appendChild(languages);

                var stepJs = document.createElement("script");
                stepJs.src = 'js/step.${project.version}.min.js';
                stepJs.id = "international";
                stepJs.async = false;
                document.head.appendChild(stepJs);
            </script>
        </c:when>
        <c:otherwise>
            <script src="js/step.${project.version}.min.js" type="text/javascript" ></script>
	        <script src="js/color_code_grammar.${project.version}.min.js" type="text/javascript" ></script>
        </c:otherwise>
    </c:choose>
    <%
	}
	%>

    <% if(!appManager.isLocal()) { %>
    <script>
        (function(w, d, s) {
            function go(){
                var js, fjs = d.getElementsByTagName(s)[0], load = function(url, id) {
                    if (d.getElementById(id)) {return;}
                    js = d.createElement(s); js.src = url; js.id = id;
                    js.async = 'async';
                    fjs.parentNode.insertBefore(js, fjs);
                };

                load('//connect.facebook.net/en_GB/all.js#xfbml=1', 'fbjssdk');
                load('https://apis.google.com/js/plusone.js', 'gplus1js');
                load('//platform.twitter.com/widgets.js', 'tweetjs');
                load('//rum-static.pingdom.net/prum.min.js','pingdom');


                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                ga('create', '${analyticsToken}', 'auto');
                ga('require', 'displayfeatures');
                ga('send', 'pageview');
            }
            if (w.addEventListener) { w.addEventListener("load", go, false); }
            else if (w.attachEvent) { w.attachEvent("onload",go); }
        }(window, document, 'script'));
    </script>
    <% } %>
    <script>
        $(document).ready(function(){
            if (typeof displayQuickTryoutAccordion1 !== "undefined") {
                var tmp = localStorage.getItem('stepBible-displayQuickTryoutAccordion1');
                if (tmp) displayQuickTryoutAccordion1 = JSON.parse(tmp);
                if (displayQuickTryoutAccordion1 == true) {
                    $("#accordion-body1").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus1").text('-');  /* add minus sign */
                }
                else {
                    $("#accordion-body1").slideUp(600); /*if content not visible then show the accordion-body */
                    $("#plusminus1").text('+');  /* add minus sign */
                }
            }
            if (typeof displayQuickTryoutAccordion2 !== "undefined") {
                var tmp = localStorage.getItem('stepBible-displayQuickTryoutAccordion2');
                if (tmp) displayQuickTryoutAccordion2 = JSON.parse(tmp);
                if (displayQuickTryoutAccordion2 == true) {
                    $("#accordion-body2").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus2").text('-');  /* add minus sign */
                }
                else {
                    $("#accordion-body2").slideUp(600); /*if content not visible then show the accordion-body */
                    $("#plusminus2").text('+');  /* add minus sign */
                }
            }
            if (typeof displayQuickTryoutAccordion3 !== "undefined") {
                var tmp = localStorage.getItem('stepBible-displayQuickTryoutAccordion3');
                if (tmp) displayQuickTryoutAccordion3 = JSON.parse(tmp);
                if (displayQuickTryoutAccordion3 == true) {
                    $("#accordion-body3").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus3").text('-');  /* add minus sign */
                }
                else {
                    $("#accordion-body3").slideUp(600); /*if content not visible then show the accordion-body */
                    $("#plusminus3").text('+');  /* add minus sign */
                }
            }

            $("#accordion-heading1").click(function() {
                if($("#accordion-body1").is(':visible')) {  /* check the condition accordion-body is visible or not */
                    $("#accordion-body1").slideUp(600);  /*if content is visible then close accordion-body with specific time duration */
                    $("#plusminus1").text('+')    /* add plus sign */
                    if (typeof displayQuickTryoutAccordion1 !== "undefined") displayQuickTryoutAccordion1 = false;
                }
                else{
                    $("#accordion-body1").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus1").text('-');  /* add minus sign */
                    if (typeof displayQuickTryoutAccordion1 !== "undefined") displayQuickTryoutAccordion1 = true;
                }
                if (typeof displayQuickTryoutAccordion1 !== "undefined") localStorage.setItem('stepBible-displayQuickTryoutAccordion1', JSON.stringify(displayQuickTryoutAccordion1));
            });

            $("#accordion-heading2").click(function() {
                if($("#accordion-body2").is(':visible')) {  /* check the condition accordion-body is visible or not */
                    $("#accordion-body2").slideUp(600);  /*if content is visible then close accordion-body with specific time duration */
                    $("#plusminus2").text('+')    /* add plus sign */
                    if (typeof displayQuickTryoutAccordion2 !== "undefined") displayQuickTryoutAccordion2 = false;
                }
                else{
                    $("#accordion-body2").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus2").text('-');  /* add minus sign */
                    if (typeof displayQuickTryoutAccordion2 !== "undefined") displayQuickTryoutAccordion2 = true;
                }
                if (typeof displayQuickTryoutAccordion2 !== "undefined") localStorage.setItem('stepBible-displayQuickTryoutAccordion2', JSON.stringify(displayQuickTryoutAccordion2));
            });

            $("#accordion-heading3").click(function(){
                if($("#accordion-body3").is(':visible')){  /* check the condition accordion-body is visible or not */
                    $("#accordion-body3").slideUp(600);  /*if content is visible then close accordion-body with specific time duration */
                    $("#plusminus3").text('+')    /* add plus sign */
                    if (typeof displayQuickTryoutAccordion3 !== "undefined") displayQuickTryoutAccordion3 = false;
                }
                else{
                    $("#accordion-body3").slideDown(600); /*if content not visible then show the accordion-body */
                    $("#plusminus3").text('-');  /* add minus sign */
                    if (typeof displayQuickTryoutAccordion3 !== "undefined") displayQuickTryoutAccordion3 = true;
                }
                if (typeof displayQuickTryoutAccordion3 !== "undefined") localStorage.setItem('stepBible-displayQuickTryoutAccordion3', JSON.stringify(displayQuickTryoutAccordion3));
            });

        });
    </script>

</body>
</html>
