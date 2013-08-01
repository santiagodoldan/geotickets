@Geoticket.controller 'WorkedHoursCtrl', ['$scope', 'hour', ($scope, hour) ->
  $scope.worked_hour= {}

  $scope.submit = ->
    $scope.worked_hour.amount= hour.convertNumber($scope.worked_hour.amount)
    $scope.new($scope.worked_hour)

]