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

});