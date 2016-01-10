var CalendarSejourBased = (function($,table){
    function custom_sort(a, b) {
        return new Date(a.start).getTime() - new Date(b.start).getTime();
    }

    var events_array = [];
    var calendar = null;
    var $calendar = $('#calendar-sejour-based');

    var build = function(){
        $calendar.fullCalendar({
            handleWindowResize: true,
            height: $(window).height() - 200,
            lang: 'fr',
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            eventClick: function (calEvent, jsEvent, view, eventid) {
                console.log(view);
                if(calEvent.id.indexOf('a') !== -1){
                    var id = calEvent.id.substring(2);
                    $.getJSON('/api/activity/'+id,function(data){
                        $('.activity-name').text(data.sport.libelle);
                        $('.activity-price').text(data.sport.unitPrice);
                        $('.activity-unit').text(data.nbLoc);
                        $('.activity-duration').text(data.sport.unite);
                        $('#prezActivite').modal('show');
                    });
                }
            }
        });
    };

    $('body').on('click','.show-sejour',function(){
        $calendar.fullCalendar('removeEvents');
        var id = table.getTable().row($(this).closest('tr')).data()['id'];
        $.getJSON('/api/sejour/'+id,function(item){
            var event={id: 'c_'+item.id, title: 'Sejour - ' + item.client.name, start:  moment(item.debutSejour).toDate(), end : moment(item.finSejour).toDate(), allDay: true, backgroundColor : '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)};
            $calendar.fullCalendar('renderEvent', event, true);
            $.each(item.activites,function(i,data){
                var event={id: 'a_'+item.id, className:'activity', title: 'Activité - ' + data.sport.libelle, start:  moment(data.datejour).toDate(), end: moment(data.datejour).toDate(), allDay: true, backgroundColor : '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)};
                $calendar.fullCalendar('renderEvent', event, true);
            });
            $calendar.fullCalendar('gotoDate', event.start);
        });
    });

    return {
        build: build
    }
})(jQuery,DatatablesManagement);
