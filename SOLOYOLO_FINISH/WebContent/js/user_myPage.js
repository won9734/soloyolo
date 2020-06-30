$(function() {

    $(document).ready(function() {
  
      var scrollOffset = $('.mymenu').offset();
  
      $(window).scroll(function() {
        if ($(document).scrollTop() > scrollOffset.top) {
          $('.mymenu').addClass('scroll-fixed');
          $('.mymenu').css("margin","0");
        }
        else {
          $('.mymenu').removeClass('scroll-fixed');
          $('.mymenu').css("margin","0 auto");
          $('.mymenu').css("margin-top","40px");
        }
      });
    } );
  
  });