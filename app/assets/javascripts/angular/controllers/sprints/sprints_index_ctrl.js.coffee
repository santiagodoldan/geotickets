@Geoticket.controller 'SprintsIndexCtrl', ($scope, $route) ->

  if $route.current.params?.sprint_id
    $scope.$emit 'SET_SPRINT_CONTEXT', $route.current.params.sprint_id

.$inject = ['$scope', '$route']
