
Geoticket.config(['$routeProvider', function($routeProvider) {

  $routeProvider.
    when('/', {
      controller: 'WorkedHoursListCtrl',
      templateUrl: '/assets/templates/worked_hours/index.html'
    }).
    
    when('/users/:user_id', {
      controller: 'UsersCtrl',
      templateUrl: '/assets/templates/users/show.html'
    }).

    otherwise({redirectTo: '/'})

}]);