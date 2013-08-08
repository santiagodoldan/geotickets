@Geoticket.controller 'TicketsIndexCtrl', ($scope, $route, EpicTicket, Story) ->

  $scope.story = Story.get(id: $route.current.params.story_id)
  $scope.tickets = EpicTicket.query($route.current.params)

  $scope.addTicket = (ticket) ->
    $scope.tickets[$scope.tickets.length] = ticket

.$inject = ['$scope', '$route', 'EpicTicket', 'Story']