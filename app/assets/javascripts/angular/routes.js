
Geoticket.config(['$routeProvider', function($routeProvider) {

  $routeProvider.
    when('/', {
      controller: 'StoriesIndexCtrl',
      templateUrl: '/assets/templates/stories/index.html'
    }).

    when('/epics/:story_id/tickets', {
      controller: 'TicketsIndexCtrl',
      templateUrl: '/assets/templates/tickets/index.html'
    }).

    when('/users/:user_id', {
      controller: 'UsersCtrl',
      templateUrl: '/assets/templates/users/show.html'
    }).

    otherwise({redirectTo: '/'})

}]);