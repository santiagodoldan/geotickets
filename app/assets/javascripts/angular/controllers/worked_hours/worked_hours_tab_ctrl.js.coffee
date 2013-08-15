# Worked hours tabs controller.
#
@Geoticket.controller 'WorkedHourTabCtrl', ($scope) ->
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
    $scope.tabs[$scope.tabs.length] = {
      name: day.toString('dd - dddd'),
      date: day.toString('yyyy-MM-dd'),
      active: day.equals($scope.datepicker)
    }

  # Redraw all tabs and its associated hours when
  #   datepicker changed its date.
  #
  $scope.$watch 'datepicker', (_new, _old) ->
    # FIX for strange bug when selecting a date using the datepicker
    #   retrieves 1 day ago as the selected one.
    $scope.datepicker.add(1).day().set({hour: 0})

    generateTabs($scope.datepicker) if _new

.$inject = ['$scope']
