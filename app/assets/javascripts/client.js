var init_client_lookup;

init_client_lookup = function(){

$('#client-lookup-form').on('ajax:before', function(event, data, status){

show_spinner();

});

$('#client-lookup-form').on('ajax:after', function(event, data, status){

hide_spinner();

});

$('#client-lookup-form').on('ajax:success', function(event, data, status){

$('#client-lookup').replaceWith(data);

init_client_lookup();

});

$('#client-lookup-form').on('ajax:error', function(event, xhr, status, error){

hide_spinner();

$('#client-lookup-results').replaceWith(' ');

$('#client-lookup-errors').replaceWith('Person was not found.');

});

}

$(document).ready(function() {

init_client_lookup();

})