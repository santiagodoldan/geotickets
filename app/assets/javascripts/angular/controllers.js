
/**
 *
 * Worked Hours
 *
 */
Geoticket.controller('WorkedHoursCtrl', ['$scope', 'hour', function($scope, hour, Ticket, Tag) {
  $scope.worked_hour= {}

  $scope.submit = function() {
    $scope.worked_hour.amount= hour.convertNumber($scope.worked_hour.amount);
    $scope.new($scope.worked_hour);
  };
  
}]);

Geoticket.controller('WorkedHoursListCtrl', [
  '$scope', 'WorkedHour', 'Ticket', 'Tag', function($scope, WorkedHour, Ticket, Tag) {
  
  $scope.worked_hours= WorkedHour.query();
  $scope.tickets= Ticket.query();
  $scope.tags= Tag.query();

  $scope.new = function(workedHour) {
    $scope.worked_hours[$scope.worked_hours.length] = WorkedHour.save(workedHour);
  };

  $scope.remove = function(index) {
    var id = $scope.worked_hours[index].id;

    WorkedHour.remove({id: id});
    $scope.worked_hours.splice(index, 1);
  };

  $scope.edit = function(index) {
    console.info(22);
  };

}]);

/**
 *
 * Users
 *
 */
Geoticket.controller('UsersCtrl', ['$scope', '$route', 'User', function($scope, $route, Users) {

  $scope.user= Users.get({id: $route.current.params.user_id});

}]);