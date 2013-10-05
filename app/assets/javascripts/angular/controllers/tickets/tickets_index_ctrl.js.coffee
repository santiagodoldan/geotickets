# List of all tickets availables for current sprint.
#
@Geoticket.controller 'TicketsIndexCtrl', ($scope, hours, Ticket) ->

  # Look for tickets for given story.
  #
  $scope.init = (story_id) ->
    $scope.story_id = story_id
    $scope.tickets = Ticket.query({story_id: story_id})

  # Add given ticket.
  #
  $scope.add = (ticket) ->
    $scope.tickets[$scope.tickets.length] = ticket

  # Remove associated ticket for given index.
  #
  $scope.remove = (index) ->
    id = $scope.tickets[index].id

    Ticket.delete {story_id: $scope.story_id, id: id}, ->
      $scope.tickets.splice(index, 1)

  # Updates given ticket.
  #
  $scope.update = (index) ->
    ticket = $scope.tickets[index]
    ticket.estimation= hours.convertNumber(String(ticket.estimation))
    ticket.editing= false

    ticket.$update()

.$inject = ['$scope', 'hours', 'Ticket']