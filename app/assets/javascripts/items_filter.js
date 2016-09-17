$(document).ready(function(){
  
  var $items = $('.index-item-container');
  
  $("#new-balance-link").on('click', function(){
    $items.each(function(index, item){
      if ($(item).data("brand") !== "new-balance"){
        $(item).toggle("slow");
      };
    });
  });
});