
Geoticket.config(['$routeProvider', function($routeProvider) {

  $routeProvider.
    when('/', {
      controller: 'WorkedHoursListCtrl',
      templateUrl: Routes.worked_hours_path({format: 'angr'})
    }).
    
    when('/users/:user_id', {
      controller: 'UsersCtrl',
      templateUrl: '/assets/templates/users/show.html'
    }).

    otherwise({redirectTo: '/'})

}]);