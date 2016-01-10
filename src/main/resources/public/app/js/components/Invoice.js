var Invoice = (function($){
    var start = function() {
        $('.generate-invoice-sejour').click(function (e) {
            var l = Ladda.create(this);
            l.start();
            $.ajax({
                url: '/api/sejour/' + $('.search-sejour').select2("val"),
                method: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    var template = Handlebars.compile($("#invoice-template").html());
                    var diff_day = moment(data.finSejour).diff(moment(data.debutSejour),'days');
                    data.totalWithoutTVA = diff_day * data.nbPersonne * data.emplacement.type.price;
                    data.TVA = (diff_day * data.nbPersonne * data.emplacement.type.price) * 0.20;
                    data.totalWithTVA = (diff_day * data.nbPersonne * data.emplacement.type.price) * 1.20;
                    $('#invoice-content').html(template(data));
                },
                always: function () {
                    l.stop();
                }
            })
        });

        $('.generate-invoice-sport').click(function (e) {
            var l = Ladda.create(this);
            l.start();
            $.ajax({
                url: '/api/sejour/' + $('.search-sejour-sport').select2("val"),
                method: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    var template = Handlebars.compile($("#invoice-sport-template").html());
                    var diff_day = moment(data.finSejour).diff(moment(data.debutSejour),'days');
                    var total = 0;
                    $.each(data.activites, function(i,item){
                        total += item.nbLoc * item.sport.unitPrice;
                        data.activites[i].total = item.nbLoc * item.sport.unitPrice;
                    });
                    data.totalWithoutTVA = total;
                    data.TVA = total * 0.20;
                    data.totalWithTVA = total * 1.20;
                    $('#invoice-content').html(template(data));
                },
                always: function () {
                    l.stop();
                }
            })
        });

        $('body').on('click','.export-pdf',function(){
            var doc = new jsPDF();
            doc.fromHTML($('.invoice-page').html(), 15, 15);
            doc.save('facture.pdf');
        });



        $('body').on('click','.print',function(){
            window.print();
        });
    };


    return {
        start : start
    }
})(jQuery);
