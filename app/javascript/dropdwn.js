$(function(){
  $('.lists-left li').hover(function(){
    $(this).children('ul').show();
  }, function(){
    $(this).children('ul').hide();
  });
});