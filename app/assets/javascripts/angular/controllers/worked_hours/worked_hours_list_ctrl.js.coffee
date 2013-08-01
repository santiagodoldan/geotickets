@Geoticket.controller 'WorkedHoursListCtrl', [
  '$scope', 'WorkedHour', 'Ticket', 'Tag', ($scope, WorkedHour, Ticket, Tag) ->

    $scope.worked_hours= WorkedHour.query();
    $scope.tickets= Ticket.query();
    $scope.tags= Tag.query();

    $scope.new = (workedHour) ->
      $scope.worked_hours[$scope.worked_hours.length] = WorkedHour.save(workedHour);


    $scope.remove = (index) ->
      id = $scope.worked_hours[index].id

      WorkedHour.remove({id: id})
      $scope.worked_hours.splice(index, 1)


    $scope.edit = (index) ->
      console.info(22)


]
