
Geoticket.factory('WorkedHour', ['$resource', function($resource) {

  return $resource(Routes.worked_hour_path(':id'), {id: '@id'});

}]);

Geoticket.factory('User', ['$resource', function($resource) {

  return $resource(Routes.user_path(':id'), {id: '@id'});

}]);

Geoticket.factory('Ticket', ['$resource', function($resource) {

  return $resource(Routes.ticket_path(':id'), {id: '@id'});

}]);

Geoticket.factory('Tag', ['$resource', function($resource) {

  return $resource(Routes.tag_path(':id'), {id: '@id'});

}]);


Geoticket.factory('hour', function() {

  var splitHours = function(hours) {
    if (hours === undefined)
      return [];
    else
      return hours.split(':');
  };

  return {
    convertNumber: function(number) {
      var time = splitHours(number);

      if (time.length == 1)
        return parseFloat(time[0]);
      else
        return parseFloat(time[0]) + (parseFloat(time[1]) / 60);
    }
  };
});
