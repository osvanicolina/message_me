// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as jquery from "jquery"
import "semantic-ui" 
import "channels"

window.scroll_bottom = () => {
    if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
    console.log("scroll_bottom");
}

window.clear_input = () => {
    $('#message_body').val("");
}


$(
    function() {     
        $('.ui.dropdown').dropdown();
    }
);

// add auto scroll to bottom in messages
$(document).on('turbo:load', function() {
    scroll_bottom();
});

