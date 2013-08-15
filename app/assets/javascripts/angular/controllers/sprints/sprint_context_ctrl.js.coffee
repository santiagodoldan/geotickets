# Manages sprint context changes.
#   When load for first time it has the active one.
#
@Geoticket.controller 'SprintContextCtrl', ($scope, $location, Sprint, UserAuth) ->

  $scope.authenticated= UserAuth.isAuthenticated()

  $scope.sprints= Sprint.query()

  # TODO find a better solution to retrieve the active sprint at first load.
  #
  $scope.sprint= Sprint.get({id: 'non_id', active: true})

  # Triggered when selected Sprint has changed.
  #
  $scope.$watch 'sprint.id', (_new, _old) ->
    $location.path(Routes.sprint_path({id: _new})) if _new

  # Triggered on every current user status change.
  #
  $scope.$on 'USER_STATUS', (event, status) ->
    $scope.authenticated= status

.$inject = ['$scope', '$location', 'Sprint', 'UserAuth']
