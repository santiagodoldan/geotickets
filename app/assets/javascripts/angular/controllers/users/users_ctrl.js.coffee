@Geoticket.controller 'UsersCtrl', ['$scope', '$route', 'User', ($scope, $route, Users) ->

  $scope.user= Users.get({id: $route.current.params.user_id});

]