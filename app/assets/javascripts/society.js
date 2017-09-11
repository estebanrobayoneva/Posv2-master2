var init_society_lookup;

init_society_lookup = function(){

$('#society-lookup-form').on('ajax:before', function(event, data, status){

show_spinner();

});

$('#society-lookup-form').on('ajax:after', function(event, data, status){

hide_spinner();

});

$('#society-lookup-form').on('ajax:success', function(event, data, status){


$('#society-lookup').replaceWith(data);

init_society_lookup();

});

$('#society-lookup-form').on('ajax:error', function(event, xhr, status, error){

hide_spinner();

$('#society-lookup-results').replaceWith(' ');

$('#society-lookup-errors').replaceWith('Person was not found.');

});

}

$(document).ready(function() {

init_society_lookup();

})