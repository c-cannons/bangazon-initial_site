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
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

$("search-input").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();
        $("searchbar").submit();
    }
});
function localDelivery() {
    if ($('#delivery-checkbox').is(":checked")) {
        $('#local-delivery').removeAttr('class');
        $('#local-delivery').css('display', 'block');
    }
    else {
        $('#local-delivery').css('display', 'none');
    }
}

function changeSearch() {
    if ($('#search_by_name').is(':checked')) {
        $('.search-by-label').html(' City ').hide(0).fadeIn('slow');
    } else {
        $('.search-by-label').html(' Product ').hide(0).fadeIn('slow');
    }
}

