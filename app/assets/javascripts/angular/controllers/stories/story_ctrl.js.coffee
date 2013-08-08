@Geoticket.controller 'StoryCtrl', ($scope, Story) ->
  $scope.story = {}

  $scope.submitAndClose = ->
    $scope.submit()
    $scope.$parent.collapsed = true

  $scope.submit = ->
    story = angular.copy($scope.story)

    $scope.story = {}

    story = Story.save(story)
    $scope.addStory(story)

.$inject = ['$scope', 'Story']