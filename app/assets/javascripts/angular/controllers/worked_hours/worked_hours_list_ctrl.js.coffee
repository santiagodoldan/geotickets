# Worked hours list and creation.
#
@Geoticket.controller 'WorkedHoursListCtrl', ($scope, $timeout, hours, WorkedHour, SprintTicket, Tag) ->
  
  $scope.worked_hours = {}
  $scope.current_date = Date.today()
  $scope.tags = Tag.query()

  # Creates a new hours with given data.
  #
  $scope.new = (workedHour) ->
    $scope.worked_hours[$scope.worked_hours.length] = WorkedHour.save(workedHour)

  # Remove selected row.
  #
  $scope.remove = (index) ->
    id = $scope.worked_hours[index].id

    WorkedHour.remove({id: id})
    $scope.worked_hours.splice(index, 1)

  # Update selected row.
  #
  $scope.update = (index) ->
    worked_hour = $scope.worked_hours[index]
    worked_hour.amount= hours.convertNumber(String(worked_hour.amount))
    worked_hour.editing= false

    worked_hour.$update()

  # Verticals days changed.
  #
  $scope.changeDay = (date) ->
    $scope.current_date = date

    $scope.worked_hours = WorkedHour.query({on: date})

  # Returns the sum of each worked hour amount.
  #
  $scope.sumHours = ->
    _.reduce $scope.worked_hours, (sum, wh) ->
      sum + Number(hours.convertNumber(String(wh.amount)))
    , 0

  # Retrieve associated tickets for current sprint.
  #
  $scope.$watch 'sprint.id', ->
    $timeout ->
      $scope.tickets = SprintTicket.query({sprint_id: $scope.sprint.id}) if $scope.sprint.id

# WorkedHoursListCtrl's Dependency Injection
#
.$inject = ['$scope', '$timeout', 'hours', 'WorkedHour', 'SprintTicket', 'Tag']