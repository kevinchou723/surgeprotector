$(document).ready(function() {

  var hours = [];
  var surges = [];
  var data = [];

  $('.hour').each(function() {
    hours.push($(this).html());
  });

  $('.surge').each(function() {
    surges.push(parseFloat($(this).html()));
  });

  // format each data point into an object and push into the data array
  for (i = 0; i < hours.length; i += 1) {
    var obj = {};
    obj.hour = hours[i];
    obj.surge = surges[i];
    data.push(obj);
  }

  console.log(data);


    // CHART.JS LOGIC BELOW

  var chartData = {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
          {
              label: "My First dataset",
              fillColor: "rgba(220,220,220,0)",
              strokeColor: "rgba(220,220,220,0)",
              pointColor: "red",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: [65, 59, 80, 81, 56, 55, 40]
          },
          {
              label: "My Second dataset",
              fillColor: "rgba(151,187,205,0)",
              strokeColor: "rgba(151,187,205,0)",
              pointColor: "blue",
              pointStrokeColor: "black",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(151,187,205,0)",
              data: [28, 48, 40, 19, 86, 27, 90]
          }
      ]
  };

  var options = {

      ///Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines : false,

      // //String - Colour of the grid lines
      // scaleGridLineColor : "rgba(0,0,0,.05)",

      // String - Colour of the scale line
      scaleLineColor: "rgba(0,0,255,.9)",

      // String - Scale label font colour
      scaleFontColor: "red",

      //Number - Width of the grid lines
      scaleGridLineWidth : 1,

      //Boolean - Whether the line is curved between points
      bezierCurve : true,

      //Number - Tension of the bezier curve between points
      bezierCurveTension : 0.4,

      //Boolean - Whether to show a dot for each point
      pointDot : true,

      //Number - Radius of each point dot in pixels
      pointDotRadius : 6,

      //Number - Pixel width of point dot stroke
      pointDotStrokeWidth : 1,

      //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
      pointHitDetectionRadius : 20,

      //Boolean - Whether to show a stroke for datasets
      datasetStroke : true,

      //Number - Pixel width of dataset stroke
      datasetStrokeWidth : 2,

      //Boolean - Whether to fill the dataset with a colour
      datasetFill : true,

      //String - A legend template
      legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

  };

  // // Get context with jQuery - using jQuery's .get() method.
  // var ctx = $("#myChart").get(0).getContext("2d");
  // // This will get the first returned node in the jQuery collection.
  // var myNewChart = new Chart(ctx);

  var ctx = document.getElementById("myChart").getContext("2d");
  var myLineChart = new Chart(ctx).Line(chartData, options);

});