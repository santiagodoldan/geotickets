@Geoticket.controller 'TicketsCtrl', ($scope, $route, Ticket) ->
  $scope.ticket = {}

  $scope.submit = ->
    debugger
    ticket = angular.copy($scope.ticket)

    $scope.ticket = {}

    ticket.epic_id = $route.current.params.story_id
    ticket = Ticket.save(ticket)

    $scope.addTicket(ticket)

.$inject = ['$scope', '$route', 'Ticket']