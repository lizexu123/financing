//Header Small
  window.addEventListener('scroll', function(e){
    var distanceY = window.pageYOffset || document.documentElement.scrollTop,
    shrinkOn = 50;
    
    if (distanceY > shrinkOn) {
      $('header').addClass("smaller");
    } else {
      $('header').toggleClass("smaller");
    }
  });

$(window).load(function() {
  $('body').addClass('loaded');
});

