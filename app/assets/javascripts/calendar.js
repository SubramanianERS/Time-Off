function eventCalendar() {
    return $('#calendar').fullCalendar({
        events: '/events.json',
        selectable: true,
        initialView: 'dayGridMonth',
        select: function(startDate,endDate) {
            alert('selected ' + info1 + ' '+info2);
        }
     });
};
  
function clearCalendar() {
    $('#calendar').fullCalendar('delete'); 
    $('#calendar').html('');
};

$(document).on('turbolinks:load', function(){
    eventCalendar();  
});

$(document).on('turbolinks:before-cache', clearCalendar);