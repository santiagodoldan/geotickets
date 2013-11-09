# Shows the report associated with current sprint context.
#
@Geoticket.controller 'ReportsIndexCtrl', ($scope, $route, Tag, Report) ->

  $scope.tags = Tag.query()
  $scope.sprint = Report.breakdown($route.current.params)

  if $route.current.params?.sprint_id
    $scope.$emit 'SET_SPRINT_CONTEXT', $route.current.params.sprint_id

.$inject = ['$scope', '$route', 'Tag', 'Report']