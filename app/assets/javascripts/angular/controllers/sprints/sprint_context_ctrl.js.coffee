# Manages sprint context changes.
#   When being at the root page it load the active sprint as default.
#
@Geoticket.controller 'SprintContextCtrl', ($scope, $location, Sprint, UserAuth) ->

  $scope.authenticated= UserAuth.isAuthenticated()
  $scope.sprints= Sprint.query()
  $scope.sprint= {}

  # Look for the active sprint only being at the root page.
  #
  if $location.path() == '/'
    $scope.sprint= Sprint.get({id: 'non_id', active: true})

  # Triggered when selected Sprint has changed.
  #
  $scope.changeSprint = ->
    $location.path(Routes.sprint_path($scope.sprint)) if $scope.sprint.id

  # Triggered when other controller has detected that the current
  #   route is in the context of an existing sprint.
  #
  $scope.$on 'SET_SPRINT_CONTEXT', (event, id) ->
    $scope.sprint= Sprint.get({id: id})

  # Triggered on every current user status change.
  #
  $scope.$on 'USER_STATUS', (event, status) ->
    $scope.authenticated= status

.$inject = ['$scope', '$location', 'Sprint', 'UserAuth']
