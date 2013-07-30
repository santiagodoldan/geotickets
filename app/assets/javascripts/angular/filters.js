
Geoticket.filter('showValueOrNone', [function() {

  return function(value) {
    if (value === undefined)
      return 'None'
    else
      return value
  };

}]);

Geoticket.filter('hoursAndMinutes', [function() {
  return function(number) {
    if (number === undefined)
      return null;

    var hours_and_minutes = number.split('.')

    if (hours_and_minutes.length == 1) {
      return hours_and_minutes[0] + ":00"
    } else {
      minutes = String(Math.round((parseFloat("0." + hours_and_minutes[1]) * 60)))
      
      if (minutes.length == 1)
        minutes = "0" + minutes

      return hours_and_minutes[0] + ":" + minutes;
    }
  };
}]);
