@Geoticket.controller 'SprintsManagementCtrl', ($scope, Sprint, Story) ->

  $scope.sprints_with_stories = {}
  $scope.sprint = {}

  # Query for last 2 sprints and its associated stories.
  #
  Sprint.query {limit: 2, order: 'desc'}, (sprints) ->
    _.each sprints, (sprint, i) ->
      Story.query {sprint_id: sprint['id']}, (stories) ->
        $scope.sprints_with_stories[sprint['id']] =
          display_name: sprint.display_name,
          stories: stories

  # Updates every dragged stories and update them with its new sprint.
  #
  $scope.applyChanges = ->
    _.each $scope.sprints_with_stories, (sprint, sprint_id) ->
      _.each sprint.stories, (story) ->
        if Number(sprint_id) != Number(story.sprint_id)
          # The path should keep with the old sprint to find it and send
          #   the new sprint_id in the payload.
          #
          old_story_id    = story.sprint_id
          story.sprint_id = Number(sprint_id)

          Story.update({sprint_id: old_story_id, id: story.id}, story)

  # Creates a new sprint as the new Active one.
  #
  $scope.submit = ->
    $scope.sprint.status = 0

    Sprint.save $scope.sprint, (sprint) ->
      $scope.sprints.push(sprint)
      $scope.sprint = {}

.$inject = ['$scope', 'Sprint', 'Story']