//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(function() {
  if($('.movie-rating').length > 0 ){
    $.each($('.movie-rating'), function( index, element ) {
      init_callback(element);
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
      re_init_callback(data.movie, data.rating);
      update_rating_text(data.movie);
    },
    error: function (xhr, ajaxOptions, thrownError) {
    }
  });
}

function update_rating(score, ratingId) {
  $.ajax({
    type: "PATCH",
    url: '/api/ratings/' + ratingId,
    dataType: 'json',
    data: {
      score: score
    },
    success: function(data){
      update_rating_text(data.movie);
    },
    error: function (xhr, ajaxOptions, thrownError) {
    }
  });
}

function update_rating_text(movie) {
  var element_id = 'movie-card-' + movie.id;
  var card = $('#' + element_id);
  card.find('.average_rate').text('Rating: ' + Math.round(movie.average_rate));
}

function re_init_callback(movie, rating){
  var element_id = 'movie-card-' + movie.id;
  var card = $('#' + element_id);
  var rating_element = card.find('.movie-rating')[0];
  rating_element.dataset.ratingId = rating.id;
  rating_element.dataset.currentScore = rating.score;
  $(rating_element).rateYo("destroy");
  init_callback(rating_element);
}

function init_callback(element){
  var movie_score = element.dataset.currentScore;
  movie_score = (movie_score == '') ? 0 : movie_score;
  var current_rating_id = element.dataset.ratingId;

  $(element).rateYo({
    rating: movie_score,
    starWidth: "20px",
    numStars: 5,
    precision: 2,
    fullStar: true,
    onSet: function (rating, rateYoInstance) {
      if(rating == '0'){
        alert('Rating must between 1 to 5');
      }else{
        if(current_rating_id == ''){
          new_rating(rating, this.dataset.movieId);
        } else {
          update_rating(rating, current_rating_id)
        }
      }
    }
  });
}