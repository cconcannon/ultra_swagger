$(document).ready(function(){
  
  var $items = $('.index-item-container');
  var $brands = $('brand-checkboxes');
  
  $('input[type="checkbox"]').change(function(){
    var brand_checkbox = $(this.id)["selector"]
    $items.each(function(index, item){
      if ($(item).data("brand")+"-checkbox" == brand_checkbox){
        $(item).toggle("slow");
      };
    });
  });
});