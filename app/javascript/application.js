// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import './jquery';
import "./best_in_place"
//import "./best_in_place.jquery-ui"

$(document).ready(function() {
    /* Activating Best In Place */
    $(".best_in_place").best_in_place();
    $('.best_in_place').bind("ajax:success", function () { $(this).addClass('success'); });
});