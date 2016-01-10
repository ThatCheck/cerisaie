<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:base>
    <jsp:body>
        <div class="row">
            <div class="col-lg-12 portlets">
                <div class="panel">
                    <div class="panel-header panel-controls">
                        <h3><i class="fa fa-table"></i> Listes des séjours</h3>
                    </div>
                    <div class="panel-content pagination2 table-responsive">
                        <button data-toggle="modal" data-target="#editSejourModal" class="btn btn-dark"><i class="fa fa-plus"></i>Ajouter un sejour</button>
                        <table class="table table-hover" id="table-sejour">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Client</th>
                                <th>Emplacement</th>
                                <th>Date de début</th>
                                <th>Date de fin</th>
                                <th>Nombres de personnes</th>
                                <th>Voir</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-xs-12 p-0 no-bd">
                        <div class="widget">
                            <div class="widget-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div id="calendar-sejour-based"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" id="editSejourModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter/Modifier un client</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/api/sejour" method="POST">
                            <div class="form-group">
                                <label for="name">Nom</label>
                                <input type="text" class="form-control" id="name" placeholder="Nom" name="name">
                            </div>
                            <div class="form-group">
                                <label for="clients">Client</label>
                                <select class="form-control" data-search="true" name="client" id="client">
                                    <c:forEach var="client" items="${clients}">
                                        <option value="${client.id}"><c:out value="${client.name}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="emplacements">Emplacements</label>
                                <select class="form-control" data-search="true" name="emplacement" id="emplacement">
                                    <c:forEach var="emplacement" items="${emplacements}">
                                        <option value="${emplacement.id}"><c:out value="${emplacement.id}" /> - <c:out value="${emplacement.type.libelle}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="debutSejour" class="form-label">Date de début</label>
                                <div class="prepend-icon">
                                    <input type="text" name="debutSejour" id="debutSejour" class="b-datepicker form-control" placeholder="Date de début" data-orientation="top" data-lang="fr">
                                    <i class="icon-calendar"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="finSejour" class="form-label">Date de début</label>
                                <div class="prepend-icon">
                                    <input type="text" name="finSejour" id="finSejour" class="b-datepicker form-control" placeholder="Date de fin" data-orientation="top" data-lang="fr">
                                    <i class="icon-calendar"></i>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nbPersonne">Nombre de personnes</label>
                                <input type="number" class="form-control" id="nbPersonne" placeholder="nbPersonne" name="nbPersonne">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary ladda-button save" data-style="expand-right"><span class="ladda-label">Sauvegarder</span></button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <div class="modal fade" tabindex="-1" role="dialog" id="prezActivite">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter/Modifier un client</h4>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group">
                            <li class="list-group-item"><b>Nom de l'activité : </b> <span class="activity-name"></span></li>
                            <li class="list-group-item"><b>Prix : </b> <span class="activity-price"></span></li>
                            <li class="list-group-item"><b>Nombre Unité : </b> <span class="activity-unit"></span></li>
                            <li class="list-group-item"><b>Durée : </b> <span class="activity-duration"></span></li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
    </jsp:body>
</t:base>