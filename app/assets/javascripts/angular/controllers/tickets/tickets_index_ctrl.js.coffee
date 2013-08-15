#
#
#
@Geoticket.controller 'TicketsIndexCtrl', ($scope, Ticket) ->

  #
  #
  $scope.init = (story_id) ->
    $scope.story_id = story_id
    $scope.tickets = Ticket.query({story_id: story_id})

  #
  #
  $scope.add = (ticket) ->
    $scope.tickets[$scope.tickets.length] = ticket

  #
  #
  $scope.remove = (index) ->
    id = $scope.tickets[index].id

    Ticket.delete {story_id: $scope.story_id, id: id}, ->
      $scope.tickets.splice(index, 1)

.$inject = ['$scope', 'Ticket']