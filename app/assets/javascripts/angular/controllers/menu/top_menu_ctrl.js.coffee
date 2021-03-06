# Manage all the actions for the top menu bar.
#
@Geoticket.controller 'TopMenuCtrl', ($scope, $location, UserAuth) ->

  # Redirects to current sprint associated stories index page.
  #
  $scope.redirectToStories = ->
    $location.path(Routes.sprint_stories_path($scope.sprint.id))

  # Redirects to the reports page.
  #
  $scope.redirectToReports = ->
    $location.path(Routes.sprint_reports_path($scope.sprint.id))

  $scope.redirectToSprints = ->
    $location.path(Routes.sprints_path())

  # Redirects to the sprints page.
  #
  $scope.redirectToSprints = ->
    $location.path(Routes.sprints_path())

  # Logs out current user and redirects to the login page.
  #
  $scope.logout = ->
    UserAuth.logout()

    # Emit to parent's controllers.
    #
    $scope.$emit('USER_STATUS', false)

.$inject = ['$scope', '$location', 'UserAuth']