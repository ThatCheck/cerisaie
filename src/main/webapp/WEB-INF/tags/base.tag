<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="full" lang="en">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cerisaie</title>
    <link href="${pageContext.request.contextPath}/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/css/ui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/layout3/css/layout.css" rel="stylesheet">
    <!-- BEGIN PAGE STYLE -->
    <link href="${pageContext.request.contextPath}/global/plugins/metrojs/metrojs.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/plugins/datatables/dataTables.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/plugins/bootstrap-loading/lada.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">

    <!-- END PAGE STYLE -->
    <script src="${pageContext.request.contextPath}/global/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body class="sidebar-top theme-sdtl color-default">
<section>
    <div class="sidebar">
        <div class="sidebar-inner">
            <ul class="nav nav-sidebar">
                <li class="nav-active"><a href="/"><i class="fa fa-home"></i><span>Accueil</span></a></li>
                <li class="nav-active"><a href="/clients"><i class="fa fa-users"></i><span>Clients</span></a></li>
                <li class="nav-active"><a href="/sejours"><i class="fa fa-calendar"></i><span>Sejours</span></a></li>
                <li class="nav-active"><a href="/factures"><i class="fa fa-file-text"></i><span>Factures</span></a></li>
            </ul>
        </div>
    </div>
    <!-- BEGIN MAIN CONTENT -->
    <div class="main-content">
        <div class="page-content">
            <jsp:doBody/>
        </div>
    </div>
    <!-- END MAIN CONTENT -->
</section>
<div class="loader-overlay">
    <!-- PRELOADER -->
</div>
<div class="sideview">
    <!-- SIDEBAR -->
</div>
<script src="${pageContext.request.contextPath}/global/plugins/jquery/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/jquery-ui/jquery-ui-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/gsap/main-gsap.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/jquery-cookies/jquery.cookies.min.js"></script> <!-- Jquery Cookies, for theme -->
<script src="${pageContext.request.contextPath}/global/plugins/jquery-block-ui/jquery.blockUI.min.js"></script> <!-- simulate synchronous behavior when using AJAX -->
<script src="${pageContext.request.contextPath}/global/plugins/bootbox/bootbox.min.js"></script> <!-- Modal with Validation -->
<script src="${pageContext.request.contextPath}/global/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script> <!-- Custom Scrollbar sidebar -->
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script> <!-- Show Dropdown on Mouseover -->
<script src="${pageContext.request.contextPath}/global/plugins/charts-sparkline/sparkline.min.js"></script> <!-- Charts Sparkline -->
<script src="${pageContext.request.contextPath}/global/plugins/retina/retina.min.js"></script> <!-- Retina Display -->
<script src="${pageContext.request.contextPath}/global/plugins/select2/select2.min.js"></script> <!-- Select Inputs -->
<script src="${pageContext.request.contextPath}/global/plugins/icheck/icheck.min.js"></script> <!-- Checkbox & Radio Inputs -->
<script src="${pageContext.request.contextPath}/global/plugins/backstretch/backstretch.min.js"></script> <!-- Background Image -->
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script> <!-- Animated Progress Bar -->
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap-loading/lada.min.js"></script> <!-- Animated Progress Bar -->
<script src="${pageContext.request.contextPath}/global/plugins/charts-chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/noty/jquery.noty.packaged.min.js"></script>
<script src="${pageContext.request.contextPath}/app/js/templates/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/global/js/builder.js"></script> <!-- Theme Builder -->
<script src="${pageContext.request.contextPath}/global/js/sidebar_hover.js"></script> <!-- Sidebar on Hover -->
<script src="${pageContext.request.contextPath}/global/js/application.js"></script> <!-- Main Application Script -->
<script src="${pageContext.request.contextPath}/global/js/plugins.js"></script> <!-- Main Plugin Initialization Script -->
<script src="${pageContext.request.contextPath}/global/js/widgets/notes.js"></script> <!-- Notes Widget -->
<script src="${pageContext.request.contextPath}/global/js/quickview.js"></script> <!-- Chat Script -->
<!-- BEGIN PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/global/plugins/quicksearch/quicksearch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/fullcalendar/lang/fr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/jsPDF/jsPDF.js" type="text/javascript"></script>
<!-- END PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/admin/layout3/js/layout.js"></script>
<script src="${pageContext.request.contextPath}/app/js/components/datatables.js"></script>
<script src="${pageContext.request.contextPath}/app/js/components/Invoice.js"></script>
<script src="${pageContext.request.contextPath}/app/js/components/Calendar.js"></script>
<script src="${pageContext.request.contextPath}/app/js/components/CalendarSejourBased.js"></script>
<script src="${pageContext.request.contextPath}/app/js/app.js"></script>
</body>
</html>
