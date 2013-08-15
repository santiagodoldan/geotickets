@Geoticket.controller 'UsersCtrl', ($scope, $route, User) ->

  $scope.user= User.get({id: $route.current.params.user_id});

# UsersCtrl's Dependency Injection
#
.$inject = ['$scope', '$route', 'User']