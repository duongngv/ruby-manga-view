document.addEventListener("turbolinks:load", function () {
  (function ($) {
    $(".selection-1").select2({
      minimumResultsForSearch: 20,
      dropdownParent: $('#dropDownSelect1')
    });
  })(jQuery);
});
