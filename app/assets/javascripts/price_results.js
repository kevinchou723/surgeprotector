$(document).ready(function() {

  var maxResults = 0;
  var queryResults = 0;

  // find max results for a query
  $('.query').each(function() {
    queryResults = $(this).children().length;
    if (queryResults > maxResults) {
      maxResults = queryResults;
      queryResults = 0;
    }
    else {
      queryResults = 0;
    }
  });

  // set width of each result relative to container width
  var resultWidth = $('.container').width() / (maxResults - 3);

  $('.result').each(function() {
    $(this).css('width', resultWidth);
  });

  // change background color of results based on surge multiplier
  $('.surge-mult').each(function() {
    if (parseFloat($(this).html()) >= 2.0) {
      $(this).parent().parent().css('background-color', '#FF5242');
    }
    else if (parseFloat($(this).html()) >= 1.75) {
      $(this).parent().parent().css('background-color', '#FF7E44');
    }
    else if (parseFloat($(this).html()) >= 1.5) {
      $(this).parent().parent().css('background-color', '#FFCA54');
    }
    else if (parseFloat($(this).html()) >= 1.25) {
      $(this).parent().parent().css('background-color', '#FFF355');
    }
    else if (parseFloat($(this).html()) >= 1.0) {
      $(this).parent().parent().css('background-color', '#44FF44');
    }
  });

  // track mouse position on the page
  var mouseX;
  var mouseY;
  $(document).mousemove(function(e) {
    mouseX = e.pageX; 
    mouseY = e.pageY;
  });

  // use mouse position to determine position of details pop-up
  $('.result').each(function() {
    $(this).mouseover(function() {
      $('.details').html('');
      $('.details').css({
        'position': 'absolute',
        'top': mouseY,
        'left': mouseX,
        'background-color': '#FFF',
        'border': '1px solid black'
      }).show();
      $('.details').append($(this).html());
    });
    $(this).mouseout(function(){
      $('.details').hide();
    });
  });

});