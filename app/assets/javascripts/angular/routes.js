
Geoticket.config(['$routeProvider', function($routeProvider) {

  $routeProvider.
    when('/', {
      controller: 'SprintsIndexCtrl',
      templateUrl: '/assets/templates/sprints/index.html'
    }).

    when('/sprints/:sprint_id', {
      controller: 'SprintsIndexCtrl',
      templateUrl: '/assets/templates/sprints/index.html'
    }).

    when('/sprints/:sprint_id/stories', {
      controller: 'StoriesIndexCtrl',
      templateUrl: '/assets/templates/stories/index.html'
    }).

    when('/sprints/:sprint_id/tickets', {
      controller: 'ReportsIndexCtrl',
      templateUrl: '/assets/templates/reports/index.html'
    }).

    when('/login', {
      controller: 'LoginCtrl',
      templateUrl: '/assets/templates/users/login.html'
    }).

    otherwise({redirectTo: '/'})

}]);