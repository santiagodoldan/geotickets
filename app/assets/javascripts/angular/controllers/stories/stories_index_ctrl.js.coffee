@Geoticket.controller 'StoriesIndexCtrl', ($scope, $location, Story) ->
  $scope.stories= Story.query()

  #
  #
  $scope.addStory = (story) ->
    $scope.stories[$scope.stories.length] = story

  # Observes story_id attr for future changes and redirects
  #   to the selected story context.
  #
  $scope.$watch 'story_id', (_new, _old) ->
    unless _.isNull(_new) || _.isUndefined(_new) || _.isEmpty(_new)
      $location.path(Routes.epic_tickets_path(_new))

.$inject = ['$scope', '$location', 'Story']