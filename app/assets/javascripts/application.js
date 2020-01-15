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
          new_rating(rating, this.dataset.movieId);
        }
      });
    });
  }
});

function new_rating(score, movieId) {
  $.ajax({
    type: "POST",
    url: '/api/ratings',
    dataType: 'json',
    data: {
      score: score,
      movie_id: movieId
    },
    success: function(data){
    },
    error: function (xhr, ajaxOptions, thrownError) {
    }
  });
}