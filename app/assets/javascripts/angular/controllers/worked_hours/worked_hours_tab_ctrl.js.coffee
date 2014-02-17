# Worked hours tabs controller.
#
@Geoticket.controller 'WorkedHourTabCtrl', ($scope, $filter, WorkedHour) ->
  $scope.datepicker = (1).day().ago()
  $scope.tabs = []

  # Generates for given date its associated week from monday to friday.
  #
  generateTabs = (date) ->
    $scope.tabs = []  
    new_date = date.clone()

    new_date.previous().monday() if new_date.getDay() != 1

    # Generates tabs from Monday to Friday.
    #
    _(5).times ->
      addDay(new_date)
      new_date = new_date.next().day()

  # Tab shared data.
  #
  addDay = (day) ->
    actual_index = $scope.tabs.length

    $scope.tabs[actual_index] = {
      name: day.toString('dd - ddd'),
      date: day.toString('yyyy-MM-dd'),
      active: day.equals($scope.datepicker)
    }

    WorkedHour.hours_by_day {on: day.toString('yyyy-MM-dd')}, (hours) ->
      $scope.tabs[actual_index]['hours'] = $filter('hoursAndMinutes')(hours.amount)

  #
  #
  $scope.$on 'refresh_tab', ->
    _.each $scope.tabs, (tab) ->
      WorkedHour.hours_by_day {on: tab.date}, (hours) ->
        tab['hours'] = $filter('hoursAndMinutes')(hours.amount)

  # Moves to previous week.
  #
  $scope.previousWeek = ->
    $scope.datepicker = angular.copy($scope.datepicker).add(-8).day()

  # Moves to next week.
  #
  $scope.nextWeek = ->
    $scope.datepicker = angular.copy($scope.datepicker).add(6).day()

  # Redraw all tabs and its associated hours when
  #   datepicker changed its date.
  #
  $scope.$watch 'datepicker', (_new, _old) ->
    # FIX for strange bug when selecting a date using the datepicker
    #   retrieves 1 day ago as the selected one.
    $scope.datepicker.add(1).day().set({hour: 0})

    generateTabs($scope.datepicker) if _new

.$inject = ['$scope', '$filter', 'WorkedHour']
