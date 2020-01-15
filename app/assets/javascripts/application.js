//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(function() {
  if($('.movie-rating').length > 0 ){
    $.each($('.movie-rating'), function( index, value ) {
      $(value).rateYo({
        starWidth: "20px",
        numStars: 5,
        halfStar: true,
        onSet: function (rating, rateYoInstance) {
          byebug
          console.log(rating);
        }
      });
    });
  }
});