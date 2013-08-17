# Shows the report associated with current sprint context.
#
@Geoticket.controller 'ReportsIndexCtrl', ($scope, $route, SprintTicket) ->

  $scope.tickets = SprintTicket.query($route.current.params)

  if $route.current.params?.sprint_id
    $scope.$emit 'SET_SPRINT_CONTEXT', $route.current.params.sprint_id

.$inject = ['$scope', '$route', 'SprintTicket']