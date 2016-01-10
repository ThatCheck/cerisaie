$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};


var Cerisaie = {};
Cerisaie.noty = function(title, text){
    var n = noty({
        text: '<div class="alert alert-info clearfix"><h4 class="alert-title">' + title + '</h4><p class="alert-message pull-left"> ' + text + ' </p></div>',
        layout: 'topRight', //or left, right, bottom-right...
        theme: 'made',
        timeout: '3000',
        maxVisible: 10,
        animation: {
            open: 'animated bounceInLeft',
            close: 'animated bounceOutLeft'
        }
    });
};

Cerisaie.listClient = $(function()
{
    if($('#table-clients').length > 0)
    {
        DatatablesManagement.setBaseRouting('/api/client/');
        DatatablesManagement.setIdTable('#table-clients');
        DatatablesManagement.addColumns({ "data": "id" });
        DatatablesManagement.addColumns({ "data": "name" });
        DatatablesManagement.addColumns({ "data": "address" });
        DatatablesManagement.addColumns({ "data": "zipCode" });
        DatatablesManagement.addColumns({ "data": "city" });
        DatatablesManagement.addColumns({ "data": "piece" });
        DatatablesManagement.addColumns({ "data": "numPiece" });
        DatatablesManagement.build();
    }
});

Cerisaie.listSejour = $(function()
{
    if($('#table-sejour').length > 0)
    {
        DatatablesManagement.setBaseRouting('/api/sejour/');
        DatatablesManagement.setIdTable('#table-sejour');
        DatatablesManagement.addColumns({ "data": "id" });
        DatatablesManagement.addColumns({ "data": "client.name" });
        DatatablesManagement.addColumns({ "data": "emplacement.id" });
        DatatablesManagement.addColumns({ "data": "debutSejour" });
        DatatablesManagement.addColumns({ "data": "finSejour" });
        DatatablesManagement.addColumns({ "data": "nbPersonne" });
        DatatablesManagement.addColumns({
            data: null,
            className: "text-center",
            defaultContent: '<a class="show-sejour btn btn-sm btn-default" href="javascript:;"><i class="fa fa-search"></i>Voir</a>'
        });
        DatatablesManagement.build();
        CalendarSejourBased.build();
    }
});

Cerisaie.invoice = $(function(){
   if($('#invoice-page').length > 0)
   {
       Invoice.start();
   }
});


Cerisaie.calendar = $(function(){
    if($('#calendar').length > 0)
    {
        Calendar.build();
    }
});
$(document).ready(function() {
});