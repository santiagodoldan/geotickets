#
#
#
@Geoticket.controller 'TicketFormCtrl', ($scope, $route, Ticket) ->
  
  $scope.ticket = {}

  #
  #
  $scope.submit = ->
    ticket = angular.copy($scope.ticket)

    $scope.ticket   = {}
    ticket.story_id = $scope.story_id
  
    ticket = Ticket.save {story_id: $scope.story_id}, ticket, (ticket) ->
      $scope.add(ticket)

.$inject = ['$scope', '$route', 'Ticket']
