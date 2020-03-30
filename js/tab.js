      // Wait until the DOM has loaded before querying the document
      $(document).ready(function(){
        $('ul.tabs').each(function(){
          // For each set of tabs, we want to keep track of
          // which tab is active and it's associated content
          var $active, $content, $links = $(this).find('a');

          // If the location.hash matches one of the links, use that as the active tab.
          // If no match is found, use the first link as the initial active tab.
          $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
          $active.addClass('active');

          $content = $($active[0].hash);

          // Hide the remaining content
          $links.not($active).each(function () {
            $(this.hash).hide();
          });

          // Bind the click event handler
          $(this).on('click', 'a', function(e){
            // Make the old tab inactive.
            $active.removeClass('active');
            $content.hide();

            // Update the variables with the new link and content
            $active = $(this);
            $content = $(this.hash);

            // Make the tab active.
            $active.addClass('active');
            $content.show();

            // Prevent the anchor's default click action
            e.preventDefault();
          });
        });
      });

$(document).ready(function(){
    $("#male_shoes_size").hide();
    $("#female_shoes_size").hide();
    
    $("#male").click(function(){
    $("#female_shoes_size").hide();
    $("#male_shoes_size").show(500);
    });
  
    $("#female").click(function(){
    $("#male_shoes_size").hide();
    $("#female_shoes_size").show(500);
    });
});

$(document).ready(function(){
    $("#color_span").click(function(){
      var temp = "<tr id='image_span'><td class='cart_description'><p><label for='image_url'>Image_url:</label></p><input type='text' name='image_url'></td></tr>";
      $("#image_span").append(temp);
    });
});
 $(document).ready(function(){
     $("#delete_male_shoes_size").hide();
     $("#delete_female_shoes_size").hide();
    
     $("#delete_male").click(function(){
     $("#delete_female_shoes_size").hide();
     $("#delete_male_shoes_size").show(500);
     });
  
     $("#delete_female").click(function(){
     $("#delete_male_shoes_size").hide();
     $("#delete_female_shoes_size").show(500);
     });
 });