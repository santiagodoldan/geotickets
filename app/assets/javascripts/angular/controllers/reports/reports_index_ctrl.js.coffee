# Shows the report associated with current sprint context.
#
@Geoticket.controller 'ReportsIndexCtrl', ($scope, $route, Tag, SprintWorkedHour) ->

  $scope.tags = Tag.query()
  $scope.worked_hours_by_ticket = {}

  SprintWorkedHour.query $route.current.params, (data) ->
    groups = {}

    # Iterate for each worked hour to group by its associated ticket.
    #
    _.each data, (wh) ->
      unless groups[wh.ticket_id]
        groups[wh.ticket_id] =
          ticket:       wh.ticket?.display_name,
          used:         0,
          estimated:    wh.ticket?.estimation | 0,
          difference:   wh.ticket?.estimation | 0,
          worked_hours: []

      groups[wh.ticket_id].used += Number(wh.amount)
      groups[wh.ticket_id].difference -= Number(wh.amount)
      groups[wh.ticket_id].worked_hours.push(wh)

    $scope.worked_hours_by_ticket = groups

  if $route.current.params?.sprint_id
    $scope.$emit 'SET_SPRINT_CONTEXT', $route.current.params.sprint_id

.$inject = ['$scope', '$route', 'Tag', 'SprintWorkedHour']