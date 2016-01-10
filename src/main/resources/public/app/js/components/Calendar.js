var Calendar = (function($){
    function custom_sort(a, b) {
        return new Date(a.start).getTime() - new Date(b.start).getTime();
    }
    var events_array = [];
    var calendar = null;
    var $calendar = $('#calendar');
    var build = function(){
        $('#calendar').fullCalendar({
            handleWindowResize: true,
            height: $(window).height() - 200,
            lang: 'fr',
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
        });
    };
    $.getJSON('/api/sejour',function(data){
        events_array = [];
        $.each(data, function(i,item){
            var event={title: 'Sejour - ' + item.client.name, start:  moment(item.debutSejour).toDate(), end : moment(item.finSejour).toDate(), allDay: true, backgroundColor : '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6)};
            events_array.push(event);
            $calendar.fullCalendar('renderEvent', event, true);
        });
        events_array.sort(custom_sort);
        $('#calendar').fullCalendar('gotoDate', events_array[0].start);
    });
    return {
        build: build
    }
})(jQuery);