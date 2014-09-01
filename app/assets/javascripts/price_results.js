$(document).ready(function() {

  // script for price_queries index

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
    var setWidth = function() {
      var resultWidth = $('.center').width() / (maxResults - 3);
      $('.result').each(function() {
        $(this).css('width', resultWidth);
      });
    };

    setInterval(setWidth, 1);

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
          'top': mouseY - ($('.center').width() * 0.13),
          'left': mouseX - ($('.center').width() * 0.28),
          'background-color': '#FFF',
          'border': '1px solid black'
        }).show();
        $('.details').append($(this).html());
      });
      $(this).mouseout(function(){
        $('.details').hide();
      });
    });


  // script for price_queries show page

  var hours = [];
  var surgeMults = [];
  var data = [];

  $('.hour-created').each(function() {
    hours.push(parseInt($(this).html()));
  });

  $('.surge-multiplier').each(function() {
    surgeMults.push(parseFloat($(this).html()));
  });

  for (i = 0; i < hours.length; i += 1) {
    var obj = {};
    obj.hour = hours[i];
    obj.surge = surgeMults[i];
    data.push(obj);
  }

  console.log(hours);
  console.log(surgeMults);
  console.log(data);

  var x = d3.scale.linear()
    .domain([0, d3.max(surgeMults)])
    .range([0, $('.center').width()]);

  d3.select('.chart')
  .selectAll('div')
    .data(data)
  .enter().append('div')
    .style('width', function(d) {
      return x(d.surge) + "px";
    })
    .text(function(d) {
      return d.surge;
    });

});