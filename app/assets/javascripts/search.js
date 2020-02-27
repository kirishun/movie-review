$(function() {

  var search_list = $(".movies");

  function appendMovie(movie) {
    var html = `<div class='movie'>
                  <a href = "/movies/${movie.id}" data-method="get">
                    <img src= "${movie.image.url}" width="200" height="250">
                  </a>
                </div>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='movie'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-form").on("keyup", function() {
    var input = $(".search-form").val();
    $.ajax({
      type: 'GET',
      url: '/movies/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(movies) {
      search_list.empty();
      if (movies.length !== 0) {
        movies.forEach(function(movie){
          appendMovie(movie);
        });
      }
      else {
        appendErrMsgToHTML("一致するデータがありません")
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});