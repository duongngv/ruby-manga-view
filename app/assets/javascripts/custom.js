document.addEventListener('turbolinks:load', function () {
  $(document).ready(function () {
    $('.dropdown-toggle').dropdown();

    $('#image-upload').bind('change', function () {
      var size_in_megabytes = this.files[0].size / 1024 / 1024;
      if (size_in_megabytes > 5) {
        alert(I18n.t("mix.message_warning_thumb_size"));
      }
    });

    $.uploadPreview({
      input_field: '#image-upload',
      preview_box: '#image-preview',
      label_field: '#image-label',
      label_default: I18n.t("mix.label_default"),
      label_selected: I18n.t("mix.label_selected"),
      no_label: false
    });

    var key = '';
    $('.valid-input1').on('keyup', function () {
      if (key.length <= 100) {
        key = $('.valid-input1').val()
      } else {
        $('.valid-input1').val(key)
      }
      var charCount = $.trim($(this).val()).length;
      $('.result1').text(charCount + '/100');
    });

    var key = '';
    $('.valid-input2').on('keyup', function () {
      if (key.length <= 100) {
        key = $('.valid-input2').val()
      } else {
        $('.valid-input2').val(key)
      }
      var charCount = $.trim($(this).val()).length;
      $('.result2').text(charCount + '/100');
    });

    var key = '';
    $('.valid-input3').on('keyup', function () {
      if (key.length <= 2000) {
        key = $('.valid-input3').val()
      } else {
        $('.valid-input3').val(key)
      }
      var charCount = $.trim($(this).val()).length;
      $('.result3').text(charCount + '/2000');
    });
  });
});
