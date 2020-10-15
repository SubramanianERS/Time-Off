// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require moment 
//= require fullcalendar
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-datepicker
//= require_tree .

$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});

function eventCalendar() {
    return $('#calendar').fullCalendar({
        events: '/holidays.json',
        selectable: true,
        initialView: 'dayGridMonth',
        select: function (startDate, endDate) {
            window.location.href = "/calendar/?create_event=true&startDate=" + new Date(startDate).toLocaleString()
                + "&endDate=" + new Date(endDate).toLocaleString()
        }
    });
};

function clearCalendar() {
    $('#calendar').fullCalendar('delete');
    $('#calendar').html('');
};

$(document).on('turbolinks:load', function () {
    eventCalendar();
});

$(document).on('turbolinks:before-cache', clearCalendar);