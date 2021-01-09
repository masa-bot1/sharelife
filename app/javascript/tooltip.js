$(function () {
  $('.tooltip').hide();
  $('ul').hover(
  function () {
      $(this).children('.tooltip').fadeIn('fast');
  },
  function () {
      $(this).children('.tooltip').fadeOut('fast');
  });
});