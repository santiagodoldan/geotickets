#
#
#
@Geoticket.controller 'StoriesIndexCtrl', ($scope, $route, Story, Ticket) ->

  $scope.stories = Story.query($route.current.params)

  #
  #
  $scope.add = (story) ->
    $scope.stories[$scope.stories.length] = story


  #
  #
  #
  $scope.remove = (index) ->
    id = $scope.stories[index].id

    Story.delete {sprint_id: $route.current.params.sprint_id, id: id}, ->
      $scope.stories.splice(index, 1)

.$inject = ['$scope', '$route', 'Story', 'Ticket']