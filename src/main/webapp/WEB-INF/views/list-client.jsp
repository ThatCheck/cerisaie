<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <jsp:body>
        <div class="row">
            <div class="col-lg-12 portlets">
                <div class="panel">
                    <div class="panel-header panel-controls">
                        <h3><i class="fa fa-table"></i> Listes des clients</h3>
                    </div>
                    <div class="panel-content pagination2 table-responsive">
                        <button data-toggle="modal" data-target="#editClientModal" class="btn btn-dark"><i class="fa fa-plus"></i>Ajouter un client</button>
                        <table class="table table-hover" id="table-clients">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Adresse</th>
                                    <th>Code Postal</th>
                                    <th>Ville</th>
                                    <th>Piece</th>
                                    <th>Num</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" id="editClientModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter/Modifier un client</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/api/client" method="POST">
                            <div class="form-group">
                                <label for="name">Nom</label>
                                <input type="text" class="form-control" id="name" placeholder="Nom" name="name">
                            </div>
                            <div class="form-group">
                                <label for="address">Nom</label>
                                <input type="text" class="form-control" id="address" placeholder="Adresse" name="address">
                            </div>
                            <div class="form-group">
                                <label for="zipCode">Code Postal</label>
                                <input type="number" class="form-control" id="zipCode" placeholder="Code Postal" name="zipCode">
                            </div>
                            <div class="form-group">
                                <label for="city">Ville</label>
                                <input type="text" class="form-control" id="city" placeholder="Ville" name="city">
                            </div>
                            <div class="form-group">
                                <label for="piece">Piece</label>
                                <input type="text" class="form-control" id="piece" placeholder="Piece" name="piece">
                            </div>
                            <div class="form-group">
                                <label for="numPiece">Num Piece</label>
                                <input type="number" class="form-control" id="numPiece" placeholder="NumPiece" name="numPiece">
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
    </jsp:body>
</t:base>