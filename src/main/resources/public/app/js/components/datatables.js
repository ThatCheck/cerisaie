var DatatablesManagement = (function($){
    var ui = {
        table : null
    };

    var editedID = null;

    var dataTablesOptions = {
        columns : [],
        idTable : ''
    };

    var routing = {
        base :  ''
    };

    var getTable = function(){
        return ui.table;
    };

    var setBaseRouting = function(url){
        routing.base = url;
    };

    var setIdTable = function(id){
        dataTablesOptions.idTable = id;
    };

    var setColumns = function(columns){
        dataTablesOptions.columns = columns;
    };

    var addColumns = function(column){
      dataTablesOptions.columns.push(column);
    };

    /**
     * Build the datatables
     */
    var build  = function(){
        dataTablesOptions.columns.push({
            data: null,
            className: "text-right",
            defaultContent: '<a class="edit btn btn-sm btn-default" href="javascript:;"><i class="fa fa-pencil"></i></a> <a class="delete btn btn-sm btn-danger" href="javascript:;"><i class="fa fa-trash"></i></a>'
        });
        ui.table = $(dataTablesOptions.idTable).DataTable({
            "columns": dataTablesOptions.columns,
            "ajax": {
                "url": routing.base,
                "type": "GET",
                "dataSrc": ""
            }
        });
        addListener.all();
    };


    /**
     * Add all listener
     * @type {{edit: addListener.edit, delete: addListener.delete, save: addListener.save, all: addListener.all}}
     */
    var addListener = {
        edit : function(){
            $('body').on('click','.edit',function(e){
                var id = ui.table.row($(this).closest('tr')).data()['id'];
                e.preventDefault();
                var $modal = $('.modal');
                $modal.modal('show');
                var $form = $modal.find('form');
                $.ajax({
                    url : routing.base + id,
                    method : 'GET',
                    success : function(data){
                        $.each(data, function(i,item){
                            var input = $form.find('input[name="'+i+'"]');
                            if(input.length > 0){
                                input.val(item);
                            }
                        });
                        editedID = data.id;
                    }
                })
            });
        },
        delete: function () {
            $('body').on('click', '.delete', function (e) {
                e.preventDefault();
                var $this = this;
                bootbox.confirm("Voulez vous vraiment supprimer le client ?", function (result) {
                    if (result == true) {
                        var id = ui.table.row($($this).closest('tr')).data()['id'];
                        $.ajax({
                            url: routing.base + id,
                            method: 'DELETE',
                            success: function (data) {
                                Cerisaie.noty('Informations Clients', 'Le client a bien été supprimé');
                                ui.table.ajax.reload(null, false);
                            }
                        });
                    }
                });
            });
        },
        save: function () {
            $('.save').click(function () {
                var $modal = $(this).closest('.modal');
                var $form = $modal.find('form');
                var l = Ladda.create(this);
                l.start();
                $.ajax({
                    url: editedID == null ? $form.attr('action') : routing.base + editedID,
                    method: editedID == null ? $form.attr('method') : 'PUT',
                    data: JSON.stringify($form.serializeObject()),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        editedID == null ? Cerisaie.noty('Informations Clients', 'Le client a bien été ajouté') : Cerisaie.noty('Informations Clients', 'Le client a bien été modifié');
                        ui.table.ajax.reload(null, false);
                        $modal.modal('hide');
                        editedID = null;
                    },
                    always: function () {
                        l.stop();
                    }
                });
            });
        },
        all: function () {
            addListener.delete();
            addListener.save();
            addListener.edit();
        }
    };

    return {
        setBaseRouting : setBaseRouting,
        setIdTable : setIdTable,
        setColumns : setColumns,
        addColumns : addColumns,
        build : build,
        getTable: getTable
    }
})(jQuery);
