# Add and Remove Stories functionality.
#
@Geoticket.controller 'StoriesIndexCtrl', ($scope, $route, Story, Ticket) ->

  $scope.stories = Story.query($route.current.params)

  if $route.current.params?.sprint_id
    $scope.$emit 'SET_SPRINT_CONTEXT', $route.current.params.sprint_id

  # Adds a new story.
  #
  $scope.add = (story) ->
    $scope.stories[$scope.stories.length] = story


  # Remove given story.
  #
  $scope.remove = (index) ->
    id = $scope.stories[index].id

    Story.delete {sprint_id: $route.current.params.sprint_id, id: id}, ->
      $scope.stories.splice(index, 1)

.$inject = ['$scope', '$route', 'Story', 'Ticket']
