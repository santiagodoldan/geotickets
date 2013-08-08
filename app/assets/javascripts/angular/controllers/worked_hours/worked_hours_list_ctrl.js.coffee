@Geoticket.controller 'WorkedHoursListCtrl', ($scope, WorkedHour, Ticket, Tag) ->
  
  $scope.current_date = Date.today()

  $scope.tickets = Ticket.query()
  $scope.tags = Tag.query()

  $scope.new = (workedHour) ->
    $scope.worked_hours[$scope.worked_hours.length] = WorkedHour.save(workedHour)

  $scope.remove = (index) ->
    id = $scope.worked_hours[index].id

    WorkedHour.remove({id: id})
    $scope.worked_hours.splice(index, 1)

  $scope.edit = (index) ->
    console.info(22)

  $scope.changeDay = (date) ->
    $scope.current_date = date
    $scope.worked_hours = WorkedHour.query({on: date})

# WorkedHoursListCtrl's Dependency Injection
#
.$inject = ['$scope', 'WorkedHour', 'Ticket', 'Tag']