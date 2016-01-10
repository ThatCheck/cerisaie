<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:base>
    <jsp:body>
        <div id="invoice-page">
            <div class="row">
                <div class="col-lg-6">
                    <h2>Générer une facture pour un séjour</h2>
                    <div class="col-lg-10">
                        <select class="form-control search-sejour" data-search="true">
                            <c:forEach var="sejour" items="${sejours}">
                                <option value="${sejour.id}"><c:out value="${sejour.id}" /> - <c:out value="${sejour.client.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="ladda-button btn btn-primary generate-invoice-sejour" data-style="expand-right"><span class="ladda-label">Génerer</span></button>
                </div>
                <div class="col-lg-6">
                    <h2>Générer une facture pour les activités sportives d'un séjour</h2>
                    <div class="col-lg-10">
                        <select class="form-control search-sejour-sport" data-search="true">
                            <c:forEach var="sejour" items="${sejours}">
                                <option value="${sejour.id}"><c:out value="${sejour.id}" /> - <c:out value="${sejour.client.name}"></c:out></option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="ladda-button btn btn-primary generate-invoice-sport" data-style="expand-right"><span class="ladda-label">Génerer</span></button>
                </div>
            </div>
            <div id="invoice-content">

            </div>
        </div>

        <script id="invoice-sport-template" type="text/x-handlebars-template">
            <div class="header">
                <h2><strong>Facture</strong> n°<span class="facture-num">{{id}}</span></h2>
            </div>
            <div class="m-t-10 m-b-10 no-print">
                <button type="button" class="btn btn-white m-r-10 m-b-10 print"><i class="fa fa-print m-r-10"></i> Imprimer</button>
                <button type="button" class="btn btn-white m-r-10 m-b-10 export-pdf"><i class="fa fa-file-text m-r-10"></i> Exporter en PDF</button>
            </div>
            <div class="row invoice-page">
                <div class="col-md-12 p-t-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <h4 class="w-500 c-gray f-14"><strong>De</strong></h4>
                                <address>
                                    <p class="width-300 m-t-10"><strong>Cerisaie</strong></p>
                                    <abbr title="Phone">Télephone:</abbr> 05-67-78-56-45
                                </address>
                            </div>
                            <div class="pull-right">
                                <h4 class="w-500 c-gray f-14"><strong>A</strong></h4>
                                <address>
                                    <p class="width-300 m-t-10 client-name"><strong>{{client.name}}</strong></p>
                                    <p class="width-300" class="client-adress">{{client.address}}</p>
                                    <p class="width-300" class="client-cp">{{ client.zipCode}} - {{client.city}}</p>
                                </address>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12 m-t-20 m-b-20">
                                    <p><strong>Date de facturation:</strong> <span>{{finSejour}}</span></p>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Nom</th>
                                    <th>Prix/unite</th>
                                    <th>Nombre unité</th>
                                    <th>Montant</th>
                                </tr>
                                </thead>
                                <tbody>
                                {{# each activites}}
                                <tr class="item-row">
                                    <td>
                                        <p >{{datejour}}</p>
                                    </td>
                                    <td>
                                        <p >{{sport.libelle}}</p>
                                    </td>
                                    <td>
                                        <p class="">{{sport.unitPrice}}€</p>
                                    </td>
                                    <td>
                                        <p class="">{{nbLoc}}</p>
                                    </td>
                                    <td>
                                        <p class="">{{total}}€</p>
                                    </td>
                                </tr>
                                {{/each}}
                                <tr>
                                    <td colspan="3" rowspan="5"></td>
                                    <td class="text-right"><strong>Total sans TVA</strong></td>
                                    <td class="text-right" id="subtotal">{{totalWithoutTVA}}€</td>
                                </tr>
                                <tr>
                                    <td class="text-right no-border"><strong>TVA</strong></td>
                                    <td class="text-right">{{TVA}}€</td>
                                </tr>
                                <tr>
                                    <td class="text-right no-border">
                                        <div><strong>Total</strong></div>
                                    </td>
                                    <td class="text-right" id="total">{{totalWithTVA}}€</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </script>

        <script id="invoice-template" type="text/x-handlebars-template">
            <div class="header">
                <h2><strong>Facture</strong> n°<span class="facture-num">{{id}}</span></h2>
            </div>
            <div class="m-t-10 m-b-10 no-print">
                <button type="button" class="btn btn-white m-r-10 m-b-10 print"><i class="fa fa-print m-r-10"></i> Imprimer</button>
                <button type="button" class="btn btn-white m-r-10 m-b-10 export-pdf"><i class="fa fa-file-text m-r-10"></i> Exporter en PDF</button>
            </div>
            <div class="row invoice-page">
                <div class="col-md-12 p-t-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-left">
                                <h4 class="w-500 c-gray f-14"><strong>De</strong></h4>
                                <address>
                                    <p class="width-300 m-t-10"><strong>Cerisaie</strong></p>
                                    <abbr title="Phone">Télephone:</abbr> 05-67-78-56-45
                                </address>
                            </div>
                            <div class="pull-right">
                                <h4 class="w-500 c-gray f-14"><strong>A</strong></h4>
                                <address>
                                    <p class="width-300 m-t-10 client-name"><strong>{{client.name}}</strong></p>
                                    <p class="width-300" class="client-adress">{{client.address}}</p>
                                    <p class="width-300" class="client-cp">{{ client.zipCode}} - {{client.city}}</p>
                                </address>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12 m-t-20 m-b-20">
                                    <p><strong>Date de facturation:</strong> <span>{{finSejour}}</span></p>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Date de début</th>
                                    <th>Date de fin</th>
                                    <th>Nombre de personne</th>
                                    <th>prix/jour/personne</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="item-row">
                                    <td>
                                        <p >{{debutSejour}}</p>
                                    </td>
                                    <td>
                                        <p >{{finSejour}}</p>
                                    </td>
                                    <td>
                                        <p class="">{{nbPersonne}}</p>
                                    </td>
                                    <td class="text-right price">{{emplacement.type.price}}€ </td>
                                </tr>
                                <tr>
                                    <td colspan="2" rowspan="4"></td>
                                    <td class="text-right"><strong>Total sans TVA</strong></td>
                                    <td class="text-right" id="subtotal">{{totalWithoutTVA}}€</td>
                                </tr>
                                <tr>
                                    <td class="text-right no-border"><strong>TVA</strong></td>
                                    <td class="text-right">{{TVA}}€</td>
                                </tr>
                                <tr>
                                    <td class="text-right no-border">
                                        <div><strong>Total</strong></div>
                                    </td>
                                    <td class="text-right" id="total">{{totalWithTVA}}€</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </script>
    </jsp:body>
</t:base>