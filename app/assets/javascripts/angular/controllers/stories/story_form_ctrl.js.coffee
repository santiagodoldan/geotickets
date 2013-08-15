#
#
#
@Geoticket.controller 'StoryFormCtrl', ($scope, $route, Story) ->
  $scope.story = {}

  #
  #
  $scope.submit = ->
    story = angular.copy($scope.story)

    $scope.story = {}

    Story.save {sprint_id: $route.current.params.sprint_id}, story, (story) ->
      $scope.add(story)

.$inject = ['$scope', '$route', 'Story']