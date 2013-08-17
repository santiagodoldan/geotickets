# Creation of Worked hours.
#
@Geoticket.controller 'WorkedHoursCtrl', ($scope, hours) ->
  $scope.worked_hour= {}
  $scope.focus_on_hours= true

  # Creates a new WorkedHour and clear previous selections.
  #
  $scope.submit = ->
    $scope.worked_hour.on= $scope.current_date.toString('yyyy-MM-dd')
    $scope.worked_hour.amount= hours.convertNumber($scope.worked_hour.amount)

    $scope.new(angular.copy($scope.worked_hour))
    $scope.worked_hour= {}

    # Set the focus on worked hours input to aid the creation of a new hour.
    $scope.focus_on_hours= true

  # Clears populated data.
  #
  $scope.clear = ->
    $scope.worked_hour = {}

# WorkedHoursCtrl's Dependency Injection
#
.$inject = ['$scope', 'hours']